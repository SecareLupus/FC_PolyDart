library encryption;

import "dart:convert";
import "package:rsa/rsa.dart";

class Encryption {
  KeyPair pair;

  bool get hasPub { return pair.hasPublicKey; }
  bool get hasPriv { return pair.hasPrivateKey; }
  bool get canEncrypt { return hasPub; }
  bool get canDecrypt { return hasPriv; }
  bool get canSign { return hasPriv; }
  bool get canVerify { return hasPub; }
  Key get pubKey { return pair.publicKey; }
  Key get privKey { return pair.privateKey; }

  Encryption(String pubkey, [String privkey = ""]) {
    Key pub = KeyPair.parsePem(pubkey).publicKey;
    Key priv = (privkey == "" || privkey == null) ? null : KeyPair.parsePem(privkey).privateKey;
    pair = new KeyPair(priv, pub);
  }

  String encrypt(String plaintext) {
    if (!canEncrypt)
      return plaintext;

    String ciphertext = "";
    ciphertext = pair.encrypt(plaintext);
    return ciphertext;
  }

  String decrypt(String ciphertext) {
    if (!canEncrypt)
      return ciphertext;

    String plaintext = "";
    plaintext = pair.decrypt(ciphertext);
    return plaintext;
  }

  String sign(String message) {
    if (!canSign)
      return message;

    var signed = pair.sign(UTF8.encode(message));
    return DSC.encode(signed);
  }

  bool verify(String sig, String message) {
    if (!canVerify)
      throw new StateError("Encryption objects cannot verify without a PubKey.");

    return pair.verify(DSC.decode(sig), UTF8.encode(message));
  }
}

class LocalServer {
  //These values should not be hardcoded, but loaded from a file.
  static final String pubKey = """-----BEGIN PUBLIC KEY-----
MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCIZtVky0gSZyg14w9/hdOcddqc
OnU1EQG75fzQ6dC0ci57cb/Tj/EYRaPDoZ2qubsVHUj5dGAFVy5RHYYaqM7gYb/c
8GTEpt4czllDkScQc6TMl+VO6bEh55MN8mmmk/VrJw4Vh5GqBHLAU7ugWzwmU/1I
b8V/myyG+8A13yeZfQIDAQAB
-----END PUBLIC KEY-----""";
  static final String _privKey = """-----BEGIN RSA PRIVATE KEY-----
  MIICXQIBAAKBgQCIZtVky0gSZyg14w9/hdOcddqcOnU1EQG75fzQ6dC0ci57cb/T
  j/EYRaPDoZ2qubsVHUj5dGAFVy5RHYYaqM7gYb/c8GTEpt4czllDkScQc6TMl+VO
  6bEh55MN8mmmk/VrJw4Vh5GqBHLAU7ugWzwmU/1Ib8V/myyG+8A13yeZfQIDAQAB
  AoGACND8wgMRqX7ZboI6ojd4Mgi8FJUCtmdfAVIgQTCbuM4YiwoTKA2Ju9PkfeSY
  WEyg9wBpkxYejrnP2JZb8KUwmeAIfgLG1D9Pc7BbuEgUJIhGBjcnnnGCc/pIt4l8
  MqXT9EoO0g2ufmbuy0ZANdge5Ba062AP7t6vftEopGXOV1ECQQDD9uStV0JYu9Px
  w5oD5VOZ5znY7gdE5P8RE4CO8Sn1CUSWpz9aYRYxuAyIGj2bmZ/e7Rbwtv77VJT3
  eErZ17zbAkEAsjCNN2YLPbbFnBORocdhsLt9KPpTa7F0gCfu6twTGc9BhF5efHJT
  MWsJjJFs4azoQ7AZBYEmii+a86I72temhwJBAI8J/z9byyzz5S+6pAgl85EKS5pB
  nIK4WEpBnvw3onWezzbcW40AAvBFtLf/12plh2F0U+Ne393ajmXYo2JBbDMCQBvo
  LrW2bZxEu74t8mj76Pjc5EU+r0H2kOBhYLG3teYc543rmbCz1wOuV9iEDiFqCxZO
  xhxulbKesg3mIqmrjJECQQCspPSM93flfY+vCpAn6CRXtFhlckjuGOMxvzMh8Isv
  1QuACkZRBf5M7VkvjOfvM3zjeMQqfAEDYBn35I/2fFrT
  -----END RSA PRIVATE KEY-----""";

  static final Encryption serverEncryption = new Encryption(pubKey, _privKey);

  //Encrypt a string with the local public key. This message can be read by the server.
  //Returns a ciphertext String.
  static String encrypt(String plaintext) {
    return serverEncryption.encrypt(plaintext);
  }

  //Decrypt a string with the local private key. Decrypts messages encrypted with LocalServer.encrypt().
  //Returns a plaintext String.
  static String decrypt(String ciphertext) {
    return serverEncryption.decrypt(ciphertext);
  }

  //Signs a message to prove the server sent it. Anyone can verify this signature.
  //Returns a signature digest String.
  static String sign(String message) {
    return serverEncryption.sign(message);
  }

  //Verifies that sig is both valid, from the LocalServer, and also a signed digest of message.
  //Returns true if sig is a signed digest of message, false otherwise.
  static bool verify(String sig, String message) {
    return serverEncryption.verify(sig, message);
  }
}