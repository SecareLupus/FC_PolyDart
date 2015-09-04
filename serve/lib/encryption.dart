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