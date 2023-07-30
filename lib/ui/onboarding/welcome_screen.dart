import 'package:book_reader/ui/onboarding/widgets/page_content.dart';
import 'package:book_reader/utils/colors.dart';
import 'package:book_reader/utils/images.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SizedBox(
        child:PageView(
          children: [
              PageContent(mainImage: AppImages.p1, mainText: 'Only Books Can Help You', num: 0, text:'Books can help you to increase your knowledge and become more successfully.' ),
              PageContent(mainImage: AppImages.p2, mainText: 'Learn Smartly', num: 1, text:'It’s 2022 and it’s time to learn every quickly and ' ),
              PageContent(mainImage: AppImages.p1, mainText: 'Only Books Can Help You', num: 2, text:'Books can help you to increase your knowledge and become more successfully.' ),

          ],
        ),
      ),
    );
  }
}
