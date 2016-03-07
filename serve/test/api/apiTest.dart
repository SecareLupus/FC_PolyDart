import "dart:async";

import "package:test/test.dart";

import "../../lib/entities/entities.dart";
import "../../lib/api/libPerson.dart";
import "../../lib/api/libOrg.dart";
import "../../lib/api/libRelationship.dart";
import "../../lib/api/libCommMech.dart";
import "../../lib/api/libCommEvent.dart";
import "../../lib/api/dbObject.dart";
import "../../lib/api/DateUtil.dart";

void main() {
  //Dev.enable();
  Dev.message("Entered Main!");

  int personID = -1;
  group("Person Tests", () {
    test("Creating a person, setting personID to the new person's ID",
        () async {
      await libPerson.createPerson().then((Person newPerson) {
        personID = newPerson.id;
        expect(personID, greaterThanOrEqualTo(0));
      });
    });

    test("Add name to person", () async {
      String name = "James_$personID";
      Person_Name nam = await libPerson.addName(personID, name);
      expect(nam.name, equalsIgnoringCase(name));
      expect(nam.Person_id, equals(personID));
    });

    test("Add gender to person", () async {
      String gender = "Male_$personID";
      Gender_Association assoc = await libPerson.addGender(personID, gender);
      Gender_Type type =
          await db.avo.readById(Gender_Type, assoc.Gender_Type_id);
      expect(type.name, equalsIgnoringCase(gender));
      expect(assoc.Person_id, equals(personID));
    });

    test("Set gender start date", () async {
      String newDate = "2008-03-31";
      bool result = await libPerson.setGenderStart(personID, "Male_$personID",
          date: DateUtil.parseText(newDate));
      expect(result, equals(true));
    });

    test("Set gender end date", () async {
      bool result = await libPerson.setGenderEnd(personID, "Male_$personID");
      expect(result, equals(true));
    });
  });

  int orgID = -1;
  group("Organization Tests", () {
    test("Creating an organization, storing the id in orgID", () async {
      await libOrg.createOrganization().then((Organization org) {
        orgID = org.id;
      });
      expect(orgID, greaterThanOrEqualTo(0));
    });

    test("Setting organization's name", () async {
      String name = "Some Awesome Company_$orgID, Inc";
      await libOrg.addName(orgID, name).then((Organization_Name n) {
        expect(n.name, equals(name));
      });
    });
  });

  int relID = -1;
  group("Relationship Tests", () {
    test("Create new relationship betwenn orgID and personID", () async {
      await libRelationship
          .createRelationship(
              await libPerson.getPerson(personID).then((Person p) {
                return p.Party_id;
              }),
              await libOrg.getOrganization(orgID).then((Organization o) {
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
    test("Creating email address", () async {
      emailID =
          await libCommMech.createEmailMechanism().then((Email_Address e) {
        return e.id;
      });
    });

    test("Creating phone number", () async {});

    test("Creating address", () async {});
  });

  group("Communication Event Tests", () {});
}

/*
  ]).then((f) async {
    if (personID != -1 && orgID != -1) {
      libPerson.addOrganization(personID, orgID);
      Dev.message("Added Organization_Person_Association");
      libRelationship
          .createRelationship(
              await db.avo.readById(Person, personID).then((Person p) {
                return p.Party_id;
              }),
              await db.avo.readById(Organization, orgID).then((Organization o) {
                return o.Party_id;
              }),
              comment: "API Unit Test")
          .then((Party_Relationship rel) {
        libCommEvent
            .createCommunicationEvent(rel.id, note: "API Unit Test")
            .then((Communication_Event eve) {});
      });
    } else {
      Dev.error("Race condition failed. P:$personID, O:$orgID");
    }
    */
//});
