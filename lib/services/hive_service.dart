import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:medb_task/models/module_model.dart';
import 'package:medb_task/models/user_model.dart';


class HiveService {
  Future<void> saveLoginResponse(Map<String, dynamic> userDetails,List<dynamic>menuData) async {
    final box = Hive.box("authBox");
    await box.put("loginResponse", jsonEncode(userDetails));
    await box.put("menuData", jsonEncode(menuData));
  }

  UserModel? getLoginResponseUser() {
    final box = Hive.box("authBox");
    final data = box.get("loginResponse");

    if (data != null) {
      final response =  jsonDecode(data) as Map<String,dynamic>;
      final userModel = UserModel.fromJson(response);
      return userModel;
    }
    return null;
  }
   List<ModuleModel>? getLoginResponseMenuData() {
    final box = Hive.box("authBox");
    final data = box.get("menuData");

    if (data != null) {
      final response = jsonDecode(data) as List<dynamic>;
    return response.map((e) => ModuleModel.fromJson(e)).toList();
    }
    return null;
  }
}
