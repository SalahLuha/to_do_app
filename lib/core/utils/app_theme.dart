import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/core/utils/app_colors.dart';


ThemeData getAppTheme() {
  return ThemeData(
    primaryColor:  AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
      centerTitle: true,
    ),
    //title style
    textTheme: TextTheme(
      displayLarge: GoogleFonts.lato(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 32,
      ),
      //sub title style
      displayMedium: GoogleFonts.lato(
        color: Colors.white,
        fontSize: 16,
      ),


    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    ),


    inputDecorationTheme:InputDecorationTheme(
      fillColor: AppColors.lightBlack,
      filled: true,
      hintStyle: GoogleFonts.lato(
        color: Colors.white,
        fontSize: 16,
      ),


      enabledBorder:  OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: Colors.white,
        )
    ),

      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.white,
          )
      ),

      border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          )
      ),
    ),

  );
}
ThemeData getAppDarkTheme() {
  return ThemeData(
    primaryColor:  AppColors.red,
    scaffoldBackgroundColor: AppColors.red,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
      centerTitle: true,
    ),
    //title style
    textTheme: TextTheme(
      displayLarge: GoogleFonts.lato(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 32,
      ),
      //sub title style
      displayMedium: GoogleFonts.lato(
        color: Colors.white,
        fontSize: 16,
      ),


    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    ),
  );
}
