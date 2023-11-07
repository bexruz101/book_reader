import 'package:book_reader/utils/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomCircularIndicator extends StatelessWidget {
  final double? strokeWidth;
  const CustomCircularIndicator({super.key, this.strokeWidth});

  @override
  Widget build(BuildContext context) {
    if (strokeWidth == 4.0 || strokeWidth == null) {
      return CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.C_3669C9),
      );
    } else {
      return CircularProgressIndicator(
        strokeWidth: strokeWidth!,
        valueColor:const  AlwaysStoppedAnimation<Color>(AppColors.white),
      );
    }
  }
}
