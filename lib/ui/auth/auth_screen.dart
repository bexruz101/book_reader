import 'package:book_reader/data/storage_repository/local_db.dart';
import 'package:book_reader/ui/auth/sign_in/sign_in_screen.dart';
import 'package:book_reader/ui/auth/sign_up/sign_up_screen.dart';
import 'package:book_reader/utils/colors.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLoginPage = true;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        key: _scaffoldKey,
        body: isLoginPage
            ? LogInScreen(onChanged: () {
                setState(() {
                  isLoginPage = false;
                });
              })
            : SignUpScreen(
                onChanged: () {
                   setState(() {
                  isLoginPage = true;
                });
                },
                parenContext: _scaffoldKey.currentContext!));
  }
}
