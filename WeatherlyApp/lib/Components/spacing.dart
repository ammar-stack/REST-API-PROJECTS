import 'package:flutter/material.dart';

class VerticalSpacing extends StatelessWidget {
   double height;
   VerticalSpacing({super.key,required this.height});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(height: height,);
  }
}

class HorizontalSpacing extends StatelessWidget {
  double width;
  HorizontalSpacing({super.key,required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width,);
  }
}