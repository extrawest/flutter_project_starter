import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageUtils {
  static final String _authTokenKey = '_auth_token_key';

  static final storage = FlutterSecureStorage();

  static Future<String?> read(String key) async {
    return await storage.read(key: key);
  }

  static Future<Map<String, String>> readAll() async {
    return await storage.readAll();
  }

  static Future<void> delete(String key) async {
    await storage.delete(key: key);
  }

  static Future<void> deleteAll() async {
    await storage.deleteAll();
  }

  static Future<void> write(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  /// Use this method to securely save auth token
  static Future<void> writeAuthToken(String value) async {
    await write(_authTokenKey, value);
  }

  static Future<String?> readAuthToken() async {
    return await read(_authTokenKey);
  }
}
