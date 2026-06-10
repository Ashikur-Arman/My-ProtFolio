import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract final class AppSizes {
  AppSizes._();
  static const double maxWidth   = 960.0;
  static const double navHeight  = 60.0;
  static const double sectionV   = 80.0;
  static const double hPad       = 40.0;
}

abstract final class AppTextStyles {
  AppTextStyles._();

  static const TextStyle heroName = TextStyle(
    fontSize: 52, fontWeight: FontWeight.w800,
    letterSpacing: -2, height: 1.05, color: Colors.white,
  );
  static const TextStyle typewriter = TextStyle(
    fontSize: 20, fontWeight: FontWeight.w500, color: AppColors.neonCyan,
  );
  static const TextStyle typewriterPrefix = TextStyle(
    fontSize: 20, fontWeight: FontWeight.w500, color: AppColors.textMuted,
  );
  static const TextStyle sectionLabel = TextStyle(
    fontSize: 11, fontWeight: FontWeight.w700,
    letterSpacing: 3, color: AppColors.neonCyan,
  );
  static const TextStyle sectionTitle = TextStyle(
    fontSize: 34, fontWeight: FontWeight.w800,
    letterSpacing: -1, color: AppColors.textPrimary,
  );
  static const TextStyle cardTitle = TextStyle(
    fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.textPrimary,
  );
  static const TextStyle body = TextStyle(
    fontSize: 14, fontWeight: FontWeight.w400,
    color: AppColors.textSecondary, height: 1.7,
  );
  static const TextStyle bodySm = TextStyle(
    fontSize: 13, fontWeight: FontWeight.w400,
    color: AppColors.textSecondary, height: 1.65,
  );
  static const TextStyle chip = TextStyle(
    fontSize: 11, fontWeight: FontWeight.w600, letterSpacing: 0.3,
  );
  static const TextStyle label = TextStyle(
    fontSize: 11, fontWeight: FontWeight.w700,
    letterSpacing: 2, color: AppColors.textMuted,
  );
  static const TextStyle statValue = TextStyle(
    fontSize: 28, fontWeight: FontWeight.w800, color: Colors.white,
  );
  static const TextStyle statLabel = TextStyle(
    fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.textMuted,
  );
  static const TextStyle navItem = TextStyle(
    fontSize: 13, fontWeight: FontWeight.w500,
  );
  static const TextStyle footerText = TextStyle(
    fontSize: 13, color: Color(0xFF334155),
  );
}
