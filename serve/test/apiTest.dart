import "../lib/entities/entities.dart";
import "../lib/api/libPerson.dart";
import "../lib/api/libOrg.dart";
import "../lib/api/dbObject.dart";
import "../lib/api/DateUtil.dart";

void main() {
  Dev.enable();
  Dev.message("Entered Main!");

  libPerson.createPerson().then((Person newPerson) async {
    //Add name to new Person
    String name = "James";
    await libPerson.addName(newPerson.id, name).then((var unk) {
      Dev.message("Added name, variable returned: " + unk.toString());
    }, onError: (e) {
      Log.error("Error adding name to new person, E($e)");
    });

    //Add gender to new Person
    String gender = "Male";
    await libPerson.addGender(newPerson.id, gender).then((pkVal) {
      Dev.message("Added gender");
    }, onError: (e) {
      Log.error("Error adding gender E(" + e.toString() + ")");
    });
    //Set male identification date to Apr 2 1989
    String newDate = "2008-03-31";
    await libPerson
        .setGenderStart(newPerson.id, gender, date: DateUtil.parseText(newDate))
        .then((bool pkVal) {
      if (pkVal) Dev.message("Gender start date set ($pkVal)");
      else Dev.error("Gender start date NOT set ($pkVal)");
    }, onError: (e) {
      Log.error("Error setting Gender Association start date E(" +
          e.toString() +
          ")");
    });
    //Set male identification end date to today
    await libPerson
        .setGenderEnd(newPerson.id, gender, date: DateUtil.today)
        .then((bool pkVal) {
      if (pkVal) Dev.message("Gender end date set ($pkVal)");
      else Dev.error("Gender end date NOT set ($pkVal)");
    }, onError: (e) {
      Log.error(
          "Error setting Gender Association end date E(" + e.toString() + ")");
    });
  });

  libOrg.createOrganization().then((Organization newOrg) async {
    String name = "Some Awesome Company, Inc.";
    await libOrg.addName(newOrg.id, name).then((var unk) {
      Dev.message("Added name, variable returned: " + unk.toString());
    }, onError: (e) {
      Log.error("Error adding name to new person, E($e)");
    });
  });
}
