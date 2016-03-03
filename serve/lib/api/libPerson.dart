import "dart:async";
import "dbObject.dart";

class libPerson {
  /*
   *  CREATE
   *  - Add new person to db with no pre-existing Party
   *  - Add new person to db with pre-existing Party
   *  + Add new name to a person's records
   *  - Add new gender to a person's records
   *  - Add new Organization Association
   */

  static Future<Person> addPerson([int party_id = null]) async {
    Dev.message("Entering addPerson()");
    Dev.message("Party_ID: " + party_id.toString());

    if (party_id == null) {
      Party newParty = new Party();
      await db.avo.create(newParty).then((pkValue) {
        newParty.id = pkValue;
      });
      Dev.message("Created party");
      Dev.message(newParty.toString());
      Dev.message("New Party's ID:" + newParty.id.toString());
      Person newPerson = new Person();
      newPerson.Party_id = newParty.id;
      await db.avo.create(newPerson).then((pkValue) async {
        Dev.message("New Person's ID:" + pkValue.toString());
        Person per = await db.avo.readById(Person, pkValue);
        Dev.message("New Person: " + per.toString());
        return per;
      });
    } else {
      Person newPerson = new Person();
      newPerson.Party_id = party_id;
      await db.avo.create(newPerson).then((pkValue) async {
        Dev.message("New Person's ID:" + pkValue.toString());
        Person per = await db.avo.readById(Person, pkValue);
        Dev.message("New Person: " + per.toString());
        return per;
      });
    }
  }

  static Future addName(int id, String name,
      {DateTime from: null, DateTime thru: null}) async {
    from ??= new DateTime.now();

    Dev.message("Entering setName()");
    Dev.message("ID:" + id);
    Dev.message("Name: " + name);
    Dev.message("Date_From: " + from);
    Dev.message("Date_Thru: " + thru);

    Person_Name newName = new Person_Name();
    newName..Person_id = id
      ..name = name
      ..from_date = from
      ..thru_date = thru;
    db.avo.create(newName);
  }

  static Future addGender(int id, String gender,
      {DateTime from: null, DateTime thru: null}) async {
    from ??= new DateTime.now();

    Dev.message("Entering setGender()");
    Dev.message("ID:" + id);
    Dev.message("Gender: " + gender);
    Dev.message("Date_From: " + from);
    Dev.message("Date_Thru: " + thru);

    genderFilter = [
      new Filter("name", gender)
    ];
    List<Gender_Type> genders =
      await db.avo.read(Gender_Type, filters: genderFilter);

    Gender_Association newAssoc = new Gender_Association();
    newAssoc..Person_id = id
      ..Gender_Type_id = genders.first.id
      ..from_date = from
      ..thru_date = thru;
    db.avo.create(newAssoc);
  }

  static Future addOrganization(int id, {int org_id: null}) async {
    Dev.message("Entering addOrganization()");
    Dev.message("ID:" + id);
    Dev.message("Organization_id: " + org_id);

    Organization_Person_Association newAssoc =
      new Organization_Person_Association();
    newAssoc..Person_id = id
      ..Organization_id = org_id
      ..from_date = new DateTime.now()
      ..thru_date = null;
    db.avo.create(newAssoc);
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

  static Future<Person> getPerson(int id) async {
    Dev.message("Entering getPerson()");
    Dev.message("ID: " + id);

    return await db.avo.readById(Person, id);
  }

  static Future<List<Person>> getPeople({filters: null}) async {
    Dev.message("Entering getPeople()");
    Dev.message("Filters: " + filters.toString());

    if (filters == null) {
      return await db.avo.read(Person);
    }
    return await db.avo.read(Person, filters: filters);
  }

  static Future<Party> getParty(int id) async {
    Dev.message("Entering getPersonParty()");
    Dev.message("ID: " + id);

    Person tmp = getPerson(id);
    return tmp.party;
  }

  static Future<String> getName(int id, {DateTime date: null}) async {
    date ??= new DateTime.now();

    Dev.message("Entering getName()");
    Dev.message("ID:" + id);
    Dev.message("Date: " + date);

    return (await getNames(id, date: date)).first;
  }

  static Future<List<String>> getNames(int id, {DateTime date: null}) async {
    date ??= new DateTime.now();

    Dev.message("Entering getNames()");
    Dev.message("ID:" + id);
    Dev.message("Date: " + date);

    List<String> collected = [];

    filters = [
      new Filter("Person_id", id)
    ];
    List<Person_Name> names =
      await db.avo.read(Person_Name, filters: filters);
    names.forEach((Person_Name f) {
      if (f.from_date <= date && f.thru_date >= date) {
        collected.add(f.name);
      }
    });
    return collected;
  }

  static Future<Gender_Type> getGender(int id, {date: null}) async {
    date ??= new DateTime.now();

    Dev.message("Entering getGender()");
    Dev.message("ID: " + id);
    Dev.message("Date: " + date);

    return (await getGenders(id, date: date)).first;
  }

  static Future<List<Gender_Type>> getGenders(int id, {date: null}) async {
    date ??= new DateTime.now();

    Dev.message("Entering getGenders()");
    Dev.message("ID: " + id);
    Dev.message("Date: " + date);

    List<Gender_Type> collected = [];

    filters = [
      new Filter("Person_id", id)
    ];
    List<Gender_Association> assoc =
      await db.avo.read(Gender_Association, filters: filters);
    assoc.forEach((Gender_Association f) async {
      if (f.from_date <= date && f.thru_date >= date) {
        collected.add(
          await db.avo.readById(Gender_Type, f.Gender_Type_id)
        );
      }
    });

    return collected;
  }

  /*
   *  UPDATE
   *  - Terminate active usage of a name
   *  - Terminate active usage of a gender identity
   *  - Alter dates for a given person-organization association
   *  - Terminate an active person-organization association
   */

  static Future<bool> setNameStart(int id, String name, {DateTime date: null}) async {
    date ??= new DateTime.now();

    Dev.message("Entering setNameStart()");
    Dev.message("ID: " + id);
    Dev.message("Name:" + name);
    Dev.message("Date:" + date);

    var filters = [
      new Filter("Person_id", id),
      new Filter("name", name)
    ];
    List<Person_Name> names =
      await db.avo.read(Person_Name, filters: filters);
    names.forEach((Person_Name f) {
      f.from_date = date;
      f.update();
    });
  }

  static Future<bool> setNameEnd(int id, String name, {DateTime date: null}) async {
    date ??= new DateTime.now();

    Dev.message("Entering setNameEnd()");
    Dev.message("ID: " + id);
    Dev.message("Name:" + name);
    Dev.message("Date:" + date);

    var filters = [
      new Filter("Person_id", id),
      new Filter("name", name)
    ];
    List<Person_Name> names =
      await db.avo.read(Person_Name, filters: filters);
    names.forEach((Person_Name f) {
      f.thru_date = date;
      f.update();
    });
  }

  static Future<bool> setGenderStart(int id, String gender, {DateTime date: null}) async {
    date ??= new DateTime.now();

    Dev.message("Entering setGenderStart()");
    Dev.message("ID: " + id);
    Dev.message("Gender:" + gender);
    Dev.message("Date:" + date);

    var genderFilter = [
      new Filter("name", gender)
    ];
    List<Gender_Type> genders =
      await db.avo.read(Gender_Type, genderFilter);
    genders.forEach((Gender_Type f) async {
      filters = [
        new Filter("Person_id", id),
        new Filter("Gender_Type_id", f.id)
      ];
      List<Gender_Association> assoc =
        await db.avo.read(Gender_Association, filters);
      assoc.forEach((Gender_Association g) {
        g.from_date = date;
        g.update();
      });
    });
  }

  static Future<bool> setGenderEnd(int id, String gender, {DateTime date: null}) async {
    date ??= new DateTime.now();

    Dev.message("Entering setGenderEnd()");
    Dev.message("ID: " + id);
    Dev.message("Gender:" + gender);
    Dev.message("Date:" + date);

    var genderFilter = [
      new Filter("name", gender)
    ];
    List<Gender_Type> genders =
      await db.avo.read(Gender_Type, genderFilter);
    genders.forEach((Gender_Type f) async {
      filters = [
        new Filter("Person_id", id),
        new Filter("Gender_Type_id", f.id)
      ];
      List<Gender_Association> assoc =
        await db.avo.read(Gender_Association, filters);
      assoc.forEach((Gender_Association g) {
        g.thru_date = date;
        g.update();
      });
    });
  }

  static Future<bool> setOrgStart(int id, int org_id, {DateTime date: null}) async {
    date ??= new DateTime.now();

    Dev.message("Entering setOrgStart()");
    Dev.message("ID: " + id);
    Dev.message("Organization_id:" + org_id);
    Dev.message("Date:" + date);

    var filters = [
      new Filter("Person_id", id),
      new Filter("Organization_id", org_id)
    ];
    List<Organization_Person_Association> assoc =
      await db.avo.read(Organization_Person_Association, filters);
    assoc.forEach((Organization_Person_Association f) {
      f.from_date = date;
      f.update();
    });
  }

  static Future<bool> setOrgEnd(int id, int org_id, {DateTime date: null}) async {
    date ??= new DateTime.now();

    Dev.message("Entering setOrgEnd()");
    Dev.message("ID: " + id);
    Dev.message("Organization_id:" + org_id);
    Dev.message("Date:" + date);

    var filters = [
      new Filter("Person_id", id),
      new Filter("Organization_id", org_id)
    ];
    List<Organization_Person_Association> assoc =
      await db.avo.read(Organization_Person_Association, filters);
    assoc.forEach((Organization_Person_Association f) {
      f.thru_date = date;
      f.update();
    });
  }

  /*
   *  DELETE
   *  - Delete a specific name record
   *  - Delete a specific gender identity association
   *  - Delete a specific person-organization association
   */

  //Delete a person from the db.
  static Future dropPerson(int id) async {
    Dev.message("Entering dropPerson()");
    Dev.message("ID: " + id);

    Person tar = await db.avo.readById(Person, id);
    tar.delete();
  }

  static Future dropName(int id, String name) async {
    Dev.message("Entering dropName()");
    Dev.message("ID: " + id);
    Dev.message("Name:" + name);

    var filters = [
      new Filter("Person_id", id),
      new Filter("name", name)
    ];
    List<Person_Name> names =
      await db.avo.read(Person_Name, filters: filters);
    names.forEach((Person_Name f) {
      f.delete();
    });
  }

  static Future disassociateGender(int id, String gender_name) async {
    Dev.message("Entering disassociateGender()");
    Dev.message("ID: " + id);
    Dev.message("Gender:" + gender_name);

    var genderFilter = [
      new Filter("name", gender_name)
    ];

    List<Gender_Type> genders =
      await db.avo.read(Gender_Type, filters: genderFilter);
    genders.forEach((Gender_Type f) async {
      var filters = [
        new Filter("Person_id", id),
        new Filter("Gender_Type_id", f.id)
      ];
      List<Gender_Association> assoc =
        await db.avo.read(Gender_Association, filters: filters);
      assoc.forEach((Gender_Association g) {
        g.delete();
      });
    });
  }

  static Future disassociateOrg(int id, int org_id) async {
    Dev.message("Entering disassociateOrg()");
    Dev.message("ID: " + id);
    Dev.message("Organization_id:" + org_id);

    var filters = [
      new Filter("Person_id", id),
      new Filter("Organization_id", org_id)
    ];
    List<Organization_Person_Association> assoc =
      await db.avo.read(Organization_Person_Association, filters: filters);
    assoc.forEach((Organization_Person_Association f) {
      f.delete();
    });
  }
}
