library keygen;

import 'dart:io';
import 'dart:async';
import "dart:math";
import 'package:uuid/uuid.dart';
import "package:redis_client/redis_client.dart";
import "package:rsa/rsa.dart";
import "SessionJson.dart";
/*
import "package:cipher/cipher.dart";
import "package:cipher/block/aes_fast.dart";
import "package:cipher/random/auto_seed_block_ctr_random.dart";
import "package:cipher/entropy/url_entropy_source.dart";
import "package:bignum/bignum.dart";
*/
import "dart:typed_data";

enum NECC_PERMS {
  FULL,
  READ,
  WRITE,
  DELETE,
  LOGIN
}

var session_store = "localhost:6379";

String _getNewUUID() {
  var uuid = new Uuid();
  return uuid.v4();
}

Future<String> getLoginKey(String pubkey) async {
  if (Platform.isLinux) {
    RedisClient cl = await RedisClient.connect(session_store);
    String uuid = _getNewUUID();
    SessionJson sessionInfo = new SessionJson(uuid, pubkey, SessionType.CLIENT, [NECC_PERMS.LOGIN]);
    await cl.setex(uuid, 100, sessionInfo.toString());
    return (await cl.get(uuid));
  } else {
    return _getNewUUID();
  }
}

Future<String> getUserKey() async {
  return _getNewUUID();
}

List<NECC_PERMS> getPerms(String key) {
  RedisClient.connect(session_store)
  .then((RedisClient client) {
    client.get(key)
    .then((val) => val);
  });
}
bool hasPerm(String key, NECC_PERMS perm) {
  return true;
}
/*
AsymmetricKeyPair genKeyPair() {
  //AESFastEngine afe = new AESFastEngine();
  //afe.init(true, new KeyParameter(new Uint8List()));
  var key = new Uint8List.fromList(
      [0x00,0x11,0x22,0x33,0x44,0x55,0x66,0x77,0x88,0x99,0xAA,0xBB,0xCC,0xDD,0xEE,0xFF]
  );
  var kparams = new KeyParameter( key );
  var ivparams = new ParametersWithIV(kparams, new Uint8List(16));

  var rnd = new TestRandom()
    ..seed( ivparams )
  ;
  var rsapars = new RSAKeyGeneratorParameters(new BigInteger("65537"), 2048, 12);
  var params = new ParametersWithRandom(rsapars, rnd);

  var keyGenerator = new KeyGenerator("RSA")
    ..init(params);

  var keyPair = keyGenerator.generateKeyPair();

  return keyPair;
}
*/