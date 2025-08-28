import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:medb_task/utils/app_string.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void>splashing()async{
    final accessToken = await FlutterSecureStorage().read(key: AppStrings.accessToken);
    await Future.delayed(Duration(seconds: 3));
    if(accessToken !=null){
      context.go("/home");
    }else{
      context.go("/login");
    }
  }
  @override
  void initState() {
    splashing();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(child: Text("Loading"),),
      ),
    );
  }
}