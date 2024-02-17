import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/app_strings.dart';
import 'package:to_do_app/core/utils/app_theme.dart';
import 'package:to_do_app/features/auth/presentation/screens/splash_screen/splash_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          //title: 'To-Do App',
          title: AppString.appName,
          theme: getAppTheme(),
          home: const SplashScreen(),
        );
      },

    );
  }
}


