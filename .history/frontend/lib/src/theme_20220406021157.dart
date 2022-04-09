import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xff3F51B5);
  static const primaryDark = Color(0xff303F9F);
  static const primaryLight = Color(0xffC5CAE9);
  static const textLight = Color(0xffFFFFFF);
  static const text = Color(0xff212121);
  static const accent = Color(0xff009688);
  static const secondary = Color(0xff757575);
  static const divider = Color(0xffBDBDBD);
}

ThemeData getTheme() {
  final theme = ThemeData.light().copyWith(
    colorScheme: const ColorScheme.light().copyWith(
      primary: AppColors.primary,
      onPrimary: AppColors.textLight,
      primaryContainer: AppColors.primaryDark,
      onPrimaryContainer: AppColors.text,
      secondary: AppColors.secondary,
      tertiary: AppColors.accent,
      onTertiary: AppColors.textLight,
    )
  );
  return theme;
}