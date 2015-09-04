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
//TEST IMPORTS END

final ApiServer _apiServer = new ApiServer();

main() {
  String privkey = """-----BEGIN RSA PRIVATE KEY-----
MIICWgIBAAKBgE1WuGcrt3mXKOMRoL4RMCfmb48oYZs7Hm9Clwxemx2PhTe4++DT
C8h1K89RWXhd6YmgyjjOe5CgfZd8Ksm2Q4pVh2kNO9+6sWGc/tx0YyhmYi3GMSJd
KNxHgGv21lCcvzjLD1C8rlg0KD3OiRSHwdYsiBGCqJKptOlu46HFwhpxAgMBAAEC
gYBLMrYMgwJcNLEp0FsWVAoZ0cLJVL9LO3mFPx81hMuYO5ORsckfOrXrTJqzc2rm
UZIhIvldsM+Oua5EXBQSm6khRzkQSz6hyFYnHwQMzU0qZZBbLmKMyKdbOP2iVDPu
Nxhazf5p0eQSq11chNfp+K3DUyC5eP/Whw1LhGHXsEGHjQJBAJhOp/OEz9plEOdl
1UaY0dzkWPuCmuXZhOQ9kQBRsAqKl33AUHdQTs/d3qrpjCzybybj2VOS7Lr0PyPB
hRscERcCQQCB/fIZawhocInIoadzfgA3b/feWyGsM8leH50PR7vnwvh2OpTYRH7z
aOqS5ii36w/nyb9bqxSxRGauoWUD7RW3AkBYC1gheMwjBruP2JlCt0LR+5rIwcZD
Ssv8mO6CjbZDUbyjMBIT9vOoTCzVBi9HKFpC1AIkwtFgfaMmS09jzYS/AkBBaNf2
hE4Rx3b9VqJc0e0n+BZgc7jI3rIXw46TTsQ1hXzieO3GuQisUIGgc2HP0d8KAhFg
/gAGhuWoP5wF0rmXAkBENqO9DeOaSfsVhQbniMzGyDdVUujGaIjAh3G24sApjcKv
MmF+nBtmFX0ZdxkQTY3rkrcnb6bxHSLcnelfruuQ
-----END RSA PRIVATE KEY-----""";
  String pubkey = """-----BEGIN PUBLIC KEY-----
MIGeMA0GCSqGSIb3DQEBAQUAA4GMADCBiAKBgE1WuGcrt3mXKOMRoL4RMCfmb48o
YZs7Hm9Clwxemx2PhTe4++DTC8h1K89RWXhd6YmgyjjOe5CgfZd8Ksm2Q4pVh2kN
O9+6sWGc/tx0YyhmYi3GMSJdKNxHgGv21lCcvzjLD1C8rlg0KD3OiRSHwdYsiBGC
qJKptOlu46HFwhpxAgMBAAE=
-----END PUBLIC KEY-----""";

  Encryption enc = new Encryption(pubkey, privkey);
  Encryption dec = new Encryption(pubkey, null);

  String plaintext = "This is plaintext for the encryption testing";
  print("Plaintext: $plaintext");
  print("Ciphertext with enc: ${enc.encrypt(plaintext)}");
  print("Ciphertext with enc: ${enc.encrypt(plaintext)}");
  print("Ciphertext with enc: ${enc.encrypt(plaintext)}");
  String encciphertext = enc.encrypt(plaintext);
  print("Ciphertext with dec: ${dec.encrypt(plaintext)}");
  String decciphertext = dec.encrypt(plaintext);
  print("Decrypted from enc: ${enc.decrypt(encciphertext)}");
  print("Decrypted from dec: ${enc.decrypt(decciphertext)}");
  var signedpt = enc.sign(plaintext);
  print("Signed Plaintext: $signedpt");
  print("Plaintext Sig Verified? ${dec.verify(signedpt, plaintext)}");


  /* This is the real code. Uncomment to run server.
  _apiServer.addApi(new FCApi());
  HttpServer.bind(InternetAddress.ANY_IP_V6, 8080).then((binding) {
    print("Listening on ${binding.address}:${binding.port}");
    binding.listen(_apiServer.httpRequestHandler);
  });
  */
}