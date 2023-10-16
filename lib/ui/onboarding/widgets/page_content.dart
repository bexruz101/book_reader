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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
            Container(
              margin: EdgeInsets.only(top: 70/812*height,right: 70/812*height,left: 70/812*height),
                child: Image.asset(mainImage)
            ),
            const Spacer(),
            Text(mainText,style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColors.black,fontWeight: FontWeight.w500),),
            SizedBox(height:10.h),
            Text(text,style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 14.sp),),
            SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
