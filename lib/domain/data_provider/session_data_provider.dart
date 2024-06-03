import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class _Key {
  static const sessionId = 'session-id';
}

class SessionDataProvider {
  static const _secureStorage = FlutterSecureStorage();

  Future<String?> getSessionId() => _secureStorage.read(key: _Key.sessionId);
  Future<void> setSesionId(String? value) async {
    if (value != null) {
      _secureStorage.write(key: _Key.sessionId, value: value);
    } else {
      _secureStorage.delete(key: _Key.sessionId);
    }
  }

  // set sessionId(String value) => print(value);
}
