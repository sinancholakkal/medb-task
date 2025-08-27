import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medb_task/utils/app_string.dart';
import 'package:medb_task/utils/app_validation.dart';
import 'package:medb_task/widgets/elevated_button.dart';
import 'package:medb_task/widgets/rich_text_widget.dart';
import 'package:medb_task/widgets/text_form_widget.dart';

class CardRegisterFormSession extends StatefulWidget {
   CardRegisterFormSession({
    super.key,
  });

  @override
  State<CardRegisterFormSession> createState() => _CardRegisterFormSessionState();
}

class _CardRegisterFormSessionState extends State<CardRegisterFormSession> {
  final firstNameController = TextEditingController();
  final middleNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final contactNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final conformPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          spacing: 22,
          children: [
            //firstnameField----------
            TextFormFieldWidget(
              labeltext: AppStrings.firstname,
              controller: firstNameController,
              validator: (p0) {
                return Validation.nameValidate(value: p0,comment: "First name");
              },
            ),
            //Middlename Field----------
            TextFormFieldWidget(
              labeltext: AppStrings.middlename,
              controller: middleNameController,
              validator: (p0) {
                return Validation.nameValidate(value: p0,comment: "Middle name");
              },
            ),
            //lastname field-------------
            TextFormFieldWidget(
              labeltext: AppStrings.lastname,
              controller: lastNameController,
              validator: (p0) {
                return Validation.nameValidate(value: p0,comment: "Last name");
              },
            ),
            //Email field--- 
            TextFormFieldWidget(
              labeltext: AppStrings.email,
              controller: emailController,
              validator: (p0) {
                return Validation.emailValidation(p0);
              },
            ),
            //ContactNo firld-------
            TextFormFieldWidget(
              labeltext: AppStrings.contactno,
              controller: contactNumberController,
              validator: (p0) {
                return Validation.phoneNumberValidate(value: p0);
              },
            ),
            //Password field-------
            TextFormFieldWidget(
              labeltext: AppStrings.password,
              controller: passwordController,
              validator: (p0) {
                return Validation.passWordValidation(p0);
              },
            ),
            //Conform paswrd field--------
            TextFormFieldWidget(
              labeltext: AppStrings.conformpassword,
              controller: conformPasswordController,
              validator: (p0) {
                return Validation.conformPasswordValidation(conformPassword: conformPasswordController.text,password: passwordController.text,value: p0);
              },
            ),
            
            //Button for register---------------
            ElevatedWidget(
              text: AppStrings.register,
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  log(" Validated--------------------");
    
                  // _signIn(context);
                } else {
                  log("Not Validated--------------------");
                }
              },
            ),
            //Rich text widget-----------
            RichTextWidget(
              text: AppStrings.alreadycc,
              eventText: " ${AppStrings.login}",
              onTap: (){
                context.go("/login");
              },
            ),
          ],
        ),
      ),
    );
  }
}

