import 'package:magnetfruit_avocadorm/avocadorm.dart';
import '../lib/entities/entities.dart';
import '../lib/ServerConfig.dart';

Avocadorm avocadorm;

void main() {
  //All db info stored in ../ServerConfig.dart static objects.
  MySqlDatabaseHandler databaseHandler = ServerConfig.getHandler();

  // Creates an avocadorm instance to the specified database,
  // with all [Entity]s contained in the 'entities' library.
  avocadorm = new Avocadorm();
  avocadorm.setDatabaseHandler(databaseHandler);
  avocadorm.addEntitiesInLibrary('entities');

  // Retrieves the employee with primary key value 2, changes the name, updates the value, then re-retrieves
  // the same employee to compare the values. Notice that all called methods deal in [Future]s. This is required
  // for chaining methods async.
  var newParty = new Party();
  avocadorm.create(newParty).then((Object pkValue) {
    print("New Party ID: " + pkValue.toString());
    var newPerson = new Person();
    newPerson.Party_id = pkValue;
    avocadorm.create(newPerson).then((Object subpkValue) {
      print("New Person ID: " + subpkValue.toString());

      print("NewParty is Party?");
      print(newParty is Party);
      print("NewParty is Person?");
      print(newParty is Person);
      print("NewPerson is Party?");
      print(newPerson is Party);
      print("NewPerson is Person?");
      print(newPerson is Person);
    });
  });
}
