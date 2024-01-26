// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const _secureStorage = FlutterSecureStorage();
AndroidOptions _getAndroidOptions() => const AndroidOptions(
      encryptedSharedPreferences: true,
    );

Future<String?> readSecureData(String key) async {
  var readData =
      await _secureStorage.read(key: key, aOptions: _getAndroidOptions());
  return readData;
}

Future<String?> getAccessToken() async {
  final readValue = await readSecureData("authInfo");
  final Map<String, dynamic> authInfo = jsonDecode(readValue!);
  // print(test["accessToken"]);
  return authInfo["accessToken"];
}
