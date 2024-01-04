import 'package:book_reader/ui/tab_box/home/home_screen.dart';
import 'package:book_reader/ui/onboarding/welcome_screen.dart';
import 'package:book_reader/ui/splash/splash_screen.dart';
import 'package:book_reader/ui/tab_box/tab_box_screen.dart';
import 'package:book_reader/ui/tab_box/vocabulary/definition_screen.dart';
import 'package:flutter/material.dart';

class RouteNames{
  static const String splashScreen='/';
  static const String booksListScreen='/books_list_screen';
  static const String onboardingScreen='/onboarding_screen';
  static const String tabBoxScreen='/tab_box_screen';
  static const String authScreen='/auth_screen';
  static const String defScreen='/definition_screen';

}

class AppRoutes{
  static Route generateRoute(RouteSettings settings){
    switch(settings.name){
      case RouteNames.splashScreen:
        return MaterialPageRoute(builder: (context)=>const SplashScreen());
      case RouteNames.booksListScreen:
        return MaterialPageRoute(builder: (context)=>const HomeScreen());
      case RouteNames.onboardingScreen:
        return MaterialPageRoute(builder:(context)=> WelcomeScreen());
      case RouteNames.tabBoxScreen:
        return MaterialPageRoute(builder: (context)=>const TabBoxScreen());
      case RouteNames.defScreen:
        return MaterialPageRoute(builder: (context){
          String txt = settings.arguments as String;
          return DefScreen(txt: txt);
        });
      default:
        return MaterialPageRoute(builder: (context){
          return const Scaffold(
              body: Center(child: Text('Page Not Found'),),
          );
        });
    }
  }
}