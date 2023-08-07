import 'package:book_reader/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageContent extends StatelessWidget {
  const PageContent({super.key, required this.mainImage, required this.mainText, required this.text});

  final String mainImage;
  final String mainText;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
            Container(
              margin: EdgeInsets.all(60.h),
                child: Image.asset(mainImage)
            ),
            Spacer(),
            Text(mainText,style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColors.black,fontWeight: FontWeight.w600),),
            SizedBox(height: 15.h,),
            Text(text,style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 18.sp),),
            SizedBox(height: 15.h,),



        ],
      ),
    );
  }
}
