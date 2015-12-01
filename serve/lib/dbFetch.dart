import "ServerConfig.dart";

export "package:sqljocky/sqljocky.dart" show Results;

class dbFetch {
  dynamic query(String query) async {
    ConnectionPool pool = ServerConfig.getPool();

    Results results = await pool.query(query);
    return results;
  }
}
