import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';


//Encryption method
class LocalStorageEncryptionMethod {
  static final LocalStorageEncryptionMethod instance =
      LocalStorageEncryptionMethod._();
  late IV _iv;
  late Encrypter _encrypter;

  LocalStorageEncryptionMethod._() {
    const mykey = 'Graspear@102';
    const myiv = 'LocalStorageEncryptionMethod';
    final keyUtf8 = utf8.encode(mykey);
    final ivUtf8 = utf8.encode(myiv);
    final key = sha256.convert(keyUtf8).toString().substring(0, 32);
    final iv = sha256.convert(ivUtf8).toString().substring(0, 16);
    _iv = IV.fromUtf8(iv);
    _encrypter = Encrypter(AES(Key.fromUtf8(key), mode: AESMode.cbc));
  }

  String encrypt(String value) {
    return _encrypter.encrypt(value, iv: _iv).base64;
  }

  String decrypt(String base64value) {
    final encrypted = Encrypted.fromBase64(base64value);

    var decrypt = _encrypter.decrypt(encrypted, iv: _iv);

    return decrypt;
  }
}
// use this format
// var encrypted = LocalStorageEncryptionMethod.instance.encrypt('my value to be encrypted');
// var decrypted = LocalStorageEncryptionMethod.instance.decrypt(encrypted);