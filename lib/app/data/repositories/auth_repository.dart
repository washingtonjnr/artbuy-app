// Utils
import 'package:artbuy/app/core/utils/session.dart';
// Adapters
import 'package:artbuy/app/data/adapters/signin_adapter.dart';
// Models
import 'package:artbuy/app/data/models/response_model.dart';
import 'package:artbuy/app/data/models/signin_model.dart';
import 'package:artbuy/app/data/models/signup_model.dart';
// Service
import 'package:artbuy/app/data/services/api.dart';

class AuthRepository {
  final _apiService = ApiService();

  Future<ResponseModel> signin(SigninModel model) async {
    final data = SigninAdapter.toJson(model);

    final response = await _apiService.post("/auth/signin", data: data);

    _saveTokens(response.success, response.payload);

    return response;
  }

  Future<ResponseModel> signup(SignUpModel data) async {
    final ResponseModel response =
        await _apiService.post("/auth/signup", data: data);

    _saveTokens(response.success, response.payload);

    return response;
  }

  Future<ResponseModel> refreshTokens(Map<String, String> data) async {
    final ResponseModel response =
        await _apiService.post("/auth/refresh", data: data);

    _saveTokens(response.success, response.payload);

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
