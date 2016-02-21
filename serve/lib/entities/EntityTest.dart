import 'package:magnetfruit_avocadorm/avocadorm.dart';
import 'entities.dart';
import '../ServerConfig.dart';

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
  var newPerson = new Party();
  avocadorm.create(newPerson).then((Object pkValue) {
    print(pkValue);
    var tmp = new Person();
    tmp.Party_id = pkValue;
    avocadorm.create(tmp).then((Object subpkValue) {
      print(subpkValue);
    });
  });
}
