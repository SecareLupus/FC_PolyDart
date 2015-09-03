library message;

import "dart:convert";
import "dart:typed_data";
import "package:cipher/cipher.dart";
import 'package:bignum/bignum.dart';

class SynResponse {
  String login_key;
  PubKeyMessage pubkey;

  void doSomething(cb(String s)) {
    login_key = cb(login_key);
    pubkey.doSomething(cb);
  }
}

class LoginRequest {
  String login_key;
  String username;
  String password;
}

class LoginResponse {
  bool success;
  String user_key;
}

class PubKeyMessage {
  String modulus;
  String exponent;

  void doSomething(cb(String s)) {
    modulus = cb(modulus);
    exponent = cb(modulus);
  }
}

PubKeyMessage pubKeyToMessage(Uint8List modulus, Uint8List exponent) {
  PubKeyMessage tmp = new PubKeyMessage()
    ..modulus = UTF8.decode(modulus)
    ..exponent = UTF8.decode(exponent);
  return tmp;
}

RSAPublicKey pubKeyFromMessage(String modulus, String exponent) {
  return new RSAPublicKey(new BigInteger(modulus), new BigInteger(exponent));
}