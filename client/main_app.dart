import "dart:io";
import "lib/fc/v1.dart";
import "../serve/lib/encryption.dart";
import 'package:http/http.dart' as http;

main() async {
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
  http.Client cl = new http.Client();
  FcApi callServer = new FcApi(cl);

  SynRequest reqLogin = new SynRequest()..pubKey = pubkey;
  var tmp = await callServer.getLoginKey(reqLogin);
  print("Server Pubkey: ${tmp.pubKey}");
  print("Client LoginKey: ${tmp.loginKey}");
}