import "dart:async";
import "package:rpc/rpc.dart";
import "package:rsa/rsa.dart";
import "MessageForms.dart" as Message;
import "KeyGen.dart" as KeyGen;
import "LoginServer.dart" as LoginServer;

@ApiClass(
  name: 'fc',
  version: 'v1',
  description: 'Friend Computer API')
class FCApi {

  @ApiMethod(method: 'POST', path: 'syn')
  Future<Message.SynResponse> getLoginKey(String pubkey) async {
    print("getLoginKey() accessed");
    var tmp = await KeyGen.getLoginKey(pubkey);
    print("Key: $tmp");
    return new Message.SynResponse()..pubkey = pubkey
                                    ..login_key = tmp;
  }

  @ApiMethod(method: 'POST', path: 'login')
  Future<Message.LoginResponse> apiLogin(Message.LoginRequest credentials) async {
    if (LoginServer.loginAttempt(credentials)) {
      return new Message.LoginResponse()
        ..success = true
        ..user_key = await KeyGen.getUserKey();
    } else {
      return new Message.LoginResponse()
        ..success = false
        ..user_key = "";
    }
  }
}