// Utils
import 'package:artbuy/app/core/utils/session.dart';
// Adapters
import 'package:artbuy/app/data/adapters/signin_adapter.dart';
import 'package:artbuy/app/data/models/signin_model.dart';
import 'package:artbuy/app/data/models/signup_model.dart';
import 'package:artbuy/app/data/services/api.dart';
import 'package:artbuy/routes.dart';
import 'package:dio/dio.dart';
import 'package:routefly/routefly.dart';

class AuthRepository {
  final Dio _apiService = ApiService.init();

  Future signout() async {
    await AppLocalStorage.removeSession();

    await Routefly.navigate(routePaths.signin);
  }

  Future<Response> signin(SigninModel model) async {
    final data = SigninAdapter.toJson(model);

    final Response response = await _apiService.post("/auth/signin", data: data);

    print("dasdasdresponse");
    print(response);

    _saveTokens(response.data?.success, response.data?.payload);

    return response;
  }

  Future<Response> signup(SignUpModel data) async {
    final Response response =
        await _apiService.post("/auth/signup", data: data);

    _saveTokens(response.data?.success, response.data?.payload);

    return response;
  }

  Future<Response> refreshTokens(token) async {
    final Response response =
        await _apiService.post("/auth/refresh", data: { "refresh_token": token });

    _saveTokens(response.data?.success, response.data?.payload);

    return response;
  }

  _saveTokens(bool success, dynamic payload) async {
    if (success) {
      String? accessToken = payload['access_token'];
      String? refreshToken = payload['refresh_token'];

      if (accessToken != null) {
        await AppLocalStorage.setAccessToken(accessToken);
      }

      if (refreshToken != null) {
        await AppLocalStorage.setRefreshToken(refreshToken);
      }
    }
  }
}
