/// main_server.dart
/// Primary entry point for loading the server.
/// Loads the server, sets it to listen, and passes any input over to
///   the api class.

import "dart:io";
import "package:rpc/rpc.dart";
import "lib/api/fc_api.dart";

final ApiServer _apiServer = new ApiServer();

main() {
  _apiServer.addApi(new FCApi());
  _apiServer.enableDiscoveryApi();
  HttpServer.bind(InternetAddress.ANY_IP_V4, 8080).then((binding) {
    print("Listening on ${binding.address}:${binding.port}");
    binding.listen(_apiServer.httpRequestHandler);
  });
}