import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract final class AppSizes {
  AppSizes._();

  static const double maxWidth    = 1100.0;
  static const double navHeight   = 60.0;
  static const double sectionV    = 96.0;
  static const double sectionH    = 48.0;

  static const double radiusS  = 8.0;
  static const double radiusM  = 12.0;
  static const double radiusL  = 16.0;
  static const double radiusXL = 20.0;
}

abstract final class AppTextStyles {
  AppTextStyles._();

  static const TextStyle heroName = TextStyle(
    fontSize: 54,
    fontWeight: FontWeight.w800,
    letterSpacing: -2,
    height: 1.05,
    color: Colors.white,
  );

  static const TextStyle sectionLabel = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w700,
    letterSpacing: 3,
    color: AppColors.neonCyan,
  );

  static const TextStyle sectionTitle = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w800,
    letterSpacing: -1,
    color: AppColors.textPrimary,
  );

  static const TextStyle cardTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static const TextStyle body = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.75,
  );

  static const TextStyle bodySm = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.7,
  );

  static const TextStyle mono = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    fontFamily: 'monospace',
    color: AppColors.neonCyan,
  );

  static const TextStyle chip = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.3,
  );
}
