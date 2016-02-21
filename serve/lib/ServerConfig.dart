import 'package:magnetfruit_mysql_database_handler/mysql_database_handler.dart';
export 'package:magnetfruit_mysql_database_handler/mysql_database_handler.dart' show MySqlDatabaseHandler;

class ServerConfig {
  static String _host = "localhost";
  static int _port = 3306;
  static String _user = 'root';
  static String _password = 'password';
  static String _db = 'fc_test';

  static MySqlDatabaseHandler _databaseHandler = new MySqlDatabaseHandler(
          _host, _port, _db, _user, _password);

  static MySqlDatabaseHandler getHandler() {
    return _databaseHandler;
  }
}
