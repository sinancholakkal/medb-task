import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:medb_task/models/login_model.dart';
import 'package:medb_task/models/register_model.dart';
import 'package:medb_task/services/dio_client.dart';

class AuthServices {
  // final Dio _dio = Dio(
  //   BaseOptions(
  //     baseUrl: "https://testapi.medb.co.in/api/auth",
  //     headers: {"Content-Type": "application/json"},
  //   ),
  // );
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

  Future<bool> login({required LoginModel loginModel}) async {
    log("Log service called================");
    try {
      final response = await dioClient.dio.post(
        "auth/login",
        data: {"email": loginModel.email, "password": loginModel.password},
        options: Options(
          extra: {"withCredentials": true},
          headers: {"Content-Type": "application/json"},
        ),
      );
      log("status code is ${response.statusCode} =====================");
      final accessToken = response.data["accessToken"];
      final loginKey = response.data["loginKey"];
      final userDetails = response.data["userDetails"];
      final menuData = response.data["menuData"];
      log(accessToken);
      log(loginKey.runtimeType.toString());
      log(userDetails.runtimeType.toString());
      log(menuData.runtimeType.toString());

      return true;
    } on DioException catch (e) {
      log("Login failed: ${e.response?.data['message'] ?? 'Unknown error'}");
      return false;
    } catch (e) {
      log("Login failed: $e");
      return false;
    }
  }
}
