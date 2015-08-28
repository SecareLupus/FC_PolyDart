library keygen;

import 'dart:io';
import 'dart:async';
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

  static Future<String> getLoginKey(String pubkey) async {
    if (Platform.isLinux) {
      RedisClient cl = await RedisClient.connect(connectionString);
      if (await cl.exists(pubkey)) {
        return (await cl.get(pubkey));
      } else {
        var result = await cl.setex(pubkey, 100, _getNewUUID());
        return (await cl.get(pubkey));
      }
      /*
      String tmp = "";
      RedisClient.connect(connectionString)
      .then((RedisClient client) {
        client.get(pubkey).then ((s) {
          if (s.length > 0)
            tmp = s;
        });
        if (tmp.length <= 0)
          tmp = _getNewUUID();
        // Use your client here. Eg.:
        client.set(tmp, pubkey)
        .then((_) => tmp);
      });
      */
    } else {
      return _getNewUUID();
    }
  }

  static List<NECC_PERMS> getPerms(String key) {
    RedisClient.connect(connectionString)
    .then((RedisClient client) {
      client.get(key)
      .then((val) => val);
    });
  }
}