import "package:test/test.dart";
//import "package:log/log.dart";

//import "../../lib/api/dbObject.dart";
import "../../lib/api/libPerson.dart";
import "../../lib/api/libOrg.dart";
import "../../lib/api/libRelationship.dart";
import "../../lib/api/libCommMech.dart";
import "../../lib/api/libCommEvent.dart";
import "../../lib/api/DateUtil.dart";

//Many of the following tests have been commented out to figure out why the
// test is failing as it is. exits with "exception: ''", rather unhelpful.

void main() {
  //TODO: Sometimes the entities library fails to load properly, uncommenting
  //  the following Dev.enable() line seems to fix it, even after the line is
  //  commented out again. Some internal race condition seems to be causing it.
  //Dev.enable();
  Dev.message("Entered Main!");

  int personID = -1;
  group("Person Tests", () {
    // * libPerson.addGender(), passing a gender already in db
    // * libPerson.addOrganization()
    // * libPerson.getPeople()
    // * libPerson.getGenders()
    // * libPerson.setNameStart()
    // * libPerson.setNameEnd()
    // * libPerson.setOrgStart()
    // * libPerson.setOrgEnd()
    // * libPerson.dropPerson()
    // * libPerson.disassociateGender()
    // * libPerson.disassociateOrg()
    test("Creating a person, setting personID to the new person's ID", () {
      libPerson.createPerson().then((Person newPerson) {
        personID = newPerson.id;
        expect(personID, greaterThanOrEqualTo(0));
      });
    });

    test("Add name to person", () {
      String name = "James_$personID";
      libPerson.addName(personID, name).then((Person_Name nam) {
        expect(nam.name, equalsIgnoringCase(name));
        expect(nam.Person_id, equals(personID));
      });
    });

    test("Add existing gender to person.", () {
      String gender = "Male";
      libPerson.addGender(personID, gender).then((Gender_Association assoc) {
        db.avo
            .readById(Gender_Type, assoc.Gender_Type_id)
            .then((Gender_Type type) {
          expect(type.name, equalsIgnoringCase(gender));
          expect(assoc.Person_id, equals(personID));
        });
      });
    });

    test("Set gender start date implicitly", () {
      libPerson.setGenderStart(personID, "Male").then((bool result) {
        //TODO: add additional expect statements to cofirm validity of update.
        expect(result, equals(true));
      });
    });

    test("Set gender end date implicitly", () {
      libPerson.setGenderEnd(personID, "Male").then((bool result) {
        //TODO: add additional expect statements to cofirm validity of update.
        expect(result, equals(true));
      });
    });

    test("Add new gender to person", () {
      String gender = "Male_$personID";
      libPerson.addGender(personID, gender).then((Gender_Association assoc) {
        db.avo
            .readById(Gender_Type, assoc.Gender_Type_id)
            .then((Gender_Type type) {
          expect(type.name, equalsIgnoringCase(gender));
          expect(assoc.Person_id, equals(personID));
        });
      });
    });

    test("Set gender start date explicitly", () {
      String newDate = "2008-03-31";
      libPerson
          .setGenderStart(personID, "Male_$personID",
              date: DateUtil.parseText(newDate))
          .then((bool result) {
        //TODO: add additional expect statements to cofirm validity of update.
        expect(result, equals(true));
      });
    });

    test("Set gender end date explicitly", () {
      String newDate = "2008-04-02";
      libPerson
          .setGenderEnd(personID, "Male_$personID",
              date: DateUtil.parseText(newDate))
          .then((bool result) {
        //TODO: add additional expect statements to cofirm validity of update.
        expect(result, equals(true));
      });
    });

    test("Get all genders recorded for person", () {
      libPerson.getGenders(personID).then((List<Gender_Type> types) {
        expect(types.length, equals(2));
      });
    });

    test("Get all genders active on Apr 1, 2008", () {
      String checkDate = "2008-04-01";
      libPerson
          .getGenders(personID, date: DateUtil.parseText(checkDate))
          .then((List<Gender_Type> types) {
        if (types == null) {
          types = [];
        }
        expect(types.length, equals(1));
      });
    });
  });
/*
  int orgID = -1;
  group("Organization Tests", () {
    // * libOrg.addPerson()
    // * libOrg.getOrganizations()
    // * libOrg.setNameStart()
    // * libOrg.setNameEnd()
    // * libOrg.setPersonStart()
    // * libOrg.setPersonEnd()
    // * libOrg.dropOrganization()
    // * libOrg.dropName()
    // * libOrg.disassociatePerson()
    test("Creating an organization, storing the id in orgID", () {
      libOrg.createOrganization().then((Organization org) {
        orgID = org.id;
      });
      expect(orgID, greaterThanOrEqualTo(0));
    });

    test("Setting organization's name", () {
      String name = "Some Awesome Company_$orgID, Inc";
      libOrg.addName(orgID, name).then((Organization_Name n) {
        expect(n.name, equals(name));
      });
    });
  });

  int relID = -1;
  group("Relationship Tests", () {
    // * libRelationship.addNote()
    // * libRelationship.getRelationships()
    // * libRelationship.getParties()
    // * libRelationship.getNotes()
    // * libRelationship.setParty()
    // * libRelationship.setNote()
    // * libRelationship.setNoteTS()
    // * libRelationship.dropRelationship()
    // * libRelationship.dropNote()
    test("Create new relationship betwenn orgID and personID", () {
      libRelationship
          .createRelationship(
              libPerson.getPerson(personID).then((Person p) {
                return p.Party_id;
              }),
              libOrg.getOrganization(orgID).then((Organization o) {
                return o.Party_id;
              }))
          .then((Party_Relationship rel) {
        relID = rel.id;
      });
      expect(relID, greaterThanOrEqualTo(0));
    });
  });

  int emailID = -1;
  int phoneID = -1;
  int addressID = -1;
  group("Communication Mechanism Tests", () {
    // * libCommMech.getEmails()
    // * libCommMech.getPhones()
    // * libCommMech.getAddresses()
    // * libCommMech.setEmail()
    // * libCommMech.setPhoneName()
    // * libCommMech.setPhoneNumber()
    // * libCommMech.setAddress()
    // * libCommMech.setAddress2()
    // * libCommMech.setCity()
    // * libCommMech.setState()
    // * libCommMech.setZip()
    // * libCommMech.dropEmail()
    // * libCommMech.dropPhone()
    // * libCommMech.dropAddress()
    test("Creating email address", () {
      emailID =
          libCommMech.createEmailMechanism().then((Email_Address e) {
        return e.id;
      });
    });

    test("Creating phone number", () {
      phoneID = libCommMech.createPhoneMechanism().then((Phone_Number n) {
        return n.id;
      });
    });

    test("Creating address", () {
      addressID = libCommMech.createAddressMechanism().then((Address a) {
        return a.id;
      });
    });
  });

  int eveID = -1;
  group("Communication Event Tests", () {
    // * libCommEvent._createMechanism(), passing a desciption not already in db
    // * libCommEvent._createStatus(), passing a desciption not already in db
    // * libCommEvent._createPurpose()
    // * libCommEvent._createRoleType()
    // * libCommEvent.getCommunicationEvents()
    // * libCommEvent.getMechanismType()
    // * libCommEvent.getMechanismTypes()
    // * libCommEvent.getStatusType()
    // * libCommEvent.getStatusTypes()
    // * libCommEvent.getPurposes()
    // * libCommEvent.getPurposeTypes()
    // * libCommEvent.getRoles()
    // * libCommEvent.getRoleTypes()
    // * libCommEvent.setRelationship()
    // * libCommEvent.setMechanismType()
    // * libCommEvent.setStatusType()
    // * libCommEvent.addPurposeType()
    // * libCommEvent.removePurposeType()
    // * libCommEvent.addRoleType()
    // * libCommEvent.removeRoleType()
    // * libCommEvent.dropCommunicationEvent()
    // * libCommEvent.dropMechanismType()
    // * libCommEvent.dropStatusType()
    // * libCommEvent.dropPurposeType()
    // * libCommEvent.dropRoleType()
    test("Creating Communication Event", () {
      //TODO: ints are being returned where Entity(s) should be returned.
      // I think this is due to avo.create() returning a pk and not an Entity
      eveID = libCommEvent
          .createCommunicationEvent(relID, mechanism_type_string: "Phone Call")
          .then((Communication_Event e) {
        return e.id;
      });
    });
  });
  */
}
