
import 'package:book_reader/model/book_model.dart';
import 'package:book_reader/ui/auth/auth_screen.dart';
import 'package:book_reader/ui/auth/sign_in/sign_in_screen.dart';
import 'package:book_reader/ui/auth/sign_up/sign_up_screen.dart';
import 'package:book_reader/ui/auth/widgets/global_button.dart';
import 'package:book_reader/ui/tab_box/book_list/books_list_screen.dart';
import 'package:book_reader/ui/onboarding/welcome_screen.dart';
import 'package:book_reader/ui/splash/splash_screen.dart';
import 'package:book_reader/ui/tab_box/tab_box_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteNames{
  static const String splashScreen='/';
  static const String booksListScreen='/books_list_screen';
  static const String onboardingScreen='/onboarding_screen';
  static const String tabBoxScreen='/tab_box_screen';
  static const String authScreen='/auth_screen';

}

class AppRoutes{
  static Route generateRoute(RouteSettings settings){
    switch(settings.name){
      case RouteNames.splashScreen:
        return MaterialPageRoute(builder: (context)=>const SplashScreen());
      case RouteNames.booksListScreen:
        return MaterialPageRoute(builder: (context)=>const BooksListScreen());
      case RouteNames.onboardingScreen:
        return MaterialPageRoute(builder:(context)=> WelcomeScreen());
      case RouteNames.tabBoxScreen:
        return MaterialPageRoute(builder: (context)=>const TabBoxScreen());
      case RouteNames.authScreen:
        return MaterialPageRoute(builder: (context)=>const AuthScreen());
      default:
        return MaterialPageRoute(builder: (context){
          return const Scaffold(
              body: Center(child: Text('Page Not Found'),),
          );
        });
    }
  }
}