import 'package:book_reader/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../provider/profile_provider.dart';

class UniversalTextField extends StatelessWidget {
  const UniversalTextField(
      {super.key,
      required this.controller,
      required this.labelText,
      this.errorText});

  final String? labelText;
  final TextEditingController? controller;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    final checker = context.read<ProfileProvider>().checkPassword;
    return TextField(
      textInputAction: TextInputAction.next,
      controller: controller,
      keyboardType: TextInputType.text,
      style: Theme.of(context).textTheme.titleMedium,
      decoration: InputDecoration(
        errorText: checker? '':'Passwords are not same',
        labelText: labelText,
        labelStyle: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color: AppColors.black.withOpacity(0.4)),
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
