import 'dart:convert';

// Utils
import 'package:artbuy/app/core/utils/localStorage.dart';

abstract class AppLocalStorage {
  // - [SET] ACCESS TOKEN
  static Future<bool> setAccessToken(String token) async =>
      await setStringLocalStorage('access_token', token);

  // - [GET] ACCESS TOKEN
  static Future<String?> getAccessToken() async =>
      await getStringLocalStorage('access_token');

  // - [SET] REFRESH TOKEN
  static Future<bool> setRefreshToken(String token) async =>
      await setStringLocalStorage('refresh_token', token);

  // - [GET] REFRESH TOKEN
  static Future<String?> getRefreshToken() async =>
      await getStringLocalStorage('refresh_token');

  // - [SET] USER
  static Future<bool> setUser(dynamic user) async =>
      await setStringLocalStorage('user', jsonEncode(user));

  // - [GET] USER
  static Future<dynamic> getUser() async {
    String? user = await getStringLocalStorage('user');

    return (user != null) ? jsonDecode(user) : null;
  }
}
