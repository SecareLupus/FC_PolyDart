import "dart:async";
import "dbObject.dart";
import "DateUtil.dart";

class libOrg {
  /*
   *  CREATE
   *  - Add new org to db with no pre-existing Party
   *  - Add new name to a org's records
   *  - Add new Person Association with existing person
   */

  static Future<Organization> createOrganization() {
    Dev.message("Entering libOrg.createOrganization()");

    Party par = new Party();
    return db.avo.create(par).then((partyPK) {
      Dev.message("Party created, ID $partyPK");
      Organization per = new Organization()..Party_id = partyPK;
      return db.avo.create(per).then((orgPK) {
        Dev.message("Organization created, ID $orgPK");
        return getOrganization(orgPK);
      });
    });
  }

  static Future<Organization_Name> addName(int id, String name,
      {DateTime from: null, DateTime thru: null}) {
    from ??= DateUtil.today;

    Dev.message("Entering libOrg.addName()");
    Dev.message("ID: $id");
    Dev.message("Name: $name");
    Dev.message("Date_From: $from");
    Dev.message("Date_Thru: $thru");

    Organization_Name nam = new Organization_Name();
    nam
      ..Organization_id = id
      ..name = name
      ..from_date = DateUtil.tokenize(from)
      ..thru_date = DateUtil.tokenize(thru);
    return db.avo.create(nam).then((namePK) {
      Dev.message("Organization_Name created, ID $namePK");
      return db.avo.readById(Organization_Name, namePK);
    });
  }

  static Future<Organization_Person_Association> addPerson(int id, int per_id,
      {DateTime from: null, DateTime thru: null}) {
    from ??= DateUtil.today;

    Dev.message("Entering libOrg.addPerson()");
    Dev.message("ID: $id");
    Dev.message("Person_id: $per_id");
    Dev.message("Date_From: ${from.toString()}");
    Dev.message("Date_Thru: ${thru.toString()}");

    Organization_Person_Association assoc =
        new Organization_Person_Association();
    assoc
      ..Organization_id = id
      ..Person_id = per_id
      ..from_date = DateUtil.tokenize(from)
      ..thru_date = DateUtil.tokenize(thru);
    return db.avo.create(assoc).then((assocPK) {
      Dev.message("Org_Per_Assoc created, ID $assocPK");
      return db.avo.readById(Organization_Person_Association, assocPK);
    });
  }

  /*
   *  READ
   *  - Find existing org of given id
   *  - Find all existing people meeting certain criteria
   *  - Find existing party of a given org id
   *  - Find active names for a given org for a given date
   *  - Find list of all Persons a given org associates with for a given
   *      date
   */

  static Future<Organization> getOrganization(int id) {
    Dev.message("Entering libOrg.getOrganization()");
    Dev.message("ID: $id");

    return db.avo.readById(Organization, id);
  }

  static Future<List<Organization>> getOrganizations({filters: null}) {
    Dev.message("Entering libOrg.getOrgs()");
    Dev.message("Filters: " + filters.toString());

    if (filters == null) {
      Dev.message("Returning all Organizations");
      return db.avo.read(Organization);
    }
    Dev.message("Returning orgs matching filters");
    return db.avo.read(Organization, filters: filters);
  }

  static Future<int> getPartyID(int id) {
    Dev.message("Entering libOrg.getPartyID()");
    Dev.message("Organization ID: $id");

    return getOrganization(id).then((org) => org.Party_id);
  }

  static Future<List<Organization_Name>> getNames(int id,
      {DateTime date: null}) {
    Dev.message("Entering libOrg.getNames()");
    Dev.message("ID:" + id);
    Dev.message("Date: " + date);

    List<Filter> filters = [new Filter("Organization_id", id)];
    return db.avo.read(Organization_Name, filters: filters).then((names) {
      if (date == null) return names;

      return names.where((Organization_Name f) {
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

  /*
   *  UPDATE
   *  - Terminate active usage of a name
   *  - Alter dates for a given person-organization association
   *  - Terminate an active person-organization association
   */

  static Future<bool> setNameStart(int id, String name, {DateTime date: null}) {
    date ??= DateUtil.today;

    Dev.message("Entering libOrg.setNameStart()");
    Dev.message("ID: $id");
    Dev.message("Name: $name");
    Dev.message("Date: ${date.toString()}");

    var filters = [new Filter("Organization_id", id), new Filter("name", name)];
    return db.avo
        .read(Organization_Name, filters: filters)
        .then((List<Organization_Name> names) {
      names.forEach((Organization_Name f) {
        f.from_date = DateUtil.tokenize(date);
        f.update().then((v) {}, onError: (e) => false);
      });
      return true;
    });
  }

  static Future<bool> setNameEnd(int id, String name, {DateTime date: null}) {
    Dev.message("Entering libOrg.setNameStart()");
    Dev.message("ID: $id");
    Dev.message("Name: $name");
    Dev.message("Date: ${date.toString()}");

    var filters = [new Filter("Organization_id", id), new Filter("name", name)];
    return db.avo
        .read(Organization_Name, filters: filters)
        .then((List<Organization_Name> names) {
      names.forEach((Organization_Name f) {
        f.thru_date = DateUtil.tokenize(date);
        f.update().then((v) {}, onError: (e) => false);
      });
      return true;
    });
  }

  static Future<bool> setPersonStart(int id, int per_id,
      {DateTime date: null}) {
    date ??= DateUtil.today;

    Dev.message("Entering libOrg.setOrgStart()");
    Dev.message("ID: $id");
    Dev.message("Organization_id: $per_id");
    Dev.message("Date: ${date.toString()}");

    var filters = [
      new Filter("Organization_id", id),
      new Filter("Person_id", per_id)
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

  static Future<bool> setPersonEnd(int id, int per_id, {DateTime date: null}) {
    Dev.message("Entering libOrg.setOrgEnd()");
    Dev.message("ID: $id");
    Dev.message("Organization_id: $per_id");
    Dev.message("Date: ${date.toString()}");

    var filters = [
      new Filter("Organization_id", id),
      new Filter("Person_id", per_id)
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

  //Delete a org from the db.
  static Future<bool> dropOrganization(int id) {
    Dev.message("Entering libOrg.dropOrganization()");
    Dev.message("ID: $id");

    return db.avo.readById(Organization, id).then((Organization tar) {
      tar.delete().then((f) => true, onError: (e) => false);
    });
  }

  static Future<bool> dropName(int id, String name) {
    Dev.message("Entering libOrg.dropName()");
    Dev.message("ID: $id");
    Dev.message("Name: $name");

    var filters = [new Filter("Organization_id", id), new Filter("name", name)];
    return db.avo
        .read(Organization_Name, filters: filters)
        .then((List<Organization_Name> tars) {
      tars.forEach((tar) {
        tar.delete().then((f) {}, onError: (e) => false);
      });
      return true;
    });
  }

  static Future<bool> disassociatePerson(int id, int per_id) {
    Dev.message("Entering libOrg.disassociateOrg()");
    Dev.message("ID: $id");
    Dev.message("Organization_id: $per_id");

    var filters = [
      new Filter("Organization_id", id),
      new Filter("Person_id", per_id)
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
