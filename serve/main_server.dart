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

  _apiServer.addApi(new FCApi());
  _apiServer.enableDiscoveryApi();
  HttpServer.bind(InternetAddress.ANY_IP_V4, 8080).then((binding) {
    print("Listening on ${binding.address}:${binding.port}");
    binding.listen(_apiServer.httpRequestHandler);
  });

  /*
  String message = "This is a message intended for people who are not bears or other reptiles.";
  AsymmetricKeyPair tmp = wagKeyGen.generateKeys();
  RSAPublicKey pub = tmp.publicKey;
  RSAPrivateKey priv = tmp.privateKey;
  wagRSAEncryption client_secret = new wagRSAEncryption(pub, priv);
  wagRSAEncryption client_shared = new wagRSAEncryption(pub);
  */
  /**
   * We need message to get to client with complete secrecy.
   *  - Generate new AES key
   *  - Sign message with private rsa key
   *  - Encrypt message with AES
   *  - Encrypt AES key with RSA key and attach to message.
   */
  /*
  wagMessageEncryption signcrypt = new wagMessageEncryption(LocalServer.localRSACipher, client_secret);
  wagMessageEncryption signcrypt2 = new wagMessageEncryption(LocalServer.localRSACipher, client_secret);

  String ct = "";
  try {
    ct = signcrypt.encrypt(message);
  } on UnsupportedError catch (e) {
    print(e);
  } on StateError catch (e) {
    print(e);
  }
  //---------------------------------------------------------------
  String pt = "";
  try {
    pt = signcrypt2.decrypt(ct);
  } on UnsupportedError catch (e) {
    print(e);
  } on ArgumentError catch (e) {
    pt = e.message;
  } on StateError catch (e) {
    print(e);
  }

  print("We have decoded the message: $pt");

  */
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
}

String trimSig(String sig) {
  List<int> codeUs = sig.codeUnits;
  codeUs = codeUs.reversed;
  while(codeUs[0] == 0) {
    codeUs.removeAt(0);
  }
  return (new String.fromCharCodes(codeUs.reversed));
}