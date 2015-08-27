/// main_server.dart
/// Primary entry point for loading the server.
/// Loads the server, sets it to listen, and passes any input over to
///   the api class.

import "dart:io";
import "package:rpc/rpc.dart";
import "lib/FCApi.dart";

final ApiServer _apiServer = new ApiServer();

main() async {
  _apiServer.addApi(new FCApi());
  HttpServer server = await HttpServer.bind(InternetAddress.ANY_IP_V6, 8080);
  print("Listening on ${server.address.toString()}:${server.port}");
  server.listen(_apiServer.httpRequestHandler);
}