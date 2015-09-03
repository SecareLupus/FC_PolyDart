import "dart:convert";
import "KeyGen.dart" show NECC_PERMS;

enum SessionType {
  CLIENT,
  USER
}

class SessionJson {
  String sesskey;
  String pubkey;
  SessionType type;
  List<NECC_PERMS> perms = [];


  SessionJson(String this.sesskey, String this.pubkey, SessionType this.type, List<NECC_PERMS> this.perms);

  SessionJson.fromJSON(String json) {
    var tmp = JSON.decode(json);
    print("INSIDE CONSTRUCTOR: $tmp");
    sesskey = tmp['api'];
    pubkey = tmp['pubkey'];
    switch (tmp['type']) {
      case "user":
        type = SessionType.USER;
        break;
      case "client":
        type = SessionType.CLIENT;
        break;
    }
    if(tmp['perms'] != "none") {
      tmp['perms'].forEach((v) {
        switch (v) {
          case "delete":
            perms.add(NECC_PERMS.DELETE);
            break;
          case "login":
            perms.add(NECC_PERMS.LOGIN);
            break;
          case "read":
            perms.add(NECC_PERMS.READ);
            break;
          case "write":
            perms.add(NECC_PERMS.WRITE);
            break;
        }
      });
    }
  }

  String toString() {
    String tmp = "{";

    tmp += "\"api\": \"${sesskey}\", ";
    tmp += "\"pubkey\": \"${pubkey}\", ";
    switch (type) {
      case SessionType.CLIENT:
        tmp += "\"type\": \"client\", ";
        break;
      case SessionType.USER:
        tmp += "\"type\": \"user\", ";
        break;
    }
    if (perms.isEmpty) {
      tmp += "\"perms\": \"none\"";
    } else {
      tmp += "\"perms\": [";
      perms.forEach((v) {
        switch (v) {
          case NECC_PERMS.DELETE:
            tmp += "\"delete\", ";
            break;
          case NECC_PERMS.LOGIN:
            tmp += "\"login\", ";
            break;
          case NECC_PERMS.READ:
            tmp += "\"read\", ";
            break;
          case NECC_PERMS.WRITE:
            tmp += "\"write\", ";
            break;
        }
      });
      tmp = tmp.substring(0, tmp.length - 2);
      tmp += "]";
    }
    tmp += "}";
    return tmp;
  }
}