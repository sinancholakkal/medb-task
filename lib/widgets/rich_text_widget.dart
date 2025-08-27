import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:medb_task/utils/app_color.dart';

// ignore: must_be_immutable
class RichTextWidget extends StatelessWidget {
  void Function()? onTap;
  String text;
  String eventText;
   RichTextWidget({
    super.key,
    this.onTap,
    required this.text,
    required this.eventText
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      
        text: TextSpan(text: text,style: TextStyle(color: kBlack), children: [
      TextSpan(
          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),
          text: eventText,
          recognizer: TapGestureRecognizer()..onTap = onTap)
    ]));
  }
}