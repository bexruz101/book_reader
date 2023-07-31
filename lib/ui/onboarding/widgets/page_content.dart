import 'package:book_reader/ui/onboarding/widgets/dots.dart';
import 'package:book_reader/utils/app_routes.dart';
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Dots(num: num),
              ],
            ),
            SizedBox(height: 65,),
            Ink(
              width: width/1.3,
              height: 50,
              decoration: BoxDecoration(color: AppColors.blue,borderRadius: BorderRadius.circular(20)),
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: (){
                  Navigator.pushReplacementNamed(context, RouteNames.tabBoxScreen);
                },
                child:  Center(child:Text('Start increase knowledge',style: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.white),)),
              ),
            ),
            const  SizedBox(height: 50,),
        ],
      ),
    );
  }
}
