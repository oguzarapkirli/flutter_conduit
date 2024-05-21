import 'package:conduit/util/colors.dart';
import 'package:conduit/util/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final appTheme = ThemeData(
    primaryColor: AppColors.grey,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.black,
    useMaterial3: true,
    colorScheme: const ColorScheme.light(
      primary: AppColors.grey,
      secondary: AppColors.primary,
      brightness: Brightness.dark,
    ),
    dividerColor: Colors.white54,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.black,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.grey,
      selectedIconTheme: IconThemeData(
        size: 30,
        color: AppColors.primary,
      ),
      unselectedIconTheme: IconThemeData(
        size: 30,
        color: AppColors.grey,
      ),
      showSelectedLabels: false,
      showUnselectedLabels: false,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.black,
      titleTextStyle: TextStyle(
        color: AppColors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    cardColor: AppColors.black,
    cardTheme: const CardTheme(
      color: AppColors.black,
      elevation: 0,
    ),
    textTheme: GoogleFonts.robotoTextTheme().apply(
      bodyColor: AppColors.white,
      displayColor: AppColors.white,
    ),
    fontFamily: GoogleFonts.roboto().fontFamily,
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.primary,
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: UIConstants.mediumBorderRadius,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(AppColors.primary),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColors.primary),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: UIConstants.mediumBorderRadius,
          ),
        ),
      ),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: AppColors.grey,
      labelStyle: const TextStyle(color: AppColors.white),
      shape: RoundedRectangleBorder(
        borderRadius: UIConstants.mediumBorderRadius,
      ),
    ),
    tabBarTheme: TabBarTheme(
      dividerColor: Colors.transparent,
      dividerHeight: 0,
      tabAlignment: TabAlignment.center,
      labelStyle: const TextStyle(fontSize: 16),
      unselectedLabelStyle: const TextStyle(fontSize: 16),
      labelColor: Colors.white,
      unselectedLabelColor: Colors.white.withOpacity(0.5),
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: BoxDecoration(
        color: AppColors.primary,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(30),
      ),
    ),
  );
}
