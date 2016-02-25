import "dart:async";
import "dbObject.dart";

/*
 *  CREATE
 *  - Add new person to db with no pre-existing Party
 *  - Add new person to db with pre-existing Party
 *  - Add new name to a person's records
 *  - Add new gender to a person's records
 *  - Add new Organization Association
 */

Future<bool> setName(int id, String name,
    {DateTime from: null, DateTime thru: null}) async {
  from ??= new DateTime.now();

  Person obj = await db.avo.readById(Person, id);
  Person_Name tar = new Person_Name();
  tar.Person_id = obj.id
    ..name = name
    ..from_date = from
    ..thru_date = thru;
  var pk = await db.avo.create(tar);
  return true;
}

/*
 *  READ
 *  - Find existing person of given id
 *  - Find all existing people meeting certain criteria
 *  - Find existing party of a given person id
 *  - Find active names for a given person for a given date
 *  - Find active gender identities for a given person for a given date
 *  - Find list of all Organizations a given person associates with
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

/*
 *  UPDATE
 *  - Terminate active usage of a name
 *  - Terminate active usage of a gender identity
 *  - Alter dates for a given person-organization association
 *  - Terminate an active person-organization association
 */

/*
 *  DELETE
 *  - Delete a specific name record
 *  - Delete a specific gender identity association
 *  - Delete a specific person-organization association
 */
