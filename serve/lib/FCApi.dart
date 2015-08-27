import "package:rpc/rpc.dart";
import "package:redis_client/redis_client.dart";
import "MessageForms.dart";
import "KeyGen.dart";

@ApiClass(
  name: 'fc',
  version: 'v1',
  description: 'Friend Computer API')
class FCApi {
  @ApiMethod(method: 'GET', path: 'helo/{pubkey}')
  SynResponse getLoginKey(String pubkey) {
    print("getLoginKey() accessed");
    var tmp = KeyGen.getLoginKey("test");
    print("Key: $tmp");
    print(KeyGen.getPerms(tmp.login_key));
    return null;
  }

  @ApiMethod(method: 'POST', path: 'resource/{name}/update')
  VoidMessage updateResource(String name, MSG2 request) {
    return;
  }
}