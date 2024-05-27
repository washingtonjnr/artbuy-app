// Method to refresh the access token if it is expired
import 'dart:convert';

import 'package:artbuy/app/core/utils/session.dart';
import 'package:artbuy/app/data/repositories/auth_repository.dart';

Future refreshAccessToken() async {
  final AuthRepository authRepository = AuthRepository();
  //
  String? token = await AppLocalStorage.getAccessToken();
  String? refreshToken = await AppLocalStorage.getRefreshToken();

  if (token == null || refreshToken == null) {
    authRepository.signout();

    return;
  }

  bool expiredToken = _isTokenExpired(token);

  if (expiredToken) {
    bool expiredRefresh = _isTokenExpired(refreshToken);

    if (expiredRefresh) {
      authRepository.signout();
    }

    try {
      await authRepository.refreshTokens(refreshToken);
    } catch (err) {
      authRepository.signout();
    }
  }
}

// Method to check if a token is expired
bool _isTokenExpired(String token) {
  final normalizedPayload = base64.normalize(token.split('.')[1]);
  final payloadString = utf8.decode(base64.decode(normalizedPayload));
  final exp = jsonDecode(payloadString)['exp'];

  final expirationDate = DateTime.fromMillisecondsSinceEpoch(0)
      .add(Duration(seconds: int.parse('$exp') - 30));

  return DateTime.now().isAfter(expirationDate);
}
