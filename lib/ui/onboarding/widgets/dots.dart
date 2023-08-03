import 'package:book_reader/utils/colors.dart';
import 'package:flutter/material.dart';

class Dots extends StatelessWidget {
  const Dots({super.key, required this.num});

  final int num;

  @override
  Widget build(BuildContext context) {
    return Row(
        children: List.generate(3, (index) {
      if (num == index) {
        return activeDot();
      }
      return inActiveDot();
    }));
  }
}

Widget activeDot() {
  return Container(
    width: 12,
    height: 10,
    decoration: BoxDecoration(
        color: AppColors.C_DE7773,
        shape: BoxShape.circle
    ),
  );
}

Widget inActiveDot() {
  return Container(
    width: 12,
    height: 10,
    decoration: BoxDecoration(
        border: Border.all(color: AppColors.C_DE7773),
        color: AppColors.white,
        shape: BoxShape.circle
    ),
  );
}
