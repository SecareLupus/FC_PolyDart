//import "dart:async";
import "../lib/entities/entities.dart";
import "../lib/api/libPerson.dart";
import "../lib/api/dbObject.dart";
import "../lib/api/DateUtil.dart";

void main() {
  Dev.enable();
  Dev.message("Entered Main!");

  Dev.message("Testing filter issues.");
  var filter = [new Filter("test", "val")];
  Dev.success("It worked.");

  libPerson.addPerson().then((Person newPerson) {
    Dev.message("Person Created");
    Dev.message("New Person: " + newPerson.toString());
    Dev.message("Giving new person name 'Ted'");

    //Add name to new Person
    String name = "Ted";
    libPerson.addName(newPerson.id, name).then((var unk) {
      Dev.message("Added name, variable returned: " + unk.toString());
    }, onError: (e) {
      Log.error("Error adding name to new person, E($e)");
    });

    //Add gender to new Person
    String gender = "Male";
    libPerson.addGender(newPerson.id, gender).then((pkVal) {
      Dev.message("Added gender");
    }, onError: (e) {
      Log.error("Error adding gender E(" + e.toString() + ")");
    });

    //Set male identification date to Apr 2 1989
    String newDate = "1989-04-02";
    libPerson
        .setGenderStart(newPerson.id, gender, date: DateUtil.parseText(newDate))
        .then((pkVal) {
      Dev.message("Gender start date set");
    }, onError: (e) {
      Log.error("Error setting Gender Association start date E(" +
          e.toString() +
          ")");
    });

    //Set male identification end date to today
    libPerson.setGenderEnd(newPerson.id, gender).then((pkVal) {
      Dev.message("Gender end date set");
    }, onError: (e) {
      Log.error(
          "Error setting Gender Association end date E(" + e.toString() + ")");
    });
  }, onError: (e) {
    Log.error("Error creating new person, E(" + e.toString() + ")");
  });
}
//TODO: figure out how to get these to happen in the right order.
