import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:student_study_material/models/storage_items.dart';

class StorageService {
  final _secureStorage = FlutterSecureStorage();

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  Future<void> writeSecureData(StorageItem newItem) async {
    await _secureStorage.write(
        key: newItem.key, value: newItem.value, aOptions: _getAndroidOptions());
  }

  Future<String?> readSecureData(String key) async {
    var readData =
        await _secureStorage.read(key: key, aOptions: _getAndroidOptions());
    return readData;
  }
}
