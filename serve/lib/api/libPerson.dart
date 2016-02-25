import "dart:async";
import "dbObject.dart";
import "DateUtil.dart";

class libPerson {
  /*
   *  CREATE
   *  - Add new person to db with no pre-existing Party
   *  - Add new person to db with pre-existing Party
   *  + Add new name to a person's records
   *  - Add new gender to a person's records
   *  - Add new Organization Association
   */

  static Future<Person> addPerson() async {
    Dev.message("Entering addPerson()");

    Party newParty = new Party();
    await db.avo.create(newParty).then((pkValue) {
      newParty.id = pkValue;
    });

    Dev.message("Created party");
    Dev.message(newParty.toString());
    Dev.message("New Party's ID: ${newParty.id}");

    Person newPerson = new Person();
    newPerson.Party_id = newParty.id;
    await db.avo.create(newPerson).then((pkValue) async {
      Dev.message("New Person's ID: $pkValue");
      newPerson = await db.avo.readById(Person, pkValue);
      Dev.message("New Person: " + newPerson.toString());
    });
    return newPerson;
  }

  static Future addName(int id, String name,
      {DateTime from: null, DateTime thru: null}) async {
    from ??= DateUtil.today();

    Dev.message("Entering addName()");
    Dev.message("ID: $id");
    Dev.message("Name: $name");
    Dev.message("Date_From: $from");
    Dev.message("Date_Thru: $thru");

    Person_Name newName = new Person_Name();
    newName
      ..Person_id = id
      ..name = name
      ..from_date = DateUtil.tokenize(from)
      ..thru_date = DateUtil.tokenize(thru);
    db.avo.create(newName).then((v) {}, onError: (err) {
      Log.error("Error creating new name. E($err)");
    });
  }

  static Future addGender(int id, String gender,
      {DateTime from: null, DateTime thru: null}) async {
    from ??= DateUtil.today();

    Dev.message("Entering setGender()");
    Dev.message("ID: $id");
    Dev.message("Gender: " + gender);
    Dev.message("Date_From: $from");
    Dev.message("Date_Thru: $thru");

    var genderFilter = [new Filter("name", "Male")];
    Dev.message("genderFilter list built: " + genderFilter.toString());
    List<Gender_Type> genders =
        await db.avo.read(Gender_Type, filters: genderFilter);

    //TODO: Add gender to list if genders.length == 0
    Dev.message("genders list compiled");

    Gender_Association newAssoc = new Gender_Association();
    newAssoc
      ..Person_id = id
      ..Gender_Type_id = genders.first.id
      ..from_date = DateUtil.tokenize(from)
      ..thru_date = DateUtil.tokenize(thru);
    db.avo.create(newAssoc).then((pkValue) {}, onError: (e) {
      Log.error("Error adding Gender_Association E($e)");
    });
  }

  static Future addOrganization(int id, {int org_id: null}) async {
    Dev.message("Entering addOrganization()");
    Dev.message("ID:" + id);
    Dev.message("Organization_id: " + org_id);

    Organization_Person_Association newAssoc =
        new Organization_Person_Association();
    newAssoc
      ..Person_id = id
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
    Dev.message("ID: $id");

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
    Dev.message("ID: $id");

    Person tmp = getPerson(id);
    return tmp.party;
  }

  static Future<String> getName(int id, {DateTime date: null}) async {
    date ??= DateUtil.today();

    Dev.message("Entering getName()");
    Dev.message("ID:" + id);
    Dev.message("Date: " + date);

    return (await getNames(id, date: date)).first;
  }

  static Future<List<String>> getNames(int id, {DateTime date: null}) async {
    date ??= DateUtil.today();

    Dev.message("Entering getNames()");
    Dev.message("ID:" + id);
    Dev.message("Date: " + date);

    List<String> collected = [];

    filters = [new Filter("Person_id", id)];
    List<Person_Name> names = await db.avo.read(Person_Name, filters: filters);
    names.forEach((Person_Name f) {
      if (DateUtil.parseText(f.from_date) <= date &&
          DateUtil.parseText(f.thru_date) >= date) {
        collected.add(f.name);
      }
    });
    return collected;
  }

  static Future<Gender_Type> getGender(int id, {date: null}) async {
    date ??= DateUtil.today();

    Dev.message("Entering getGender()");
    Dev.message("ID: $id");
    Dev.message("Date: " + date);

    return (await getGenders(id, date: date)).first;
  }

  static Future<List<Gender_Type>> getGenders(int id, {date: null}) async {
    date ??= DateUtil.today();

    Dev.message("Entering getGenders()");
    Dev.message("ID: $id");
    Dev.message("Date: " + date);

    List<Gender_Type> collected = [];

    filters = [new Filter("Person_id", id)];
    List<Gender_Association> assoc =
        await db.avo.read(Gender_Association, filters: filters);
    assoc.forEach((Gender_Association f) async {
      if (f.from_date <= date && f.thru_date >= date) {
        collected.add(await db.avo.readById(Gender_Type, f.Gender_Type_id));
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

  static Future<bool> setNameStart(int id, String name,
      {DateTime date: null}) async {
    date ??= DateUtil.today();

    Dev.message("Entering setNameStart()");
    Dev.message("ID: $id");
    Dev.message("Name:" + name);
    Dev.message("Date:" + date);

    var filters = [new Filter("Person_id", id), new Filter("name", name)];
    List<Person_Name> names = await db.avo.read(Person_Name, filters: filters);
    names.forEach((Person_Name f) {
      f.from_date = DateUtil.tokenize(date);
      f.update();
    });
  }

  static Future<bool> setNameEnd(int id, String name,
      {DateTime date: null}) async {
    date ??= DateUtil.today();

    Dev.message("Entering setNameEnd()");
    Dev.message("ID: $id");
    Dev.message("Name:" + name);
    Dev.message("Date:" + date);

    var filters = [new Filter("Person_id", id), new Filter("name", name)];
    List<Person_Name> names = await db.avo.read(Person_Name, filters: filters);
    names.forEach((Person_Name f) {
      f.thru_date = DateUtil.tokenize(date);
      f.update();
    });
  }

  static Future<bool> setGenderStart(int id, String gender,
      {DateTime date: null}) async {
    date ??= DateUtil.today();

    Dev.message("Entering setGenderStart()");
    Dev.message("ID: $id");
    Dev.message("Gender:" + gender);
    Dev.message("Date: $date");

    var genderFilter = [new Filter("name", gender)];
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
        g.from_date = DateUtil.tokenize(date);
        g.update().then((f) {
          Dev.message("Date on leaving start date: " + date.toString());
          return true;
        }, onError: (e) {
          return false;
        });
      });
    });
  }

  static Future<bool> setGenderEnd(int id, String gender,
      {DateTime date: null}) async {
    date ??= DateUtil.today();

    Dev.message("Entering setGenderEnd()");
    Dev.message("ID: $id");
    Dev.message("Gender:" + gender);
    Dev.message("Date:" + date.toString());

    var genderFilter = [new Filter("name", gender)];
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
        g.thru_date = DateUtil.tokenize(date);
        Dev.message("Why is this not tokenizing properly?");
        g.update().then((f) {
          return true;
        }, onError: (e) {
          Dev.error("Error setting gender end date E(" + e.toString() + ")");
          return false;
        });
      });
    });
  }

  static Future<bool> setOrgStart(int id, int org_id,
      {DateTime date: null}) async {
    date ??= DateUtil.today();

    Dev.message("Entering setOrgStart()");
    Dev.message("ID: $id");
    Dev.message("Organization_id: $org_id");
    Dev.message("Date: $date");

    var filters = [
      new Filter("Person_id", id),
      new Filter("Organization_id", org_id)
    ];
    List<Organization_Person_Association> assoc =
        await db.avo.read(Organization_Person_Association, filters: filters);
    assoc.forEach((Organization_Person_Association f) {
      f.from_date = DateUtil.tokenize(date);
      f.update();
    });
  }

  static Future<bool> setOrgEnd(int id, int org_id,
      {DateTime date: null}) async {
    date ??= DateUtil.today();

    Dev.message("Entering setOrgEnd()");
    Dev.message("ID: $id");
    Dev.message("Organization_id:" + org_id);
    Dev.message("Date:" + date);

    var filters = [
      new Filter("Person_id", id),
      new Filter("Organization_id", org_id)
    ];
    List<Organization_Person_Association> assoc =
        await db.avo.read(Organization_Person_Association, filters: filters);
    assoc.forEach((Organization_Person_Association f) {
      f.thru_date = DateUtil.tokenize(date);
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
    Dev.message("ID: $id");

    Person tar = await db.avo.readById(Person, id);
    tar.delete();
  }

  static Future dropName(int id, String name) async {
    Dev.message("Entering dropName()");
    Dev.message("ID: $id");
    Dev.message("Name:" + name);

    var filters = [new Filter("Person_id", id), new Filter("name", name)];
    List<Person_Name> names = await db.avo.read(Person_Name, filters: filters);
    names.forEach((Person_Name f) {
      f.delete();
    });
  }

  static Future disassociateGender(int id, String gender_name) async {
    Dev.message("Entering disassociateGender()");
    Dev.message("ID: $id");
    Dev.message("Gender:" + gender_name);

    var genderFilter = [new Filter("name", gender_name)];

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
    Dev.message("ID: $id");
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
