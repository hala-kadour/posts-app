import 'package:flutter/cupertino.dart';
import 'package:posts/core/theme/app_fonts.dart';

import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();
  // Title Large
  static TextStyle titleLarge({
    Color? color,
    double? hight,
    double? letterSpacing,
  }) {
    return TextStyle(
      color: color ?? AppColors.textPrimary,
      fontWeight: FontWeight.bold,
      fontFamily: AppFonts.mainAppFont,
      fontSize: 25,
      height: hight ?? 1.0,
      letterSpacing: letterSpacing ?? 0.0,
    );
  }

  // Body Large
  static TextStyle bodyLargeRegular({
    Color? color,
    double? hight,
    double? letterSpacing,
  }) {
    return TextStyle(
      color: color ?? AppColors.textPrimary,
      fontWeight: FontWeight.w400,
      fontFamily: AppFonts.mainAppFont,
      fontSize: 18,
      height: hight ?? 1.0,
      letterSpacing: letterSpacing ?? 0.0,
    );
  }

  static TextStyle bodyLargeSemiBold({
    Color? color,
    double? hight,
    double? letterSpacing,
  }) {
    return TextStyle(
      color: color ?? AppColors.textPrimary,
      fontWeight: FontWeight.w600,
      fontFamily: AppFonts.mainAppFont,
      fontSize: 18,
      height: hight ?? 1.0,
      letterSpacing: letterSpacing ?? 0.0,
    );
  }

  // Body Medium
  static TextStyle bodyMediumRegular({
    Color? color,
    double? hight,
    double? letterSpacing,
  }) {
    return TextStyle(
      color: color ?? AppColors.textPrimary,
      fontWeight: FontWeight.w400,
      fontFamily: AppFonts.mainAppFont,
      fontSize: 16,
      height: hight ?? 1.0,
      letterSpacing: letterSpacing ?? 0.0,
    );
  }

  static TextStyle bodyMediumBold({
    Color? color,
    double? hight,
    double? letterSpacing,
  }) {
    return TextStyle(
      color: color ?? AppColors.textPrimary,
      fontWeight: FontWeight.bold,
      fontFamily: AppFonts.mainAppFont,
      fontSize: 16,
      height: hight ?? 1.0,
      letterSpacing: letterSpacing ?? 0.0,
    );
  }

  // Body Small
  static TextStyle bodySmallRegular({
    Color? color,
    double? hight,
    double? letterSpacing,
  }) {
    return TextStyle(
      color: color ?? AppColors.textSecondary,
      fontWeight: FontWeight.w400,
      fontFamily: AppFonts.mainAppFont,
      fontSize: 12,
      height: hight ?? 1.0,
      letterSpacing: letterSpacing ?? 0.0,
    );
  }

  static TextStyle bodySmallBold({
    Color? color,
    double? hight,
    double? letterSpacing,
  }) {
    return TextStyle(
      color: color ?? AppColors.textSecondary,
      fontWeight: FontWeight.bold,
      fontFamily: AppFonts.mainAppFont,
      fontSize: 12,
      height: hight ?? 1.0,
      letterSpacing: letterSpacing ?? 0.0,
    );
  }

  // UI
  static TextStyle textFieldHintStyle({
    Color? color,
    double? hight,
    double? letterSpacing,
  }) {
    return TextStyle(
      color: color ?? AppColors.textFieldHintColor,
      fontWeight: FontWeight.w400,
      fontFamily: AppFonts.mainAppFont,
      fontSize: 13,
      height: hight ?? 1.0,
      letterSpacing: letterSpacing ?? 0.0,
    );
  }

  static TextStyle textFieldStyle({
    Color? color,
    double? hight,
    double? letterSpacing,
  }) {
    return TextStyle(
      color: color ?? AppColors.textFieldHintColor,
      fontWeight: FontWeight.w600,
      fontFamily: AppFonts.mainAppFont,
      fontSize: 18,
      height: hight ?? 1.0,
      letterSpacing: letterSpacing ?? 0.0,
    );
  }

  static TextStyle buttonLargeStyle({
    Color? color,
    double? hight,
    double? letterSpacing,
  }) {
    return TextStyle(
      color: color ?? AppColors.whiteColor,
      fontWeight: FontWeight.bold,
      fontFamily: AppFonts.mainAppFont,
      fontSize: 16,
      height: hight ?? 1.0,
      letterSpacing: letterSpacing ?? 0.0,
    );
  }

  static TextStyle buttonSmallStyle({
    Color? color,
    double? hight,
    double? letterSpacing,
  }) {
    return TextStyle(
      color: color ?? AppColors.whiteColor,
      fontWeight: FontWeight.bold,
      fontFamily: AppFonts.mainAppFont,
      fontSize: 12,
      height: hight ?? 1.0,
      letterSpacing: letterSpacing ?? 0.0,
    );
  }

  static TextStyle cardSubTitleStyle({
    Color? color,
    double? hight,
    double? letterSpacing,
  }) {
    return TextStyle(
      color: color ?? AppColors.textPrimary,
      fontWeight: FontWeight.w500,
      fontFamily: AppFonts.mainAppFont,
      fontSize: 11.36,
      height: hight ?? 1.0,
      letterSpacing: letterSpacing ?? 0.0,
    );
  }

  static TextStyle cardTitleStyle({
    Color? color,
    double? hight,
    double? letterSpacing,
  }) {
    return TextStyle(
      color: color ?? AppColors.textPrimary,
      fontWeight: FontWeight.w900,
      fontFamily: AppFonts.mainAppFont,
      fontSize: 15,
      height: hight ?? 1.0,
      letterSpacing: letterSpacing ?? 0.0,
    );
  }

  static TextStyle buttomNavBarStyle({
    Color? color,
    double? hight,
    double? letterSpacing,
  }) {
    return TextStyle(
      color: color ?? AppColors.textPrimary,
      fontWeight: FontWeight.bold,
      fontFamily: AppFonts.mainAppFont,
      fontSize: 11.98,
      height: hight ?? 1.0,
      letterSpacing: letterSpacing ?? 0.0,
    );
  }
}
