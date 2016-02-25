library objects;

import 'package:magnetfruit_avocadorm/avocadorm.dart';
import '../ServerConfig.dart';

export "package:magnetfruit_database_handler/database_handler.dart" show Filter;
export "../entities/entities.dart";
export "../../../packages/log/log.dart";

class db {
  static Avocadorm _avocadorm;
  static bool _isInit = false;

  static void _init() {
    //All db info stored in ../ServerConfig.dart static objects.
    MySqlDatabaseHandler databaseHandler = ServerConfig.getHandler();

    // Creates an avocadorm instance to the specified database,
    // with all [Entity]s contained in the 'entities' library.
    _avocadorm = new Avocadorm();
    _avocadorm.setDatabaseHandler(databaseHandler);
    _avocadorm.addEntitiesInLibrary('entities');
    _isInit = true;
  }

  static Avocadorm get avo {
    if (_isInit) {
      return _avocadorm;
    } else {
      _init();
      return _avocadorm;
    }
  }

  static void close() {
    _avocadorm = null;
    _isInit = false;
  }
}
