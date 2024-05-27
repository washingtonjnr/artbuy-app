import 'dart:convert';

// Utils
import 'package:artbuy/app/core/utils/localStorage.dart';
import 'package:artbuy/app/core/utils/localStorageKeys.dart';

abstract class AppLocalStorage {
  // - [SET] ACCESS TOKEN
  static Future<bool> setAccessToken(String token) async =>
      await setStringLocalStorage(LocalStorageKeys.accessToken, token);

  // - [GET] ACCESS TOKEN
  static Future<String?> getAccessToken() async =>
      await getStringLocalStorage(LocalStorageKeys.accessToken);

  // - [SET] REFRESH TOKEN
  static Future<bool> setRefreshToken(String token) async =>
      await setStringLocalStorage(LocalStorageKeys.refreshToken, token);

  // - [GET] REFRESH TOKEN
  static Future<String?> getRefreshToken() async =>
      await getStringLocalStorage(LocalStorageKeys.refreshToken);

  // - [SET] USER
  static Future<bool> setUser(dynamic user) async =>
      await setStringLocalStorage(LocalStorageKeys.user, jsonEncode(user));

  // - [GET] USER
  static Future<dynamic> getUser() async {
    String? user = await getStringLocalStorage(LocalStorageKeys.user);

    return (user != null) ? jsonDecode(user) : null;
  }

  // - [DELETE] SESSION
  static Future removeSession() async {
    await removeStringLocalStorage(LocalStorageKeys.user);
    await removeStringLocalStorage(LocalStorageKeys.accessToken);
    await removeStringLocalStorage(LocalStorageKeys.refreshToken);

    return true;
  }
}
