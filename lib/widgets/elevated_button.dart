import 'package:flutter/material.dart';
import 'package:medb_task/utils/app_color.dart';

class ElevatedWidget extends StatelessWidget {
  final String text;
  const ElevatedWidget({
    super.key,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: KBcolor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(text),
      ),
    );
  }
}
