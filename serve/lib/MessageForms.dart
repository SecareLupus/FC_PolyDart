class MSG1 {
  String api_key;
  String name;
  int capacity;
}

class MSG2 {
  String api_key;
  int newCapacity;
}

class SynResponse {
  String login_key;
  String server_pub_key;
}

class LoginRequest {
  String login_key;
  String username;
  String password;
}

class LoginResponse {
  bool success;
  String user_key;
}