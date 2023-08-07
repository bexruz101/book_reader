import 'package:book_reader/ui/onboarding/widgets/dots.dart';
import 'package:book_reader/ui/onboarding/widgets/page_content.dart';
import 'package:book_reader/utils/colors.dart';
import 'package:book_reader/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/app_routes.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                onPageChanged: (index){
                  setState(() {

                  });
                  currentIndex = index;
                },
                children: [
                    PageContent(mainImage: AppImages.p1, mainText: 'Only Books Can Help You', text:'Books can help you to increase\nyour knowledge' ),
                    PageContent(mainImage: AppImages.p2, mainText: 'Learn Smartly', text:'It’s 21 century and\nit’s time to learn every quickly' ),
                    PageContent(mainImage: AppImages.p3, mainText: 'Book Has Power To\nChanage Everything', text:'We have true friend\nin our life and the books is that' ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Dots(num: currentIndex),
              ],
            ),
            SizedBox(height: 35.h,),
            Ink(
              width: width/1.3,
              height: 40.h,
              decoration: BoxDecoration(color: AppColors.blue,borderRadius: BorderRadius.circular(20.r)),
              child: InkWell(
                borderRadius: BorderRadius.circular(20.r),
                onTap: (){
                  Navigator.pushReplacementNamed(context, RouteNames.tabBoxScreen);
                },
                child:  Center(child:Text('Start increase knowledge',style: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.white),)),
              ),
            ),
              SizedBox(height: 50.h,),
          ],
        ),
      ),
    );
  }
}
