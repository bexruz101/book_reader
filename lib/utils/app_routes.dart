
import 'package:book_reader/ui/tab_box/books_list_screen.dart';
import 'package:book_reader/ui/onboarding/welcome_screen.dart';
import 'package:book_reader/ui/splash/splash_screen.dart';
import 'package:book_reader/ui/tab_box/tab_box_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteNames{
  static const String splashScreen='/';
  static const String booksListScreen='/books_list_screen';
  static const String onboardingScreen='/onboarding_screen';
  static const String tabBoxScreen='/tab_box_screen';

}

class AppRoutes{
  static Route generateRoute(RouteSettings settings){
    switch(settings.name){
      case RouteNames.splashScreen:
        return MaterialPageRoute(builder: (context)=>const SplashScreen());
      case RouteNames.booksListScreen:
        return MaterialPageRoute(builder: (context)=>const BooksListScreen());
      case RouteNames.onboardingScreen:
        return MaterialPageRoute(builder:(context)=>const WelcomeScreen());
      case RouteNames.tabBoxScreen:
        return MaterialPageRoute(builder: (context)=>const TabBoxScreen());
      default:
        return MaterialPageRoute(builder: (context){
          return const Scaffold(
              body: Center(child: Text('Page Not Found'),),
          );
        });
    }
  }
}