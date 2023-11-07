import 'package:book_reader/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalTextField extends StatelessWidget {
  const GlobalTextField({super.key, required this.hintText, required this.textInputType, required this.isPassword, required this.controller});

  final String hintText;
  final TextInputType textInputType;
  final bool isPassword;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
          textInputAction: TextInputAction.next,
          controller: controller,
          obscureText: isPassword,
          keyboardType: textInputType,
          style: Theme.of(context).textTheme.titleMedium,
          decoration: InputDecoration(
            labelText: hintText,
            labelStyle: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.black.withOpacity(0.4)),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.C_DE7773),
              borderRadius: BorderRadius.circular(10.r),
            ),
           focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
             borderSide: BorderSide(color: AppColors.C_DE7773),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: AppColors.C_DE7773),
            ),
          ),
        );
  }
}
