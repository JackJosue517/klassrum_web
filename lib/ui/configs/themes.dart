import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:klassrum/ui/configs/styles.dart';

class AppTheme {
  static ThemeData buildTheme() {
    var baseTheme = ThemeData.light(useMaterial3: true).copyWith(
      appBarTheme: AppTheme._buildBarTheme(),
      floatingActionButtonTheme: AppTheme._buildFloatingActionButtonThemeData(),
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
    );

    return baseTheme.copyWith(
      textTheme: GoogleFonts.robotoTextTheme(baseTheme.textTheme),
    );
  }

  static AppBarTheme _buildBarTheme() {
    return const AppBarTheme(
      backgroundColor: AppColors.trueWhiteColor,
      foregroundColor: AppColors.greyColor,
      centerTitle: true,
      elevation: 0.0,
    );
  }

  static FloatingActionButtonThemeData _buildFloatingActionButtonThemeData() {
    return const FloatingActionButtonThemeData(
      elevation: 0.0,
      backgroundColor: AppColors.primaryColor,
      foregroundColor: AppColors.whiteColor,
    );
  }
}
