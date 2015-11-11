library message;

///Used for initial contact with server, it includes a string, derived from
/// calling [wagRSAEncryption.serializeKeys()] on an object with a null
/// private key and the client's public key. This allows us to create a
/// new copy of the encryption object with wagRSAEncryption.deserialize(pubKey).
class LKeyRequest {
  //Unencrypted
  String pubKey;
}

///Used when server responds to initial contact, it includes a string representing
/// a unique session identifier (stored in the Redis with the provided pubkey),
/// and a string derived from calling [wagRSAEncryption.serializeKeys()] on an
/// object with a null private key and the server's public key. This allows us
/// to create a new copy of the encryption object with
/// wagRSAEncryption.deserialize(pubKey). Our new LKey should be encrypted with
/// the client's pubkey.
class LKeyResponse {
  //Encrypted with Client_PubKey and Signed with Server_PrivKey
  String loginKey;
  //Unencrypted
  String pubKey;

  //String toString() => "LKeyResponse; {'loginKey': '$loginKey', 'pubKey': '$pubKey'";
}

///Used when client is attempting to open a user session. This message includes
/// three simple Strings, representing the previously received LKey, as well as
/// username/password credentials. These strings should be signed by the client,
/// and encrypted with the server's pubkey, so only the server can decrypt them.
class LoginRequest {
  //Encrypted with Server_PubKey
  String loginKey;
  //Encrypted with Server_PubKey and Signed with Client_PrivKey
  String username;
  String password;
}

///Used when server responds to a client request to open a user session. This
/// message includes a boolean representing success or failure, and a string
/// representing the generated UKey, or null if success==false. The UKey should
/// be encrypted with the client's pubkey, so only the client can decrypt them.
///
class LoginResponse {
  //Encrypted with Client_PubKey and Signed with Server_PrivKey
  bool success;
  String userKey;
}

///When passing large bundles of information around, we want to encrypt them
/// with AES instead of RSA. This message provides us with a mechanism for securely
/// passing the symmetric AES key from server to client. This should always be
/// signed and encrypted using RSA before sending.
class AESSharedKeyMessage {
  String secretKey;
}