import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:medb_task/utils/app_string.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:path_provider/path_provider.dart';

class DioClient {
  final Dio _dio = Dio();
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  late PersistCookieJar cookieJar;

  DioClient() {
    _init();
  }

  Future<void> _init() async {
    final dir = await getApplicationDocumentsDirectory();
    cookieJar = PersistCookieJar(storage: FileStorage('${dir.path}/.cookies/'));
    _dio.interceptors.add(CookieManager(cookieJar));

    _dio.options = BaseOptions(
      baseUrl: "https://testapi.medb.co.in/api/",
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          log("OnRequest bloc stared");
          final accessToken = await _storage.read(key: AppStrings.accessToken);
          log(options.uri.toString());
          log(options.data.toString());
          log("after printing data");
          log(options.headers.toString());
          log("after printing header");
          if (accessToken != null) {
            log("In access token not null");
            options.headers["Authorization"] = "Bearer $accessToken";
          }
          log("Loging before return handler.next");
          return handler.next(options);
        },
        // In your DioClient InterceptorsWrapper
        onError: (error, handler) async {
          // Check if the request has the "isLogin" flag set
          final isLogin = error.requestOptions.extra["isLogin"] == true;

          // Only attempt to refresh the token if it's a 401 and NOT a login request
          if (error.response?.statusCode == 401 && !isLogin) {
            final refreshed = await _refreshToken();
            if (refreshed) {
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
      if (newAccessToken != null) {
        await _storage.write(
          key: AppStrings.accessToken,
          value: newAccessToken,
        );
        return true;
      }
      return false;
    } catch (e) {
      log("Refresh token failed: $e");
      return false;
    }
  }
}
