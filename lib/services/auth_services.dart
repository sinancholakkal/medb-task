import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:medb_task/models/login_model.dart';
import 'package:medb_task/models/register_model.dart';
import 'package:medb_task/services/dio_client.dart';
import 'package:medb_task/services/hive_service.dart';
import 'package:medb_task/utils/app_string.dart';

class AuthServices {
  final DioClient dioClient = DioClient();
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<String> register({required RegisterModel registerModel}) async {
    try {
      final response = await dioClient.dio.post(
        "auth/register",
        data: {
          "firstName": registerModel.firstname,
          "middleName": registerModel.middlename,
          "lastName": registerModel.lastname,
          "email": registerModel.email,
          "contactNo": registerModel.contactno,
          "password": registerModel.password,
          "confirmPassword": registerModel.confirmpassword,
        },
        options: Options(headers: {"Content-Type": "application/json"}),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data["message"]);
        return response.data["message"];
      } else {
        log("Register failed");
        log(response.statusCode.toString());
        throw Exception("Register failed");
      }
    } catch (e) {
      if (e is DioException && e.response != null) {
        throw Exception(e.response?.data['message'] ?? "Registration failed");
      }
      log("Registration filed in catch bloc");
      throw Exception("Registration failed");
    }
  }

Future<String> login({required LoginModel loginModel}) async {
  log("Log service called================");
  try {
    final response = await dioClient.dio.post(
      "auth/login",
      data: {"email": loginModel.email, "password": loginModel.password},
      options: Options(
        extra: {"withCredentials": true, "isLogin": true},
        headers: {"Content-Type": "application/json"},
      ),
    );
    log("status code is ${response.statusCode} =====================");
    if (response.statusCode == 200 && response.data != null) {
      final accessToken = response.data[AppStrings.accessToken];
      if (accessToken != null) {
        //Store token in flutter secure storage
         await _storage.write(key: AppStrings.accessToken, value: accessToken);
         //user details store in hive
         await HiveService().saveLoginResponse(response.data["userDetails"],response.data["menuData"]);
        
        log("Login successful");
        return "Login successful";
      }
    }
    return "Login failed: Missing access token in response";

  } on DioException catch (e) {
    String errorMessage = "Login failed: An unknown error occurred.";
    if (e.response != null && e.response!.data != null && e.response!.data is Map) {
      errorMessage = e.response!.data["message"] ?? 'Login failed: No specific message from server.';
    } else if (e.response != null && e.response!.data != null) {
      errorMessage = e.response!.data.toString();
    }
    
    log("Login failed: $errorMessage");
    throw Exception(errorMessage);

  } catch (e) {
    log("Login failed: $e");
    throw Exception("Login failed due to an unexpected error.");
  }
}

  Future<bool> logout() async {
    try {
      final response = await dioClient.dio.post(
        "auth/logout",
        options: Options(
          extra: {"withCredentials": true},
          headers: {"Content-Type": "application/json"},
          validateStatus: (_) => true,
        ),
      );

      if (response.statusCode == 200) {
        log("Statuscode is ${response.statusCode}");
        String message;
        if (response.data is Map) {
          message = response.data['message'] ?? 'Logout successful.';
        } else {
          message = response.data.toString();
        }
        log("Logout success: $message");

        await _storage.delete(key: AppStrings.accessToken);
        await dioClient.cookieJar.deleteAll();
        await HiveService().clearAllData();
        return true;
      } else {
        log("Logout failed: ${response.statusCode} ${response.data}");
        return false;
      }
    } catch (e) {
      log("Logout exceptionn: $e");

      return false;
    }
  }
}



