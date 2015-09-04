library message;

class SynResponse {
  String loginKey;
  String pubKey;

  void doSomething(cb(String s)) {
    loginKey = cb(loginKey);
    pubKey = cb(pubKey);
  }
}

class LoginRequest {
  String loginKey;
  String username;
  String password;
}

class LoginResponse {
  bool success;
  String userKey;
}