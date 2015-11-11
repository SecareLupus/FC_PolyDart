library encryption;

import "package:WAGEncryption/WAGEncryption.dart";

enum CipherType {
  AES,
  RSA
}

class LocalServer {
  static String _localRSAKeyJSON = '{"p":"f37c95f3002a2164dfba8d9535de30b603020705c0e77aa2695459c29fdad43b6692bbf538fee3e5cc37b84a54f4779fd09fe326aca790728d7ebb27d4e3ab57ad96605f7ff2396986f1a16afe9b3fdd8f86474a5da1a88983539f330ecd1f48f5558b85a8f87b0204b0f98c797eee83b781f9a8573dcd74611f185edfaf12bf","q":"ed5f7655c236ef4373779b9da4091f8710a6c598d4c3ad228e536ea986131a88736d0a885b6f9ac800a304623768885c3a638e759f178f7db6cd2c3833f4741bf81c7ade9e26863481ac0e6dd56a25989dd663166da6853159c8283b8a0a20104ed800d89a94dd875ad47b8792c5f65d4473a6d5e3828a31d8aa6d9f1cb87c4f","privateexponent":"a6936edea71a07accae7985613da509f70930da40b981bd44311231904aea8bc20529320202cbacb6310d73617d0baa5549461ba8d68680c63858b2ebcdc25f6639c55965c1652cd5d21f77ec3dcacf51b82016b2cb5600fb6b13c031865b1fba40ae93fea70ba03c832603ca4cfe4e4d1a36378b1af35dd7556e6b3215e610c73ba27cca5f817b37c71030a4af5967c1246e4745422caa0b26ecdb0d3ec67344835587065132208147e1d86b6324d726f9514e5a4908c29b34ac7881c660991d7146f586991cbe72efc44337905db460ac8c34ac3b6ae2a4b29da31683dcae464d92bc5a86144c1831c0845f17bb6a931d41deb3c297948acc7af5992681349","modulus":"e1c5229a9a8885ca7fbe1d260bb689fa7aa66bfa3f10fdda3c3c37d59a2849547de997767360adc7c369d2dda7f5d916592fa10937d3fafc37b4c59b01a2a516de7afb6881ece9db8dc4537bf5018f947702ca29d0a12ef1e666df2aa471dc68851ca620e85beeb3721a73dae1cb2c0aaa5f0c86d74ebeaebfe8c4d4c9d385068279e91a4633448a10475dfaa0376452c427a4caadb89e12a69b989a3cfa07e2809bbf9dffdc5e2589e1facd33b5e39f24f13be605733561b871f3f2d021f23ce5ad2157eff69e65432dafee28faf26d430d3848a02c4439a889792847d57ee9b42659f32690c59fcf42990977f96b6136e706211fe451c6009c5d2331634cf1","publicexponent":"10001"}';
  static final wagRSAEncryption localRSACipher = new wagRSAEncryption.deserialize(_localRSAKeyJSON);
  static String _localAESKeyJSON = 'IÅÒ¯âe%§`Øçä|_|+í`=A®ýÅÍ8#u';
  static final wagAESEncryption localAESCipher = new wagAESEncryption.deserialize(_localAESKeyJSON);

  static get pubkey => localRSACipher.pub;
  static get privkey => localRSACipher.priv;

  static wagRSAEncryption get pubOnly => new wagRSAEncryption(pubkey);

  //Encrypt a string with the local public key. This message can be read by the server.
  //Returns a ciphertext String.
  static String encrypt(String plaintext, [CipherType method = CipherType.RSA]) {
    String encoded = "plaintext";
    if (method == CipherType.RSA)
      encoded = localRSACipher.encrypt(plaintext);
    if (method == CipherType.AES)
      encoded = localAESCipher.encrypt(plaintext);
    return encoded;
  }

  //Decrypt a string with the local private key. Decrypts messages encrypted with LocalServer.encrypt().
  //Returns a plaintext String.
  static String decrypt(String ciphertext, [CipherType method = CipherType.RSA]) {
    String decoded = ciphertext;
    if (method == CipherType.RSA)
      decoded = localRSACipher.decrypt(ciphertext);
    if (method == CipherType.AES)
      decoded = localAESCipher.decrypt(ciphertext);
    return decoded;
  }

  //Signs a message to prove the server sent it. Anyone can verify this signature.
  //Returns a signature digest String.
  static String sign(String message) {
    RSASignature sig = localRSACipher.sign(message);
    Uint8List sigbytes = sig.bytes;
    return wagConvert.u8L_string(sigbytes);
  }

  //Verifies that sig is both valid, from the LocalServer, and also a signed digest of message.
  //Returns true if sig is a signed digest of message, false otherwise.
  static bool verify(String sig, String message) {
    Uint8List bytes = wagConvert.string_u8l(sig);
    RSASignature sigbytes = new RSASignature(bytes);
    return localRSACipher.verify(message, sigbytes);
  }
}