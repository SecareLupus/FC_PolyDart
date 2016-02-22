library objects;

import 'package:magnetfruit_avocadorm/avocadorm.dart';
import '../ServerConfig.dart';

export "../entities/entities.dart";
export "../../../packages/log/log.dart";

class db {
  static Avocadorm avocadorm;
  static bool init = false;

  static void _init() {
    //All db info stored in ../ServerConfig.dart static objects.
    MySqlDatabaseHandler databaseHandler = ServerConfig.getHandler();

    // Creates an avocadorm instance to the specified database,
    // with all [Entity]s contained in the 'entities' library.
    avocadorm = new Avocadorm();
    avocadorm.setDatabaseHandler(databaseHandler);
    avocadorm.addEntitiesInLibrary('entities');
    init = true;
  }

  static Avocadorm get avo {
    if (init) {
      return avocadorm;
    } else {
      _init();
      return avocadorm;
    }
  }

  static void close() {
    avocadorm = null;
    init = false;
  }
}
