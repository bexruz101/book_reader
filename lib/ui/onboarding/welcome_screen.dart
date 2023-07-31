import 'package:book_reader/ui/onboarding/widgets/page_content.dart';
import 'package:book_reader/utils/colors.dart';
import 'package:book_reader/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../utils/app_routes.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

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
        child: PageView(
          children: [
              PageContent(mainImage: AppImages.p1, mainText: 'Only Books Can Help You', num: 0, text:'Books can help you to increase\nyour knowledge' ),
              PageContent(mainImage: AppImages.p2, mainText: 'Learn Smartly', num: 1, text:'It’s 21 century and\nit’s time to learn every quickly' ),
              PageContent(mainImage: AppImages.p3, mainText: 'Book Has Power To\nChanage Everything', num: 2, text:'We have true friend\nin our life and the books is that' ),
          ],
        ),
      ),
    );
  }
}
