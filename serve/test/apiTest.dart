import "dart:async";
import "../lib/api/libPerson.dart";
import "../lib/api/dbObject.dart";

Future main() async {
  Dev.enable();
  print("Entered Main!");
  Person newPerson =
    await libPerson.addPerson().then((Person thenPerson) {
    print("Person Created");
    print("New Person: " + thenPerson.toString());
  });
  print("New Person (outside): " + newPerson.toString());
}
