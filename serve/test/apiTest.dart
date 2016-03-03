import "dart:async";
import "../lib/api/libPerson.dart";
import "../lib/api/dbObject.dart";

Future main() async {
  Dev.enable();
  Dev.message("Entered Main!");
  libPerson.addPerson().then((Person newPerson) {
    Dev.message("Person Created");
    Dev.message("New Person: " + newPerson.toString());
    Dev.message("Giving new person name 'Ted'");
    String name = "Ted";
    libPerson.addName(newPerson.id, name).then((var unk) {
      Dev.message("Added name, variable returned: " + unk.toString());
    }, onError: (e) {
      Log.error("Error adding name to new person, E(" + e.toString() + ")");
    });
  }, onError: (e) {
    Log.error("Error creating new person, E(" + e.toString() + ")");
  });
}
