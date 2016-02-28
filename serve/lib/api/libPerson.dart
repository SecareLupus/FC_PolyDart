import "dart:async";
import "dbObject.dart";

/*
 *  CREATE
 *  - Add new person to db with no pre-existing Party
 *  - Add new person to db with pre-existing Party
 *  + Add new name to a person's records
 *  - Add new gender to a person's records
 *  - Add new Organization Association
 */

Future<bool> addPerson([int party_id = null]) {
  Dev.message("Entering addPerson()");
  Dev.message("Party_ID: " + party_id);

  if (party_id == null) {
    //create party first
  } else {
    //check if party is already referenced, then create person referencing it,
    // if not.
  }
}

Future<bool> addName(int id, String name,
    {DateTime from: null, DateTime thru: null}) async {
  from ??= new DateTime.now();

  Dev.message("Entering setName()");
  Dev.message("ID:" + id);
  Dev.message("Name: " + name);
  Dev.message("Date_From: " + from);
  Dev.message("Date_Thru: " + thru);

  Person obj = await db.avo.readById(Person, id);
  Person_Name tar = new Person_Name();
  tar.Person_id = obj.id
    ..name = name
    ..from_date = from
    ..thru_date = thru;
  var pk = await db.avo.create(tar);
  return true;
}

Future<bool> addGender(int id, String gender,
    {DateTime from: null, DateTime thru: null}) async {
  from ??= new DateTime.now();

  Dev.message("Entering setGender()");
  Dev.message("ID:" + id);
  Dev.message("Gender: " + gender);
  Dev.message("Date_From: " + from);
  Dev.message("Date_Thru: " + thru);

  Person obj = await db.avo.readById(Person, id);
  var filters = [
    new Filter('name', gender)
  ];
  List<Gender_Type> possible_genders = await db.avo.read(Gender_Type, filters: filters);
  if (possible_genders.length == 0) {
    //add gender to gender type
  } else {
    //set variable to gender type's id.
  }
  //create a gender association with the proper dates
  //it should use a gender_type id, either the one we were able to match, or
  //the new one we created.

  tar.Person_id = obj.id
    ..name = name
    ..from_date = from
    ..thru_date = thru;
  var pk = await db.avo.create(tar);
  return true;
}

Future<bool> addOrganization(int id, {int org_id: null}) async {
  Dev.message("Entering addOrganization()");
  Dev.message("ID:" + id);
  Dev.message("Organization_id: " + org_id);

  //add an association between the given person and the given organization.
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

Future<Person> getPerson(int id) async {
  Dev.message("Entering getPerson()");
  Dev.message("ID: " + id);

  return await db.avo.readById(Person, id);
}

Future<List<Person>> getPeople({filters: null}) async {
  Dev.message("Entering getPeople()");
  Dev.message("Filters: " + filters.toString());

  if (filters == null) {
    return await db.avo.read(Person);
  }
  return await db.avo.read(Person, filters: filters);
}

Future<Party> getPersonParty(int id) async {
  Dev.message("Entering getPersonParty()");
  Dev.message("ID: " + id);

  Person tmp = getPerson(id);
  return tmp.party;
}

Future<String> getName(int id, {DateTime date: null}) async {
  date ??= new DateTime.now();

  Dev.message("Entering getName()");
  Dev.message("ID:" + id);
  Dev.message("Date: " + date);

  Person obj = await db.avo.readById(Person, id);
  List<Person_Name> sel = obj.person_names.where((Person_Name f) {
    if (f.from_date < date) {
      if (f.thru_date == null || f.thru_date > date) {
        return true;
      }
    }
    return false;
  });
  if (sel.length == 1) {
    return sel[0].name;
  }
  throw new Error();
}

Future<List<String>> getNames(int id, {DateTime date: null}) async {
  date ??= new DateTime.now();

  Dev.message("Entering getNames()");
  Dev.message("ID:" + id);
  Dev.message("Date: " + date);

  Person obj = await db.avo.readById(Person, id);
  List<Person_Name> sel = obj.person_names.where((Person_Name f) {
    if (f.from_date < date) {
      if (f.thru_date == null || f.thru_date > date) {
        return true;
      }
    }
    return false;
  });
  List<String> names;
  sel.forEach((f) {
    names.add(f.name);
  });
  return names;
}

Future<Gender_Type> getGender(int id, {date: null}) {
  date ??= new DateTime.now();

  Dev.message("Entering getGender()");
  Dev.message("ID: " + id);
  Dev.message("Date: " + date);
  //Return single applicable gender, or throws error if more than one.
}

Future<List<Gender_Type>> getGenders(int id, {date: null}) {
  date ??= new DateTime.now();

  Dev.message("Entering getGenders()");
  Dev.message("ID: " + id);
  Dev.message("Date: " + date);
  //return a list of applicable genders.
}

/*
 *  UPDATE
 *  - Terminate active usage of a name
 *  - Terminate active usage of a gender identity
 *  - Alter dates for a given person-organization association
 *  - Terminate an active person-organization association
 */

Future<bool> setNameStart(int id, String name, {DateTime date: null}) {}
Future<bool> setNameEnd(int id, String name, {DateTime date: null}) {}
Future<bool> setGenderStart(int id, String gender, {DateTime date: null}) {}
Future<bool> setGenderEnd(int id, String gender, {DateTime date: null}) {}
Future<bool> setOrgStart(int id, int org_id, {DateTime date: null}) {}
Future<bool> setOrgEnd(int id, int org_id, {DateTime date: null}) {}

/*
 *  DELETE
 *  - Delete a specific name record
 *  - Delete a specific gender identity association
 *  - Delete a specific person-organization association
 */

void removePerson(int id) {}
void removeName(int id, String name) {}
void removeGender(int id, String gender) {}
void removeOrg(int id, int org_id) {}
