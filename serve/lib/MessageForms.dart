library message;

import "dart:convert";
import "package:cipher/cipher.dart";

class SynResponse {
  String login_key;
  PubKeyMessage pubkey;
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
}

PubKeyMessage pubKeyToMessage(Uint8List modulus, Uint8List exponent) {
  PubKeyMessage tmp = new PubKeyMessage()
    ..modulus = UTF8.decode(modulus)
    ..exponent = UTF8.decode(exponent);
}

RSAPublicKey pubKeyFromMessage(String modulus, String exponent) {
  return new RSAPublicKey(UTF8.encode(modulus), UTF8.encode(exponent));
}