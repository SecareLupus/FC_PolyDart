library keygen;

import 'dart:io';
import 'dart:async';

import 'package:uuid/uuid.dart';
import "package:redis_client/redis_client.dart";

import "session_json.dart";
import "encryption.dart";

enum ReqPerms {
  full,
  read,
  write,
  delete,
  login,
  unknown
}

var sessionStore = "localhost:6379";

String _getNewUuid() {
  var uuid = new Uuid();
  return uuid.v4();
}

///Processes a client request for an LKey, receiving a json representation of a
/// wagRSAEncryption object with a null private key. Also takes an optional string
/// representing the address of the Redis server, if not the localhost. The pubKey
/// json string will be encrypted with the server's pubkey before storage, to ensure
/// its safety. An expiration timer is set, allowing clients to time-out.
Future<String> getLoginKey(String pubKey, [String address = ""]) async {
  sessionStore = address == "" ? sessionStore : address;
  if (Platform.isLinux || address != "") {
    RedisClient cl = await RedisClient.connect(sessionStore);
    String uuid = _getNewUuid();
    SessionJson sessionInfo = new SessionJson(uuid, pubKey, SessionType.client, [ReqPerms.login]);
    String jsonstring = sessionInfo.toString();
    String encrypted = LocalServer.localAESCipher.encrypt(jsonstring);
    await cl.setex(uuid, 600, encrypted);
    return (uuid);
  } else {
    return _getNewUuid();
  }
}



Future<String> getUserKey(String sessionKey, [String address = ""]) async {
  sessionStore = (address == "") ? sessionStore : address;
  if (Platform.isLinux || address != "") {
    RedisClient cl = await RedisClient.connect(sessionStore);
    sessionKey = LocalServer.localRSACipher.decrypt(sessionKey);
    String clientData = await cl.get(sessionKey);
    clientData = LocalServer.localAESCipher.decrypt(clientData);
    SessionJson clientSession = new SessionJson.fromJSON(clientData);
    String pubKey = clientSession.pubKey;

    String uuid = _getNewUuid();
    SessionJson sessionInfo = new SessionJson(uuid, pubKey, SessionType.user, [ReqPerms.read, ReqPerms.write]);
    String jsonstring = sessionInfo.toString();
    String encrypted = LocalServer.localAESCipher.encrypt(jsonstring);
    await cl.setex(uuid, 300, encrypted);
    await cl.expire(sessionKey, 600);
    return (uuid);
  } else {
    return _getNewUuid();   //On Windows, generate a random ID, and return that instead of doing anything useful.
                            //I blame Redis for not having a Windows version.
  }
}

Future<String> getPubKey(String apiKey) async {
  RedisClient cl = await RedisClient.connect(sessionStore);

  String targetData = await cl.get(apiKey);
  targetData = LocalServer.localAESCipher.decrypt(targetData);
  SessionJson targetSession = new SessionJson.fromJSON(targetData);
  return targetSession.pubKey;
}

Future<List<ReqPerms>> getPerms(String key) async {
  RedisClient cl = await RedisClient.connect(sessionStore);

  String targetData = await cl.get(key);
  targetData = LocalServer.localAESCipher.decrypt(targetData);
  SessionJson targetSession = new SessionJson.fromJSON(targetData);
  return targetSession.perms;
}

Future<bool> hasPerm(String key, ReqPerms perm) async {
  //TODO: Write hasPerm
  return true;
}
