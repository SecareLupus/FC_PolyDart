import "dart:async";
import "package:rpc/rpc.dart";
import "package:rsa/rsa.dart";
import "encryption.dart" show LocalServer;
import "message_forms.dart" as Message;
import "keygen.dart" as KeyGen;
import "LoginServer.dart" as LoginServer;

@ApiClass(
  name: 'fc',
  version: 'v1',
  description: 'Friend Computer API')
class FCApi {
  @ApiMethod(method: 'POST', path: 'syn')
  Future<Message.SynResponse> getLoginKey(Message.SynRequest pubkey) async {
    var tmp = await KeyGen.getLoginKey(pubkey.pubKey);
    print("Key: $tmp");
    return new Message.SynResponse()..pubKey = LocalServer.pubKey
                                    ..loginKey = tmp;
  }

  @ApiMethod(method: 'POST', path: 'login')
  Future<Message.LoginResponse> apiLogin(Message.LoginRequest credentials) async {
    if (LoginServer.loginAttempt(credentials)) {
      return new Message.LoginResponse()
        ..success = true
        ..userKey = await KeyGen.getUserKey(credentials.loginKey);
    } else {
      return new Message.LoginResponse()
        ..success = false
        ..userKey = "";
    }
  }
}