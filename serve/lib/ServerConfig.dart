import "package:sqljocky/sqljocky.dart";

export "package:sqljocky/sqljocky.dart" show ConnectionPool, Results;

class ServerConfig {
  static String _host = "localhost";
  static int _port;
  static String _user = 'root';
  static String _password = 'password';
  static String _db;
  static int _max_conn;
  static ConnectionPool _pool = new ConnectionPool(host: _host, port: _port, user: _user, password: _password, db: _db, max: _max_conn);

  static ConnectionPool getPool() {
    return _pool;
  }
}