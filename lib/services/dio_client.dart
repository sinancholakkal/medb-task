import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:medb_task/utils/app_string.dart';

class DioClient {
  final Dio _dio = Dio();
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  DioClient() {
    _dio.options = BaseOptions(
      baseUrl: "https://testapi.medb.co.in/api/",
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final accessToken = await _storage.read(key: AppStrings.accessToken);
          if (accessToken != null) {
            options.headers["Authorization"] = "Bearer $accessToken";
          }
          return handler.next(options);
        },
        onError: (error, handler)async {
          if (error.response?.statusCode == 400) {
            final refreshed = await _refreshToken();
            if(refreshed){
              final retryRequest = await _dio.fetch(error.requestOptions);
              return handler.resolve(retryRequest);
            }
            
          }
          return handler.next(error);
        },
      ),
    );
  }
  Dio get dio => _dio;
  Future<bool> _refreshToken() async {
    try {
      final response = await _dio.post(
        "auth/refresh-token",
        options: Options(extra: {"withCredentials": true}),
      );
      final newAccessToken = response.data[AppStrings.accessToken];
      if(newAccessToken!=null){
        await _storage.write(key: AppStrings.accessToken, value: newAccessToken);
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
