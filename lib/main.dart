import 'package:book_reader/data/db/local_db.dart';
import 'package:book_reader/model/book_model.dart';
import 'package:book_reader/provider/profile_provider.dart';
import 'package:book_reader/utils/app_routes.dart';
import 'package:book_reader/utils/colors.dart';
import 'package:book_reader/utils/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(BookModelAdapter());
  LocalDatabase.openBoxBooks();

  runApp(EasyLocalization(
    supportedLocales: const [
      Locale('ru', 'RU'),
      Locale('en', 'EN'),
      Locale('uz', 'UZ'),
    ],
    path: 'assets/translations',
    fallbackLocale: const Locale('en', 'EN'),
    child: MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) =>
              ProfileProvider(),
          lazy: true,
        ),
      ],
      child: const MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final modeProvider = context.watch<ProfileProvider>();
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            color: AppColors.white,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode:
                modeProvider.modeSwitch ? ThemeMode.dark : ThemeMode.light,
            debugShowCheckedModeBanner: false,
            initialRoute: RouteNames.splashScreen,
            onGenerateRoute: AppRoutes.generateRoute,
          );
        });
  }
}
