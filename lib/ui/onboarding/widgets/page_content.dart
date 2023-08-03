import 'package:book_reader/ui/onboarding/widgets/dots.dart';
import 'package:book_reader/utils/app_routes.dart';
import 'package:book_reader/utils/colors.dart';
import 'package:flutter/material.dart';

class PageContent extends StatelessWidget {
  const PageContent({super.key, required this.mainImage, required this.mainText, required this.text});

  final String mainImage;
  final String mainText;
  final String text;

  @override
  Widget build(BuildContext context) {
     double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
            Container(
              margin: EdgeInsets.all(60),
                child: Image.asset(mainImage)
            ),
            Spacer(),
            Text(mainText,style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColors.black,fontWeight: FontWeight.w600),),
            SizedBox(height: 15,),
            Text(text,style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 18),),
            SizedBox(height: 15,),



        ],
      ),
    );
  }
}
