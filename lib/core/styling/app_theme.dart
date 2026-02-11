import 'package:finance_ui/core/styling/app_colors.dart';
import 'package:finance_ui/core/styling/app_fonts.dart';
import 'package:finance_ui/core/styling/app_styles.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.white,
    fontFamily: AppFonts.mainFont,
    textTheme: TextTheme(
      headlineLarge: AppStyles.headPrimary,
      headlineMedium: AppStyles.subtitlesStyle,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.primary,
      textTheme: ButtonTextTheme.primary,
    ),
  );
}