import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ImageButton extends StatelessWidget {
  final String image;
  final double width;
   Function()? onTap;
   ImageButton({
    super.key, required this.image,  this.width = 40,this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap:onTap ,child: Image.asset(image,width: width,),);
  }
}