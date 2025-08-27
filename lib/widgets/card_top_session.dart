import 'package:flutter/material.dart';
import 'package:medb_task/utils/app_color.dart';
import 'package:medb_task/widgets/app_sizedbox.dart';
import 'package:medb_task/widgets/text_feild.dart';

class CardTopSession extends StatelessWidget {
  final String image;
  final String text;
  const CardTopSession({super.key, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(image, width: 100),
        AppSizedBox.h20,
        TextWidget(
          text: text,
          color: kBlack,
          fontWeight: FontWeight.bold,
          size: 24,
        ),
      ],
    );
  }
}
