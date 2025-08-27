import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:medb_task/utils/app_color.dart';
import 'package:medb_task/utils/app_sizes.dart';
import 'package:medb_task/utils/app_string.dart';
import 'package:medb_task/utils/app_validation.dart';
import 'package:medb_task/widgets/app_sizedbox.dart';
import 'package:medb_task/widgets/card_top_session.dart';
import 'package:medb_task/widgets/cardlogin_form_session.dart';
import 'package:medb_task/widgets/elevated_button.dart';
import 'package:medb_task/widgets/rich_text_widget.dart';
import 'package:medb_task/widgets/text_feild.dart';
import 'package:medb_task/widgets/text_form_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Card(
            child: SizedBox(
              width: Klwidth,
              height: Klheight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppSizedBox.h20,
                  //Icon and greet------
                  CardTopSession(image: "asset/medb-logo-png-BRGSYv_I.png",text: AppStrings.welcomeback,),
                  //CardLoginFormSession--------
                  CardLoginFormSession(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

