import "../lib/api/fc_api.dart";
import "../lib/message_forms.dart";
import "../lib/keygen.dart" as KeyGen;
import "package:cipher/cipher.dart";
import "package:WAGEncryption/WAGEncryption.dart";
main() async {
  //Generate client keys and encryption objects.
  FCApi api = new FCApi();
  AsymmetricKeyPair clientKeys = wagKeyGen.generateKeys();
  wagRSAEncryption client_rsa = new wagRSAEncryption(clientKeys.publicKey, clientKeys.privateKey);
  wagRSAEncryption client_pub = new wagRSAEncryption(client_rsa.pub);
  String clPubStr = client_pub.serializeKeys();

  //Create LKeyRequest Message and call FCApi.getLoginKey for LKeyResponse
  LKeyRequest msg0 = new LKeyRequest()..pubKey = clPubStr;
  LKeyResponse resp0 = await api.getLoginKey(msg0);

  //Create message encryption objects
  wagRSAEncryption server_pub = new wagRSAEncryption.deserialize(resp0.pubKey);
  wagMessageEncryption encrypter = new wagMessageEncryption(client_rsa, server_pub);
  wagMessageEncryption decrypter = new wagMessageEncryption(server_pub, client_rsa);

  //Decrypt the login key we've received back, and store it in a local variable.
  String session_lkey = decrypter.decrypt(resp0.loginKey);
  print(session_lkey);

  //Create LoginRequest and call FCApi.apiLogin for a LoginResponse
  LoginRequest msg1 = new LoginRequest()..loginKey = server_pub.encrypt(session_lkey)
                                        ..username = encrypter.encrypt("Dave")
                                        ..password = encrypter.encrypt("picked");
  LoginResponse resp1 = await api.apiLogin(msg1);
  if (resp1.success)
    resp1.userKey = decrypter.decrypt(resp1.userKey);
  print("Login success? ${resp1.success}");
  print("UKey: ${resp1.userKey}");
  List<KeyGen.ReqPerms> perms = null;
  if (resp1.success)
    perms = await KeyGen.getPerms(resp1.userKey);
  print("Perms: $perms");
}