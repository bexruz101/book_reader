import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'colors.dart';


class AppTheme{
  static ThemeData lightTheme = ThemeData(
      listTileTheme: const ListTileThemeData(iconColor: AppColors.black,),
      scaffoldBackgroundColor: AppColors.white,
      bottomNavigationBarTheme:  BottomNavigationBarThemeData(
          backgroundColor: AppColors.white,
          selectedItemColor: AppColors.C_DE7773,
          unselectedItemColor: AppColors.black,
          showSelectedLabels: true,
          showUnselectedLabels: true,
      ),
      appBarTheme:  const AppBarTheme(
          elevation: 0,
          backgroundColor: AppColors.white,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: AppColors.white,
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark
          )
      ),
      textTheme: const TextTheme(
        //display
          displayLarge: TextStyle(
              color: AppColors.black,
              fontSize: 57,
              fontWeight: FontWeight.w800,
              fontFamily: 'Kanit'
          ),
          displayMedium: TextStyle(
              color: AppColors.black,
              fontSize: 45,
              fontWeight: FontWeight.w700,
              fontFamily: 'Kanit'
          ),
          displaySmall: TextStyle(
              color: AppColors.black,
              fontSize: 36,
              fontWeight: FontWeight.w600,
              fontFamily: 'Kanit'
          ),
          //headline
          headlineLarge: TextStyle(
              color: AppColors.black,
              fontSize: 32,
              fontWeight: FontWeight.w700,
              fontFamily: 'Kanit'
          ),
          headlineMedium: TextStyle(
              color: AppColors.black,
              fontSize: 28,
              fontWeight: FontWeight.w500,
              fontFamily: 'Kanit'
          ),
          headlineSmall: TextStyle(
              color: AppColors.black,
              fontSize: 24,
              fontWeight: FontWeight.w400,
              fontFamily: 'Kanit'
          ),
          //title
          titleLarge: TextStyle(
              color: AppColors.black,
              fontSize: 22,
              fontWeight: FontWeight.w700,
              fontFamily: 'Kanit'
          ),
          titleMedium: TextStyle(
              color: AppColors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontFamily: 'Kanit'
          ),
          titleSmall: TextStyle(
              color: AppColors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: 'Kanit'
          ),
          //label
          labelLarge: TextStyle(
              color: AppColors.black,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              fontFamily: 'Kanit'
          ),
          labelMedium: TextStyle(
              color: AppColors.black,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              fontFamily: 'Kanit'
          ),
          labelSmall: TextStyle(
              color: AppColors.black,
              fontSize: 11,
              fontWeight: FontWeight.w500,
              fontFamily: 'Kanit'
          ),
          //body
          bodyLarge: TextStyle(
              color: AppColors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              fontFamily: 'Kanit'
          ),
          bodyMedium: TextStyle(
              color: AppColors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: 'Kanit'
          ),
          bodySmall: TextStyle(
              color: AppColors.black,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              fontFamily: 'Kanit'
          )

      )
  );

  static ThemeData darkTheme = ThemeData(
    listTileTheme: const ListTileThemeData(iconColor: AppColors.white,),
      scaffoldBackgroundColor: AppColors.black,
      bottomNavigationBarTheme:  BottomNavigationBarThemeData(
          backgroundColor: AppColors.black,
          selectedItemColor: AppColors.C_DE7773,
          unselectedItemColor: AppColors.white,
          showSelectedLabels: true,
          showUnselectedLabels: true,
      ),
      appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.black,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: AppColors.black,
              statusBarBrightness: Brightness.light,
              statusBarIconBrightness: Brightness.light
          )
      ),
      textTheme:  TextTheme(
        //display
          displayLarge: const TextStyle(
              color: AppColors.white,
              fontSize: 57,
              fontWeight: FontWeight.w800,
              fontFamily: 'Kanit'
          ),
          displayMedium: const TextStyle(
              color: AppColors.white,
              fontSize: 45,
              fontWeight: FontWeight.w700,
              fontFamily: 'Kanit'
          ),
          displaySmall: const TextStyle(
              color: AppColors.white,
              fontSize: 36,
              fontWeight: FontWeight.w600,
              fontFamily:'Kanit'
          ),
          //headline
          headlineLarge: const TextStyle(
              color: AppColors.white,
              fontSize: 32,
              fontWeight: FontWeight.w700,
              fontFamily: 'Kanit'
          ),
          headlineMedium: const TextStyle(
              color: AppColors.white,
              fontSize: 28,
              fontWeight: FontWeight.w500,
              fontFamily: 'Kanit'
          ),
          headlineSmall: const TextStyle(
              color: AppColors.white,
              fontSize: 24,
              fontWeight: FontWeight.w400,
              fontFamily: 'Kanit'
          ),
          //title
          titleLarge: const TextStyle(
              color: AppColors.white,
              fontSize: 22,
              fontWeight: FontWeight.w700,
              fontFamily: 'Kanit'
          ),
          titleMedium: const TextStyle(
              color: AppColors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontFamily: 'Kanit'
          ),
          titleSmall: const TextStyle(
              color: AppColors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: 'Kanit'
          ),
          //label
          labelLarge: const TextStyle(
              color: AppColors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              fontFamily: 'Kanit'
          ),
          labelMedium: const TextStyle(
              color: AppColors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              fontFamily:'Kanit'
          ),
          labelSmall: const TextStyle(
              color: AppColors.white,
              fontSize: 11,
              fontWeight: FontWeight.w500,
              fontFamily: 'Kanit'
          ),
          //body
          bodyLarge: const TextStyle(
              color: AppColors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              fontFamily: 'Kanit'
          ),
          bodyMedium: const TextStyle(
              color: AppColors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: 'Kanit'
          ),
          bodySmall: TextStyle(
              color: AppColors.passiveWhite,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              fontFamily: 'Kanit'
          )

      )
  );
}
