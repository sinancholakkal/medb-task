import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:medb_task/models/register_model.dart';

class AuthServices {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://testapi.medb.co.in/api/auth",
      headers: {"Content-Type": "application/json"},
    ),
  );

  Future<String> register({required RegisterModel registerModel}) async {
    try {
      final response = await _dio.post(
        "/register",
        data: {
          "firstName": registerModel.firstname,
          "middleName": registerModel.middlename,
          "lastName": registerModel.lastname,
          "email": registerModel.email,
          "contactNo": registerModel.contactno,
          "password": registerModel.password,
          "confirmPassword": registerModel.confirmpassword,
        },
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
}
