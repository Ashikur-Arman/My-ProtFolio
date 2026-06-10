import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

abstract final class AppTheme {
  AppTheme._();
  static ThemeData get dark => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.neonCyan,
      secondary: AppColors.neonPurple,
      surface: AppColors.surface,
    ),
    scrollbarTheme: const ScrollbarThemeData(
      thumbVisibility: WidgetStatePropertyAll(false),
    ),
  );
}
