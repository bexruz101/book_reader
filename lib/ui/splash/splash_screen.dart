import 'package:book_reader/utils/app_routes.dart';
import 'package:book_reader/utils/colors.dart';
import 'package:book_reader/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  Future<void> _init() async {
    await Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, RouteNames.onboardingScreen);
    });
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.C_171B36,
      body: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              top: -10,
              child: SvgPicture.asset(
                AppImages.elipse2,
                height:380,
                width: 380,
              ),),
            Positioned(
              bottom: -20,
              left: -20,
              child: SvgPicture.asset(
                AppImages.elipse1,

              ),),
            Positioned(
              right: -25,
              bottom: 160,
              child: SvgPicture.asset(
                AppImages.elipse3,
              ),),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppImages.bIcon),
                  SizedBox(height: 10,),
                  Text('BookReader',style: Theme.of(context).textTheme.headlineSmall!.copyWith(color:AppColors.white),)
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}
