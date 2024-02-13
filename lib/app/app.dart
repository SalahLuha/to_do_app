

import 'package:flutter/material.dart';
import 'package:to_do_app/core/utils/app_assets.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/core/utils/app_strings.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      //title: 'To-Do App',
      title: AppString.appName,
      home: Scaffold(
        backgroundColor: AppColors.background,
        body: Center(
            child: Image.asset(AppAssets.logo),
        ),
      ),
    );
  }
}