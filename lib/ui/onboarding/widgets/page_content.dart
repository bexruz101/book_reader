import 'package:book_reader/ui/onboarding/widgets/dots.dart';
import 'package:book_reader/utils/colors.dart';
import 'package:flutter/material.dart';

class PageContent extends StatelessWidget {
  const PageContent({super.key, required this.mainImage, required this.mainText, required this.num, required this.text});

  final String mainImage;
  final String mainText;
  final int num;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
            Image.asset(mainImage),
            SizedBox(height: 20,),
            Text(mainText,style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: AppColors.black),),
            SizedBox(height: 20,),
            Text(text,style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 20),),
            SizedBox(height: 20,),
            Dots(num: num),
        ],
      ),
    );
  }
}
