import 'package:book_reader/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class GlobalButton extends StatelessWidget {
  const GlobalButton({super.key, required this.title, required this.onTap});

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: onTap,
      child: Container(
        height: 50.h,
        width: 330.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.sp),
          color: AppColors.C_DE7773,
        ),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontSize: 16.sp,fontWeight: FontWeight.w500,color: AppColors.white),
          ),
        ),
      ),
    );
  }
}
