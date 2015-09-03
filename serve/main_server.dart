/// main_server.dart
/// Primary entry point for loading the server.
/// Loads the server, sets it to listen, and passes any input over to
///   the api class.

import "dart:io";
import "package:rpc/rpc.dart";
import "lib/FCApi.dart";

//TEST IMPORTS START
import "lib/KeyGen.dart" as KeyGen;
import "lib/Encryption.dart";
import "package:cipher/cipher.dart";
import "package:bignum/bignum.dart";
//TEST IMPORTS END

final ApiServer _apiServer = new ApiServer();

main() async {
  String key1 = await KeyGen.getLoginKey("PUBKEYSAREAWESOME");
  String key2 = await KeyGen.getLoginKey("THISONETOO");
  String key3 = await KeyGen.getLoginKey("ONEMORENOW");

  print
  /* This is the real code. Uncomment to run server.
  _apiServer.addApi(new FCApi());
  HttpServer.bind(InternetAddress.ANY_IP_V6, 8080).then((binding) {
    print("Listening on ${binding.address}:${binding.port}");
    binding.listen(_apiServer.httpRequestHandler);
  });
  */
}