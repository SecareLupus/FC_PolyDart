import "dart:async";
import "dbObject.dart";
import "DateUtil.dart";

export "dbObject.dart";

class libPerson {
  /*
   *  CREATE
   *  - Add new person to db with no pre-existing Party
   *  - Add new name to a person's records
   *  - Add new gender to a person's records
   *  - Add new Organization Association with existing organization
   */

  static Future<Person> createPerson() {
    Dev.message("Entering libPer.createPerson()");

    Party par = new Party();
    return db.avo.create(par).then((partyPK) {
      Dev.message("Party created, ID $partyPK");
      Person per = new Person()..Party_id = partyPK;
      return db.avo.create(per).then((personPK) {
        Dev.message("Person created, ID $personPK");
        return getPerson(personPK);
      });
    });
  }

  static Future<Person_Name> addName(int id, String name,
      {DateTime from: null, DateTime thru: null}) {
    from ??= DateUtil.today;

    Dev.message("Entering libPer.addName()");
    Dev.message("ID: $id");
    Dev.message("Name: $name");
    Dev.message("Date_From: $from");
    Dev.message("Date_Thru: $thru");

    Person_Name nam = new Person_Name();
    nam
      ..Person_id = id
      ..name = name
      ..from_date = DateUtil.tokenize(from)
      ..thru_date = DateUtil.tokenize(thru);
    return db.avo.create(nam).then((namePK) {
      Dev.message("Person_Name created, ID $namePK");
      return db.avo.readById(Person_Name, namePK);
    });
  }

  static Future<Gender_Association> addGender(int id, String gender,
      {DateTime from: null, DateTime thru: null}) {
    from ??= DateUtil.today;

    Dev.message("Entering libPer.setGender()");
    Dev.message("ID: $id");
    Dev.message("Gender: $gender");
    Dev.message("Date_From: $from");
    Dev.message("Date_Thru: $thru");

    var genderFilter = [new Filter("name", gender)];
    return db.avo
        .read(Gender_Type, filters: genderFilter)
        .then((List<Gender_Type> gens) {
      if (gens.length > 0) {
        return gens.first;
      } else {
        Gender_Type newGen = new Gender_Type()..name = gender;
        return db.avo
            .create(newGen)
            .then((genPK) => db.avo.readById(Gender_Type, genPK));
      }
    }).then((Gender_Type gen) {
      Gender_Association assoc = new Gender_Association();
      assoc
        ..Person_id = id
        ..Gender_Type_id = gen.id
        ..from_date = DateUtil.tokenize(from)
        ..thru_date = DateUtil.tokenize(thru);
      return db.avo.create(assoc).then((assocPK) {
        Dev.message("Gender Association created, ID $assocPK");
        return db.avo.readById(Gender_Association, assocPK);
      });
    });
  }

  static Future<Organization_Person_Association> addOrganization(
      int id, int org_id,
      {DateTime from: null, DateTime thru: null}) {
    from ??= DateUtil.today;

    Dev.message("Entering libPer.addOrganization()");
    Dev.message("ID: $id");
    Dev.message("Organization_id: $org_id");
    Dev.message("Date_From: ${from.toString()}");
    Dev.message("Date_Thru: ${thru.toString()}");

    Organization_Person_Association assoc =
        new Organization_Person_Association();
    assoc
      ..Person_id = id
      ..Organization_id = org_id
      ..from_date = DateUtil.tokenize(from)
      ..thru_date = DateUtil.tokenize(thru);
    return db.avo.create(assoc).then((assocPK) {
      Dev.message("Org_Per_Assoc created, ID $assocPK");
      return db.avo.readById(Organization_Person_Association, assocPK);
    });
  }

  /*
   *  READ
   *  - Find existing person of given id
   *  - Find all existing people meeting certain criteria
   *  - Find existing party of a given person id
   *  - Find active names for a given person for a given date
   *  - Find active gender identities for a given person for a given date
   *  - Find list of all Organizations a given person associates with for a given
   *      date
   */

  static Future<Person> getPerson(int id) {
    Dev.message("Entering libPer.getPerson()");
    Dev.message("ID: $id");

    return db.avo.readById(Person, id);
  }

  static Future<List<Person>> getPeople({filters: null}) {
    Dev.message("Entering libPer.getPeople()");
    Dev.message("Filters: " + filters.toString());

    if (filters == null) {
      Dev.message("Returning all Persons");
      return db.avo.read(Person);
    }
    Dev.message("Returning persons matching filters");
    return db.avo.read(Person, filters: filters);
  }

  static Future<int> getPartyID(int id) {
    Dev.message("Entering libPer.getPartyID()");
    Dev.message("Person ID: $id");

    return getPerson(id).then((per) => per.Party_id);
  }

  static Future<List<Person_Name>> getNames(int id, {DateTime date: null}) {
    Dev.message("Entering libPer.getNames()");
    Dev.message("ID:" + id);
    Dev.message("Date: " + date);

    List<Filter> filters = [new Filter("Person_id", id)];
    return db.avo.read(Person_Name, filters: filters).then((names) {
      if (date == null) return names;

      return names.where((Person_Name f) {
        if (DateUtil.parseText(f.from_date).isBefore(date) &&
            (DateUtil.parseText(f.thru_date).isAfter(date) ||
                f.thru_date == null)) {
          return true;
        } else {
          return false;
        }
      });
    });
  }

  static Future<List<Gender_Type>> getGenders(int id, {date: null}) {
    Dev.message("Entering libPer.getGenders()");
    Dev.message("ID: $id");
    Dev.message("Date: $date");

    List<Filter> filters = [new Filter("Person_id", id)];
    return db.avo.read(Gender_Association, filters: filters).then((assoc) {
      if (date == null) return assoc;

      List<Gender_Association> mutableAssoc = []..addAll(assoc);
      mutableAssoc.retainWhere((Gender_Association f) {
        if (DateUtil.parseText(f.from_date).isBefore(date) &&
            (DateUtil.parseText(f.thru_date).isAfter(date) ||
                f.thru_date == null)) {
          return true;
        } else {
          return false;
        }
      });
      List<Gender_Type> gens = [];
      //TODO: function is skipping down to return gens before completing
      //  the following forEach(), causing an error.
      mutableAssoc.forEach((Gender_Association f) async {
        await gens.add(await db.avo.readById(Gender_Type, f.Gender_Type_id));
      });
      return gens;
    });
  }

  /*
   *  UPDATE
   *  - Terminate active usage of a name
   *  - Terminate active usage of a gender identity
   *  - Alter dates for a given person-organization association
   *  - Terminate an active person-organization association
   */

  static Future<bool> setNameStart(int id, String name, {DateTime date: null}) {
    date ??= DateUtil.today;

    Dev.message("Entering libPer.setNameStart()");
    Dev.message("ID: $id");
    Dev.message("Name: $name");
    Dev.message("Date: ${date.toString()}");

    var filters = [new Filter("Person_id", id), new Filter("name", name)];
    return db.avo
        .read(Person_Name, filters: filters)
        .then((List<Person_Name> names) {
      names.forEach((Person_Name f) {
        f.from_date = DateUtil.tokenize(date);
        f.update().then((v) {}, onError: (e) => false);
      });
      return true;
    });
  }

  static Future<bool> setNameEnd(int id, String name, {DateTime date: null}) {
    Dev.message("Entering libPer.setNameStart()");
    Dev.message("ID: $id");
    Dev.message("Name: $name");
    Dev.message("Date: ${date.toString()}");

    var filters = [new Filter("Person_id", id), new Filter("name", name)];
    return db.avo
        .read(Person_Name, filters: filters)
        .then((List<Person_Name> names) {
      names.forEach((Person_Name f) {
        f.thru_date = DateUtil.tokenize(date);
        f.update().then((v) {}, onError: (e) => false);
      });
      return true;
    });
  }

  static Future<bool> setGenderStart(int id, String gender,
      {DateTime date: null}) {
    date ??= DateUtil.today;

    Dev.message("Entering libPer.setGenderStart()");
    Dev.message("ID: $id");
    Dev.message("Gender: $gender");
    Dev.message("Date: ${date.toString()}");

    var genderFilter = [new Filter("name", gender)];
    return db.avo
        .read(Gender_Type, filters: genderFilter)
        .then((List<Gender_Type> f) => f.first)
        .then((Gender_Type gen) {
      List<Filter> filters = [
        new Filter("Person_id", id),
        new Filter("Gender_Type_id", gen.id)
      ];
      return db.avo
          .read(Gender_Association, filters: filters)
          .then((List<Gender_Association> assoc) {
        assoc.forEach((Gender_Association g) {
          g.from_date = DateUtil.tokenize(date);
          g.update().then((v) {}, onError: (e) => false);
        });
        return true;
      });
    });
  }

  static Future<bool> setGenderEnd(int id, String gender,
      {DateTime date: null}) {
    Dev.message("Entering libPer.setGenderEnd()");
    Dev.message("ID: $id");
    Dev.message("Gender: $gender");
    Dev.message("Date: ${date.toString()}");

    var genderFilter = [new Filter("name", gender)];
    return db.avo
        .read(Gender_Type, filters: genderFilter)
        .then((List<Gender_Type> f) => f.first)
        .then((Gender_Type gen) {
      List<Filter> filters = [
        new Filter("Person_id", id),
        new Filter("Gender_Type_id", gen.id)
      ];
      return db.avo
          .read(Gender_Association, filters: filters)
          .then((List<Gender_Association> assoc) {
        assoc.forEach((Gender_Association g) {
          g.thru_date = DateUtil.tokenize(date);
          g.update().then((v) {}, onError: (e) => false);
        });
        return true;
      });
    });
  }

  static Future<bool> setOrgStart(int id, int org_id, {DateTime date: null}) {
    date ??= DateUtil.today;

    Dev.message("Entering libPer.setOrgStart()");
    Dev.message("ID: $id");
    Dev.message("Organization_id: $org_id");
    Dev.message("Date: ${date.toString()}");

    var filters = [
      new Filter("Person_id", id),
      new Filter("Organization_id", org_id)
    ];
    return db.avo
        .read(Organization_Person_Association, filters: filters)
        .then((List<Organization_Person_Association> assoc) {
      assoc.forEach((Organization_Person_Association f) {
        f.from_date = DateUtil.tokenize(date);
        f.update().then((v) {}, onError: (e) => false);
      });
      return true;
    });
  }

  static Future<bool> setOrgEnd(int id, int org_id, {DateTime date: null}) {
    Dev.message("Entering libPer.setOrgEnd()");
    Dev.message("ID: $id");
    Dev.message("Organization_id: $org_id");
    Dev.message("Date: ${date.toString()}");

    var filters = [
      new Filter("Person_id", id),
      new Filter("Organization_id", org_id)
    ];
    return db.avo
        .read(Organization_Person_Association, filters: filters)
        .then((List<Organization_Person_Association> assoc) {
      assoc.forEach((Organization_Person_Association f) {
        f.thru_date = DateUtil.tokenize(date);
        f.update().then((v) {}, onError: (e) => false);
      });
      return true;
    });
  }

  /*
   *  DELETE
   *  - Delete a specific name record
   *  - Delete a specific gender identity association
   *  - Delete a specific person-organization association
   */

  //Delete a person from the db.
  static Future<bool> dropPerson(int id) {
    Dev.message("Entering libPer.dropPerson()");
    Dev.message("ID: $id");

    return db.avo.readById(Person, id).then((Person tar) {
      tar.delete().then((f) => true, onError: (e) => false);
    });
  }

  static Future<bool> dropName(int id, String name) {
    Dev.message("Entering libPer.dropName()");
    Dev.message("ID: $id");
    Dev.message("Name: $name");

    var filters = [new Filter("Person_id", id), new Filter("name", name)];
    return db.avo
        .read(Person_Name, filters: filters)
        .then((List<Person_Name> tars) {
      tars.forEach((tar) {
        tar.delete().then((f) {}, onError: (e) => false);
      });
      return true;
    });
  }

  static Future<bool> disassociateGender(int id, String gender_name) {
    Dev.message("Entering libPer.disassociateGender()");
    Dev.message("ID: $id");
    Dev.message("Gender: $gender_name");

    List<Filter> genderFilter = [new Filter("name", gender_name)];
    return db.avo
        .read(Gender_Type, filters: genderFilter)
        .then((List<Gender_Type> gens) {
      gens.forEach((Gender_Type gen) {
        List<Filter> filters = [
          new Filter("Person_id", id),
          new Filter("Gender_Type_id", f.id)
        ];

        db.avo
            .read(Gender_Association, filters: filters)
            .then((List<Gender_Association> assoc) {
          assoc.forEach((f) {
            f.delete().then((v) {}, onError: (e) => false);
          });
        });
      });
      return true;
    });
  }

  static Future<bool> disassociateOrg(int id, int org_id) {
    Dev.message("Entering libPer.disassociateOrg()");
    Dev.message("ID: $id");
    Dev.message("Organization_id: $org_id");

    var filters = [
      new Filter("Person_id", id),
      new Filter("Organization_id", org_id)
    ];
    return db.avo
        .read(Organization_Person_Association, filters: filters)
        .then((List<Organization_Person_Association> assoc) {
      assoc.forEach((Organization_Person_Association f) {
        f.delete().then((v) {}, onError: (e) => false);
      });
      return true;
    });
  }
}
