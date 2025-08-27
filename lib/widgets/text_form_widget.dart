import 'package:flutter/material.dart';
import 'package:medb_task/utils/app_color.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final int maxLine;
  final IconData prefixIcon;
  const TextFormFieldWidget({
    super.key,
    required this.controller,
    required this.validator,
    this.maxLine =1,
    required this.prefixIcon
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      maxLines: maxLine,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(prefixIcon),
        border: InputBorder.none,
        filled: true,
        fillColor: kWhite,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}