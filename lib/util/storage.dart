import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Storage {
  final _storage = const FlutterSecureStorage();

  Future<void> write({required StorageKey key, required String value}) async {
    await _storage.write(key: key.name, value: value);
  }

  Future<String?> read({required StorageKey key}) async {
    return await _storage.read(key: key.name);
  }

  Future<void> delete({required StorageKey key}) async {
    await _storage.delete(key: key.name);
  }

  Future<void> deleteAll() async {
    await _storage.deleteAll();
  }
}

enum StorageKey { token }
