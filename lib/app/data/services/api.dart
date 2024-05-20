import 'dart:convert';

import 'package:artbuy/app/core/utils/session.dart';
import 'package:artbuy/app/data/adapters/response_adapter.dart';
import 'package:artbuy/app/data/models/response_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: dotenv.get("ARTBUY_API_URL"),
      connectTimeout: const Duration(seconds: 1),
      receiveTimeout: const Duration(seconds: 1),
    ),
  );

  ApiService() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        // Interceptor to BEFORE request
        onRequest:
            (RequestOptions options, RequestInterceptorHandler handler) async {
          try {
            await _refreshAccessToken();

            String? token = await AppLocalStorage.getAccessToken();

            if (token != null) {
              options.headers.addAll({
                'contentType': 'application/json; charset=UTF-8',
                'Authorization': 'Bearer $token',
              });
            }

            return handler.next(options);
          } catch (e) {
            return handler
                .reject(DioException(requestOptions: RequestOptions()));
          }
        },
        // Interceptor to AFTER request
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          return handler.next(response);
        },
        // Interceptor to ERROR
        onError: (DioException error, ErrorInterceptorHandler handler) {
          return handler.next(error);
        },
      ),
    );
  }

  // -----------------
  // ---- METHODS ----
  // -----------------

  // Generic method to make a GET request
  Future get(String endpoint, {Map<String, dynamic>? params}) async {
    try {
      final response = await _dio.get(endpoint, queryParameters: params);

      return ResponseAdapter.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  // Generic method to make a POST request
  Future post(String endpoint,
      {Map<String, dynamic>? params, dynamic data}) async {
    try {
      final response =
          await _dio.post(endpoint, queryParameters: params, data: data);

      return ResponseAdapter.fromJson(response.data);
    } catch (e) {
      return ResponseModel(payload: e, success: false);
    }
  }

  // Generic method to make a PUT request
  Future put(String endpoint,
      {Map<String, dynamic>? params, dynamic data}) async {
    try {
      final response =
          await _dio.put(endpoint, queryParameters: params, data: data);

      return ResponseAdapter.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  // Generic method to make a DELETE request
  Future delete(String endpoint,
      {Map<String, dynamic>? params, dynamic data}) async {
    try {
      final response =
          await _dio.delete(endpoint, queryParameters: params, data: data);

      return ResponseAdapter.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  // -----------------
  // ----- UTILS -----
  // -----------------

  // Method to refresh the access token if it is expired
  Future<bool> _refreshAccessToken() async {
    String? token = await AppLocalStorage.getAccessToken();
    String? refreshToken = await AppLocalStorage.getRefreshToken();

    if (token == null || refreshToken == null) {
      // TODO: exit app
      return false;
    }

    bool expiredToken = _isTokenExpired(token);

    if (expiredToken) {
      bool expiredRefresh = _isTokenExpired(refreshToken);

      if (expiredRefresh) {
        // TODO: exit app
        return false;
      }

      try {
        // TODO: generate new access token
        // await generateAccessToken(refreshToken)
      } catch (err) {
        // TODO: exit app
        return false;
      }
    }

    return true;
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
}
