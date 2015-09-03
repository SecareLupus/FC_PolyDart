library encryption;

import "package:cipher/cipher.dart";
import "package:cipher/impl/server.dart";
import "dart:convert";

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
      //Encrypt using privkey
      key = privkey;
      params = new PrivateKeyParameter<RSAPrivateKey>(privkey);
    } else {
      throw ArgumentError;
    }

    var cipher = new AsymmetricBlockCipher("RSA")
      ..init( true, params );

    ciphertext = UTF8.decode(cipher.process(UTF8.encode(plaintext)));

    return ciphertext;
  }

  String decrypt(String ciphertext, KeyType k) {
    String plaintext = "";
    AsymmetricKeyParameter params;

    // Decrypt the ciphertext using the [k] key
    if (k == KeyType.PUBLIC) {
      //Decrypt using pubkey
      params = new PublicKeyParameter<RSAPublicKey>(pubkey);
    } else if (k == KeyType.PRIVATE) {
      //Decrypt using privkey
      params = new PrivateKeyParameter<RSAPrivateKey>(privkey);
    } else {
      throw ArgumentError;
    }

    var cipher = new AsymmetricBlockCipher("RSA")
      ..init( false, params );

    plaintext = UTF8.decode(cipher.process(UTF8.encode(plaintext)));
    return plaintext;
  }
}

/*
var pubpar = () => new PublicKeyParameter<RSAPublicKey>(pubk);
    var cipher = new AsymmetricBlockCipher("RSA")
      ..init( true, pubpar )
    ;
 */