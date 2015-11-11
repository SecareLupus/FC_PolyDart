import "dart:io";
import "lib/fc/fc.dart" as API;
import "../serve/lib/encryption.dart";
import 'package:http/http.dart' as http;

main() async {
  String privkey = """-----BEGIN RSA PRIVATE KEY-----
MIICXAIBAAKBgQCsYrN4DDCxD5pOmpuCwFg5MX6XWnbsazcthQHZE25f0IlC/TUi
eSXYN+5CkDfyE02GMW5zz0o9xWNql7NhMTsgXZh2uYcmffjvIIvPGYpPScVmu0mv
Wi4gG3IOodvb/6eKuao08KxCbwXFBH5nQUB8pduzSMMVW18bjz8lxJvkDwIDAQAB
AoGAD+vp0Yumr6PWR65F8LSdMWMd4xLK6xkX9o9TVV5TEmxrURGb57wyv56i1ekG
Eciwn1VPc0jQ/ZWOkhjCy5ZFdJfoatVKMH4Q5FJEMbhYE+BvvkdQ2emMw6Pjf+V/
jzwU9eCotqPiC8s+NDd4tFpLNwBw5vs3P50XD8BRX8k2yjECQQDhyQ9rFENd0BtQ
zKIJ0QhYnOgnfuufhJcEFEx8gHyxojzFEbjgxe84BeBzGLSB+bw+2dR1oPDlraN/
jYrdB6F3AkEAw3RF3XDS9Xgx8v9VzyaYa0Y9EBX+ircwKeJ7r40pm5P19auWo6SH
24UN5urNTqsO6bJtF/oOSKozh80Bsbc4KQJATIfgKAV4SCYv/BVAn18xGwgkUK7e
ovVIUuOmgVTz7yn0uz+kkNvGmBC14Y1wMdY6jns7Xpusy80tbCDH/t+FRQJBAJsT
f/NIdzjn2smwKUcomjpTClPe/4zT99Tjq7sHx4F3DemT8Pt5qYlUskkK90Z5lmV5
efFSJ08kK6qNz9BPTLECQD6804fmZ0iJA3tD9op/KdKOCOwNqfqtDOCKhQ+OyCzC
Rh6GxSOJrOPtZbwi2g9AkLLt42yOqs4UcAOgpq1tvxM=
-----END RSA PRIVATE KEY-----""";
  String pubkey = """-----BEGIN PUBLIC KEY-----
MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCsYrN4DDCxD5pOmpuCwFg5MX6X
WnbsazcthQHZE25f0IlC/TUieSXYN+5CkDfyE02GMW5zz0o9xWNql7NhMTsgXZh2
uYcmffjvIIvPGYpPScVmu0mvWi4gG3IOodvb/6eKuao08KxCbwXFBH5nQUB8pduz
SMMVW18bjz8lxJvkDwIDAQAB
-----END PUBLIC KEY-----""";

  Encryption enc = new Encryption(pubkey, privkey);
  http.Client cl = new http.Client();
  API.FcApi callServer = new API.FcApi(cl);

  API.SynRequest reqLogin = new API.SynRequest()..pubKey = pubkey;
  var newintfortakingamoment = null;
  API.SynResponse tmp = await callServer.getLoginKey(reqLogin);
  print("Server Pubkey: ${tmp.pubKey}");
  print("Client LoginKey: ${tmp.loginKey}");
}