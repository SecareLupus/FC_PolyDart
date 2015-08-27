import "package:rpc/rpc.dart";
import "MessageForms.dart" as Message;
import "KeyGen.dart" as KeyGen;

@ApiClass(
  name: 'fc',
  version: 'v1',
  description: 'Friend Computer API')
class FCApi {
  @ApiMethod(method: 'GET', path: 'syn')
  Message.SynResponse getLoginKey() {
    print("getLoginKey() accessed");
    var tmp = KeyGen.KeyGen.getLoginKey("test");
    print("Key: $tmp");
    print(KeyGen.KeyGen.getPerms(tmp.login_key));
    return null;
  }

  @ApiMethod(method: 'POST', path: 'resource/{name}/update')
  VoidMessage updateResource(String name, MSG2 request) {
    return;
  }
}