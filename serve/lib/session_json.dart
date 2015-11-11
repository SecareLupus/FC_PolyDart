import "dart:convert";

import "keygen.dart" show ReqPerms;
import "package:WAGEncryption/WAGEncryption.dart" show trimNulls;

enum SessionType {
  client,
  user
}

class SessionJson {
  String sessionKey;
  String pubKey;
  SessionType type;
  List<ReqPerms> perms = [];


  SessionJson(String this.sessionKey, String this.pubKey, SessionType this.type, List<ReqPerms> this.perms);

  SessionJson.fromJSON(String json) {
    //Trim nulls from this string.
    json = trimNulls(json);
    Map _jsonDump = JSON.decode(json);

    sessionKey = _jsonDump['api'];
    pubKey = JSON.encode(_jsonDump['pubkey']);
    switch (_jsonDump['type']) {
      case "user":
        type = SessionType.user;
        break;
      case "client":
        type = SessionType.client;
        break;
    }
    if(_jsonDump['perms'] != "none") {
      _jsonDump['perms'].forEach((v) {
        switch (v) {
          case "delete":
            perms.add(ReqPerms.delete);
            break;
          case "login":
            perms.add(ReqPerms.login);
            break;
          case "read":
            perms.add(ReqPerms.read);
            break;
          case "write":
            perms.add(ReqPerms.write);
            break;
          default:
            perms.add(ReqPerms.unknown);
            break;
        }
      });
    }
  }

  String toString() {
    String _json = "{";

    _json += "\"api\": \"$sessionKey\", ";
    _json += "\"pubkey\": $pubKey, ";
    switch (type) {
      case SessionType.client:
        _json += "\"type\": \"client\", ";
        break;
      case SessionType.user:
        _json += "\"type\": \"user\", ";
        break;
    }
    if (perms.isEmpty) {
      _json += "\"perms\": \"none\"  ";
    } else {
      _json += "\"perms\": [";
      perms.forEach((v) {
        switch (v) {
          case ReqPerms.delete:
            _json += "\"delete\", ";
            break;
          case ReqPerms.login:
            _json += "\"login\", ";
            break;
          case ReqPerms.read:
            _json += "\"read\", ";
            break;
          case ReqPerms.write:
            _json += "\"write\", ";
            break;
        }
      });
      _json = _json.substring(0, _json.length - 2);
      _json += "]";
    }
    _json += "}";
    return _json;
  }
}