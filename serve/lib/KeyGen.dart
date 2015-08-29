library keygen;

import 'dart:io';
import 'dart:async';
import 'package:uuid/uuid.dart';
import "package:redis_client/redis_client.dart";
import "package:cipher/cipher.dart";
import "package:bignum/bignum.dart";

enum NECC_PERMS {
  FULL,
  READ,
  WRITE,
  DELETE,
  LOGIN
}

var connectionString = "localhost:6379";

String _getNewUUID() {
  var uuid = new Uuid();
  return uuid.v4();
}

Future<String> getLoginKey(String pubkey) async {
  if (Platform.isLinux) {
    RedisClient cl = await RedisClient.connect(connectionString);
    if (await cl.exists(pubkey)) {
      return (await cl.get(pubkey));
    } else {
      var result = await cl.setex(pubkey, 100, _getNewUUID());
      return (await cl.get(pubkey));
    }
  } else {
    return _getNewUUID();
  }
}

Future<String> getUserKey() async {
  return _getNewUUID();
}

List<NECC_PERMS> getPerms(String key) {
  RedisClient.connect(connectionString)
  .then((RedisClient client) {
    client.get(key)
    .then((val) => val);
  });
}
bool hasPerm(String key, NECC_PERMS perm) {
  return true;
}

AsymmetricKeyPair genKeyPair() {
  var rsapars = new RSAKeyGeneratorParameters(new BigInteger("65537"), 2048, 12);
  var params = new ParametersWithRandom(rsapars, new SecureRandom());

  var keyGenerator = new KeyGenerator("RSA")
    ..init(params);

  var keyPair = keyGenerator.generateKeyPair();

  return keyPair;
}