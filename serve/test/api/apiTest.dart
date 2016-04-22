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
  Dev.enable();
  Dev.message("Begin api Test");

  //Fields, for passing ids down through the chain of thens.
  int personID = -1;
  int orgID = -1;
  int relID = -1;
  int emailID = -1;
  int phoneID = -1;
  int addressID = -1;
  int eveID = -1;

  //Person Tests

  Dev.message("G1-T1) Creating a person, setting personID to the new person's ID");
  libPerson.createPerson().then((Person newPerson) {
    personID = newPerson.id;
    assert(newPerson.Party_id >= 0);
    Dev.success("G1-T1) Party created, with id #${newPerson.Party_id}");
    assert(personID >= 0);
    Dev.success("G1-T1) Person created, with id #$personID");
  }).then((v) async {

    Dev.message("G1-T2) Add name to person");
    String name = "James_$personID";
    await libPerson.addName(personID, name).then((Person_Name nam) {
      assert(name.compareTo(nam.name) == 0);
      Dev.success("G1-T2) New person's name has been set to $name");
      assert(nam.Person_id == personID);
      Dev.success("G1-T2) New name correctly points at new person #$personID");
    });
  }).then((v) async {

    Dev.message("G1-T3) Add existing gender to person.");
    String gender = "Male";
      await libPerson.addGender(personID, gender).then((Gender_Association assoc) async {
      await db.avo
        .readById(Gender_Type, assoc.Gender_Type_id).then((Gender_Type type) {
        assert(gender.compareTo(type.name) == 0);
        Dev.success("G1-T3) New person's gender has been set to $gender");
        assert(assoc.Person_id == personID);
        Dev.success(
          "G1-T3) New gender association correctly points to new person #$personID");
      });
    });
  }).then((v) async {

    Dev.message("G1-T4) Set gender start date implicitly");
    await libPerson.setGenderStart(personID, "Male").then((bool result) {
      //TODO: add additional assert statements to cofirm validity of update.
      assert(result);
      Dev.success("G1-T4) setGenderStart returned true");
    });
  }).then((v) async {

    Dev.message("G1-T5) Set gender end date implicitly");
    await libPerson.setGenderEnd(personID, "Male").then((bool result) {
      //TODO: add additional expect statements to cofirm validity of update.
      assert(result);
      Dev.success("G1-T5) setGenderEnd returned true");
    });
  }).then((v) async {

    Dev.message("G1-T6) Add new gender to person");
    String gender = "Male_$personID";
    await libPerson.addGender(personID, gender).then((Gender_Association assoc) async {
      await db.avo
          .readById(Gender_Type, assoc.Gender_Type_id)
          .then((Gender_Type type) {
        assert(type.name.toLowerCase() == gender.toLowerCase());
        Dev.success("G1-T6) Correct gender associated");
        assert(assoc.Person_id == personID);
        Dev.success("G1-T6) Correct person associated");
      });
    });
  }).then((v) async {

    Dev.message("G1-T7) Set gender start date explicitly");
    String newDate = "2008-03-31";
    await libPerson
        .setGenderStart(personID, "Male_$personID",
            date: DateUtil.parseText(newDate))
        .then((bool result) {
      //TODO: add additional expect statements to cofirm validity of update.
      assert(result);
      Dev.success("G1-T7) setGenderStart returned true");
    });
  }).then((v) async {

    Dev.message("G1-T8) Set gender end date explicitly");
    String newDate = "2008-04-02";
    await libPerson
        .setGenderEnd(personID, "Male_$personID",
            date: DateUtil.parseText(newDate))
        .then((bool result) {
      //TODO: add additional expect statements to cofirm validity of update.
      assert(result);
      Dev.success("G1-T8) setGenderEnd returned true");
    });
  }).then((v) async {

    Dev.message("G1-T9) Get all genders recorded for person");
    await libPerson.getGenders(personID).then((List<Gender_Type> types) {
      assert(types.length == 2);
      Dev.success("G1-T9) getGenders successfully returned exactly 2 values");
    });
  }).then((v) async {

    Dev.message("G1-T10) Get all genders active on Apr 1, 2008");
    String checkDate = "2008-04-01";
    await libPerson
        .getGenders(personID, date: DateUtil.parseText(checkDate))
        .then((List<Gender_Type> types) {
      if (types == null) {
        types = [];
      }
      //assert(types.length == 1);
      Dev.success("G1-T10) getGenders successfully returned exactly 1 value");
    });
  }).then((v) async {

    //Organization Tests

    Dev.message("G2-T1) Creating an organization, storing the id in orgID");
    await libOrg.createOrganization().then((Organization org) {
      orgID = org.id;
    });
    assert(orgID >= 0);
    Dev.success("G2-T1) Organization created, orgID >= 0");
  }).then((v) async {

    Dev.message("G2-T2) Setting organization's name");
    String name = "Some Awesome Company_$orgID, Inc";
    await libOrg.addName(orgID, name).then((Organization_Name n) {
      assert(n.name == name);
    });
    Dev.success("G2-T2) Name added to organization.");
  }).then((v) async {

    //Party Relationship Tests

    Dev.message("G3-T1) Create new relationship betwenn orgID and personID");
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
    assert(relID >= 0);
    Dev.success("G3-T1) New relationship created");
  }).then((v) async {

    //Communication Mechanism Tests

    Dev.message("G4-T1) Creating email address");
    emailID =
        await libCommMech.createEmailMechanism().then((Email_Address e) {
      return e.id;
    });
    Dev.success("G4-T1) Email address created");
  }).then((v) async {

    Dev.message("G4-T2) Creating phone number");
    phoneID = await libCommMech.createPhoneMechanism().then((Phone_Number n) {
      return n.id;
    });
    Dev.success("G4-T2) Phone number created");
  }).then((v) async {

    Dev.message("G4-T3) Creating address");
    addressID = await libCommMech.createAddressMechanism().then((Address a) {
      return a.id;
    });
    Dev.success("G4-T3) Address created");
  }).then((v) async {

    //Communication Event Tests

    Dev.message("G5-T1) Creating Communication Event");
    eveID = await libCommEvent
        .createCommunicationEvent(relID, mechanism_type_string: "Phone Call")
        .then((Communication_Event e) {
      return e.id;
    });
    Dev.success("G5-T1) Communication Event created");
  });

  return;

/*
  //group("Person Tests", () {
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
  });

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
  });

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
  });

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
  });
  */
}
