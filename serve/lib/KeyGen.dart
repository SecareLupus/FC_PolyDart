import 'package:uuid/uuid.dart';
import "package:redis_client/redis_client.dart";

enum NECC_PERMS {
  FULL,
  READ,
  WRITE,
  DELETE,
  LOGIN
}

class KeyGen {
  static var connectionString = "localhost:6379";

  static String _getNewUUID() {
    var uuid = new Uuid();
    return uuid.v4();
  }

  static String getLoginKey(String pubkey) async {
    await RedisClient.connect(connectionString)
    .then((RedisClient client) {
      var tmp = _getNewUUID();
      // Use your client here. Eg.:
      client.set(tmp, [NECC_PERMS.LOGIN])
      .then((_) => tmp);
    });
  }

  static List<NECC_PERMS> getPerms(String key) {
    RedisClient.connect(connectionString)
    .then((RedisClient client) {
      client.get(key)
      .then((val) => val);
    });
  }
}