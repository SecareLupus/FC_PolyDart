library loginserver;

import "message_forms.dart" as Message;

  bool loginAttempt(Message.LoginRequest credentials) {
    int index = _getUserIndex(credentials.username);
    if (index == -1)
      return false;
    return _comparePassword(index, credentials.password);
  }

  int _getUserIndex(String uname) {
    List<String> users = ["Sam","Dave","Tex","Dan","Mike","Cranston"];
    int tmp = users.indexOf(uname);
    if (tmp >= 0) {
      return tmp;
    }
    return -1;
  }

  bool _comparePassword(int index, String password) {
    List<String> passwords = ["Able","to","be","picked","for","sports"];

    if (passwords[index] == password) {
      return true;
    }
    return false;
  }