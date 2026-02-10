import 'package:flutter/material.dart';
import 'package:posts/core/theme/app_fonts.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData getAppTheme() {
    return ThemeData(
      fontFamily: AppFonts.mainAppFont,
      scaffoldBackgroundColor: AppColors.backgroundColor,
      primaryColor: AppColors.primaryColor,
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryColor,
        brightness: Brightness.light,
        primary: AppColors.primaryColor,
        onPrimary: AppColors.textPrimary,
        onSurface: AppColors.textPrimary,
        onSurfaceVariant: AppColors.textSecondary,
      ),
      appBarTheme: AppBarTheme(
        toolbarHeight: 60,
        centerTitle: true,
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        actionsPadding: EdgeInsetsDirectional.only(end: 16.0),
        titleTextStyle: AppTextStyles.bodyLargeSemiBold(
          color: AppColors.textPrimary,
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          alignment: Alignment.center,
          fixedSize: Size(double.infinity, 54),
          backgroundColor: AppColors.primaryColor,
          foregroundColor: AppColors.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(12.0),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 14.49),
          textStyle: AppTextStyles.buttonLargeStyle(
            color: AppColors.whiteColor,
          ),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.cardColor,
        contentTextStyle: TextStyle(color: AppColors.textPrimary),
      ),
      iconTheme: IconThemeData(color: AppColors.textSecondary, size: 16.0),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.whiteColor,
        elevation: 0.0,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.textFieldBackgroundColor,
        hintStyle: AppTextStyles.textFieldHintStyle(),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.textFieldBorderColor),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.textFieldBorderColor),
          borderRadius: BorderRadius.circular(8.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.textFieldBorderColor),
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
