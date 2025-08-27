import 'package:flutter/material.dart';
import 'package:medb_task/utils/app_color.dart';
import 'package:medb_task/utils/app_validation.dart';
import 'package:medb_task/widgets/app_sizedbox.dart';
import 'package:medb_task/widgets/text_feild.dart';
import 'package:medb_task/widgets/text_form_widget.dart';

class LoginScreen extends StatefulWidget {
   LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
   final emailController = TextEditingController();

   final passwordController = TextEditingController();

   @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Card(
          margin: EdgeInsets.all(40),
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                AppSizedBox.h20,
                Image.asset("asset/medb-logo-png-BRGSYv_I.png",width: 100,),
                AppSizedBox.h20,
                TextWidget(text: "Welcome Back!",color: kBlack,fontWeight: FontWeight.bold,size: 24,),
                Form(child: Padding(
                  padding: const EdgeInsets.all(22),
                  child: Column(
                    spacing:22 ,
                    children: [
                      TextFormFieldWidget(controller: emailController,prefixIcon: Icons.email_outlined, validator: (p0) {
                        return Validation.emailValidation(p0);
                      },),
                      TextFormFieldWidget(controller: passwordController,prefixIcon: Icons.lock_outline_rounded, validator: (p0) {
                        return Validation.emailValidation(p0);
                      },)
                    ],
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//Image.asset("asset/medb-logo-png-BRGSYv_I.png",width: 100,)