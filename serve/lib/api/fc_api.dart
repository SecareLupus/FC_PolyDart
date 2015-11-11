import "dart:convert";
import "dart:async";
import "../../../packages/rpc/rpc.dart";
import "../encryption.dart" show LocalServer;
import "../message_forms.dart" as Message;
import "../keygen.dart" as KeyGen;
import "../session_json.dart";
import "../LoginServer.dart" as LoginServer;
import "package:WAGEncryption/WAGEncryption.dart";

@ApiClass(
  name: 'fc',
  version: 'v1',
  description: 'Friend Computer API')
class FCApi {

  ///Called when a new client wants to establish a connection with the server.
  /// The client will pass in an LKeyRequest containing a serialized pubkey,
  /// the server will then generate a new LKey, and record the client's pubkey
  /// in the Redis with an expiration time. LKey should be encrypted with the
  /// client's pubkey before returning it.
  @ApiMethod(method: 'POST', path: 'syn')
  Future<Message.LKeyResponse> getLoginKey(Message.LKeyRequest pubkey) async {
    //Generate LKey
    String LKey = await KeyGen.getLoginKey(pubkey.pubKey);
    //Encrypt LKey with client's provided pubkey
    wagRSAEncryption clPub = new wagRSAEncryption.deserialize(pubkey.pubKey);

    //Return a serialized server pubkey, and the encrypted LKey
    wagRSAEncryption pub = LocalServer.pubOnly;
    wagMessageEncryption crypt = new wagMessageEncryption(LocalServer.localRSACipher, clPub);
    return new Message.LKeyResponse()..pubKey = pub.serializeKeys()
                                    ..loginKey = crypt.encrypt(LKey);
  }

  @ApiMethod(method: 'POST', path: 'login')
  Future<Message.LoginResponse> apiLogin(Message.LoginRequest credentials) async {
    String apiKey = LocalServer.localRSACipher.decrypt(credentials.loginKey);
    //Crashes on KeyGen.getPubKey
    String clPubKey = await KeyGen.getPubKey(apiKey);
    wagMessageEncryption decipher = new wagMessageEncryption(new wagRSAEncryption.deserialize(clPubKey), LocalServer.localRSACipher);

    credentials.username = decipher.decrypt(credentials.username);
    credentials.password = decipher.decrypt(credentials.password);
    wagMessageEncryption cipher = new wagMessageEncryption(LocalServer.localRSACipher, new wagRSAEncryption.deserialize(clPubKey));

    if (LoginServer.loginAttempt(credentials)) {
      String uuid = await KeyGen.getUserKey(credentials.loginKey);
      return new Message.LoginResponse()
        ..success = true
        ..userKey = cipher.encrypt(uuid);
    } else {
      return new Message.LoginResponse()
        ..success = false
        ..userKey = "";
    }
  }
}