
import 'package:flutter/material.dart';
import 'package:medb_task/utils/app_color.dart';
import 'package:medb_task/widgets/app_sizedbox.dart';
import 'package:medb_task/widgets/text_feild.dart';

class HomeCenterSession extends StatelessWidget {
  const HomeCenterSession({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("asset/medb-logo-png-BRGSYv_I.png", width: 100),
            AppSizedBox.h24,
            TextWidget(
              text: "Welcome to MedB!",
              color: kBlack,
              fontWeight: FontWeight.bold,
              size: 30,
            ),
            AppSizedBox.h16,
            TextWidget(
              maxLine: 10,
              text:
                  "We're glad to have you here. MedB is your trusted platform for healthcare needs — all in one place.",
              color: kBlack,
              size: 20,
            ),
            AppSizedBox.h16,
            TextWidget(
              maxLine: 10,
              text:"Use the menu on the left to get started.",
              color: kGrey,
              size: 16,
            )
          ],
        ),
      ),
    );
  }
}
