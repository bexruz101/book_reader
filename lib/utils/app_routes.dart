
import 'package:book_reader/ui/home_screen.dart';
import 'package:book_reader/ui/onboarding/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteNames{
  static const String splashScreen='/';
  static const String homeScreen='/home_screen';


}

class AppRoutes{
  static Route generateRoute(RouteSettings settings){
    switch(settings.name){
      case RouteNames.splashScreen:
        return MaterialPageRoute(builder: (context)=>const SplashScreen());
      case RouteNames.homeScreen:
        return MaterialPageRoute(builder: (context)=>const HomeScreen());
      default:
        return MaterialPageRoute(builder: (context){
          return const Scaffold(
              body: Center(child: Text('Page Not Found'),),
          );
        });
    }
  }
}