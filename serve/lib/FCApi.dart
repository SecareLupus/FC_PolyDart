import "dart:async";
import "package:rpc/rpc.dart";
import "MessageForms.dart" as Message;
import "KeyGen.dart" as KeyGen;

@ApiClass(
  name: 'fc',
  version: 'v1',
  description: 'Friend Computer API')
class FCApi {
  @ApiMethod(method: 'GET', path: 'syn')
  Future<Message.SynResponse> getLoginKey() async {
    print("getLoginKey() accessed");
    var tmp = await KeyGen.KeyGen.getLoginKey("test");
    print("Key: $tmp");
    //print(KeyGen.KeyGen.getPerms(tmp.login_key));
    return new Message.SynResponse()..server_pub_key = "test"
                                    ..login_key = tmp;
  }

  @ApiMethod(method: 'POST', path: 'resource/{name}/update')
  VoidMessage updateResource(String name, Message.MSG2 request) {
    return new VoidMessage();
  }
}