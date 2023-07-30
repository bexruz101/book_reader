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
    width: 20,
    height: 8,
    decoration: BoxDecoration(
        color: AppColors.C_DE7773, borderRadius: BorderRadius.circular(5)),
  );
}

Widget inActiveDot() {
  return Container(
    width: 18,
    height: 8,
    decoration: BoxDecoration(
        border: Border.all(color: AppColors.C_DE7773),
        color: AppColors.white, borderRadius: BorderRadius.circular(5)),
  );
}
