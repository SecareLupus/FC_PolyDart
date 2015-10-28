/// main_server.dart
/// Primary entry point for loading the server.
/// Loads the server, sets it to listen, and passes any input over to
///   the api class.

import "dart:io";
import "package:rpc/rpc.dart";
import "lib/api/fc_api.dart";

//TEST IMPORTS START
import "package:WAGEncryption/WAGEncryption.dart";
import "lib/keygen.dart" as KeyGen;
import "lib/encryption.dart";
//TEST IMPORTS END

final ApiServer _apiServer = new ApiServer();

main() {

  String message = "This is a message intended for people who are not bears or other reptiles.";
  AsymmetricKeyPair tmp = wagKeyGen.generateKeys();
  RSAPublicKey pub = tmp.publicKey;
  RSAPrivateKey priv = tmp.privateKey;
  wagRSAEncryption client_secret = new wagRSAEncryption(pub, priv);
  wagRSAEncryption client_shared = new wagRSAEncryption(pub);

  /**
   * We need message to get to client with complete secrecy.
   *  - Generate new AES key
   *  - Sign message with private rsa key
   *  - Encrypt message with AES
   *  - Encrypt AES key with RSA key and attach to message.
   */

  String sig = LocalServer.sign(message);
  StringBuffer mail = new StringBuffer();
  mail.writeAll([message, sig], "|_|");
  wagDerivedKey newAESKey = wagKeyGen.randomDerivedKey();
  wagAESEncryption symcrypt = new wagAESEncryption.fromUint8List(newAESKey.dk_key, newAESKey.dk_iv);
  String ciphertext = symcrypt.encrypt(mail.toString());
  String aes_key_serialized = symcrypt.serializeKey();
  aes_key_serialized = client_shared.encrypt(aes_key_serialized);
  StringBuffer tmpbuf = new StringBuffer();
  tmpbuf.writeAll([aes_key_serialized, ciphertext], "|_|");
  String sentMessage = tmpbuf.toString();
  //---------------------------------------------------------------
  String gotMessage = sentMessage;
  print("Mail: $gotMessage");
  var splitMessage = gotMessage.split("|_|");
  String decryptedAES = client_secret.decrypt(splitMessage[0]);
  String encryptedMessage = splitMessage[1];
  wagAESEncryption clientAES = new wagAESEncryption.deserialize(decryptedAES);
  String decryptedMessage = clientAES.decrypt(encryptedMessage);
  var decryptArray = decryptedMessage.split("|_|");
  String clDecMes = decryptArray[0];
  String clDecSig = decryptArray[1];
  bool cameFromServer = LocalServer.verify(clDecSig, clDecMes);

  print("We have decoded the message: $clDecMes");
  print("We have verified it came from the server: $cameFromServer");


  /* Testing AES/RSA Encryption
  String plaintext = "This is an interesting string.";

  String AESEncoded = LocalServer.encrypt(plaintext, CipherType.AES);
  String RSAEncoded = LocalServer.encrypt(plaintext, CipherType.RSA);

  printwrite("PT: $plaintext");
  print("AES: $AESEncoded");
  print("RSA: $RSAEncoded");

  String AESDecoded = LocalServer.decrypt(AESEncoded, CipherType.AES);
  String RSADecoded = LocalServer.decrypt(RSAEncoded, CipherType.RSA);

  print("AES-Decoded: $AESDecoded");
  print("RSA-Decoded: $RSADecoded");
  */


  /*
  _apiServer.addApi(new FCApi());
  _apiServer.enableDiscoveryApi();
  HttpServer.bind(InternetAddress.ANY_IP_V4, 8080).then((binding) {
    print("Listening on ${binding.address}:${binding.port}");
    binding.listen(_apiServer.httpRequestHandler);
  });
  */
}