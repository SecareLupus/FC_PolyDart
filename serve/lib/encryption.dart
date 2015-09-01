library encryption;

import "package:cipher/cipher.dart";
import "package:cipher/impl/server.dart";

enum KeyType {
  PUBLIC,
  PRIVATE
}

class Encryption {
  RSAPublicKey pubkey;
  RSAPrivateKey privkey;

  Encryption(AsymmetricKeyPair keypair) {
    initCipher();
    pubkey = keypair.publicKey;
    privkey = keypair.privateKey;
  }

  String encrypt(String plaintext, KeyType k) {
    String ciphertext = "";
    RSAAsymmetricKey key;
    AsymmetricKeyParameter params;

    // Encrypt the plaintext using the [k] key
    if (k == KeyType.PUBLIC) {
      //Encrypt using pubkey
      key = pubkey;
      params = new PublicKeyParameter<RSAPublicKey>(pubkey);
    } else if (k == KeyType.PRIVATE) {
      //Encrypt using pivkey
      key = privkey;
      params = new PrivateKeyParameter<RSAPrivateKey>(privkey);
    } else {
      throw ArgumentError;
    }

    var cipher = new AsymmetricBlockCipher("RSA")
      ..init( true, params );

    ciphertext = cipher.process(plaintext);

    return ciphertext;
  }

  String decrypt(String ciphertext, KeyType k) {
    String plaintext = "";
    // Decrypt the ciphertext using the [k] key
    if (k == KeyType.PUBLIC) {
      //Decrypt using pubkey
    } else if (k == KeyType.PRIVATE) {
      //Decrypt using pivkey
    } else {
      throw ArgumentError;
    }
    return plaintext;
  }
}