import 'package:artbuy/app/core/jwt.dart';
import 'package:artbuy/app/core/utils/session.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiService {
  static Dio init() {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: dotenv.get("ARTBUY_API_URL"),
        connectTimeout: const Duration(seconds: 1),
        receiveTimeout: const Duration(seconds: 1),
      ),
    );

    dio.interceptors.add(ApiInterceptors());

    return dio;
  }
}

class ApiInterceptors extends InterceptorsWrapper {
  @override
  Future<dynamic> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      await refreshAccessToken();

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
  }

  @override
  onError(DioException err, ErrorInterceptorHandler handler) {
    return handler.next(err);
  }

  @override
  onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }
}

