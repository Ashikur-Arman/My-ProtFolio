import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract final class AppSizes {
  AppSizes._();
  // maxWidth: double.infinity = full bleed; use a very large cap
  // so content fills the screen on any monitor
  static const double maxWidth   = 1400.0;
  static const double navHeight  = 64.0;
  static const double sectionV   = 96.0;
  // hPad is now responsive — see responsivePad()
  static const double hPadMin    = 24.0;   // mobile
  static const double hPadMax    = 80.0;   // wide desktop

  /// Returns horizontal padding based on screen width
  static double responsivePad(double screenW) {
    if (screenW < 600)  return hPadMin;
    if (screenW < 1000) return 48.0;
    if (screenW < 1300) return hPadMax;
    return 100.0;
  }
}

abstract final class AppTextStyles {
  AppTextStyles._();

  static const TextStyle heroName = TextStyle(
    fontSize: 64, fontWeight: FontWeight.w800,
    letterSpacing: -2.5, height: 1.04, color: Colors.white,
  );
  static const TextStyle typewriter = TextStyle(
    fontSize: 24, fontWeight: FontWeight.w500, color: AppColors.neonCyan,
  );
  static const TextStyle typewriterPrefix = TextStyle(
    fontSize: 24, fontWeight: FontWeight.w500, color: AppColors.textMuted,
  );
  static const TextStyle sectionLabel = TextStyle(
    fontSize: 12, fontWeight: FontWeight.w700,
    letterSpacing: 3.5, color: AppColors.neonCyan,
  );
  static const TextStyle sectionTitle = TextStyle(
    fontSize: 42, fontWeight: FontWeight.w800,
    letterSpacing: -1.5, color: AppColors.textPrimary,
  );
  static const TextStyle cardTitle = TextStyle(
    fontSize: 17, fontWeight: FontWeight.w700, color: AppColors.textPrimary,
  );
  static const TextStyle body = TextStyle(
    fontSize: 16, fontWeight: FontWeight.w400,
    color: AppColors.textSecondary, height: 1.75,
  );
  static const TextStyle bodySm = TextStyle(
    fontSize: 14, fontWeight: FontWeight.w400,
    color: AppColors.textSecondary, height: 1.7,
  );
  static const TextStyle chip = TextStyle(
    fontSize: 12, fontWeight: FontWeight.w600, letterSpacing: 0.3,
  );
  static const TextStyle label = TextStyle(
    fontSize: 12, fontWeight: FontWeight.w700,
    letterSpacing: 2.5, color: AppColors.textMuted,
  );
  static const TextStyle statValue = TextStyle(
    fontSize: 36, fontWeight: FontWeight.w800, color: Colors.white,
  );
  static const TextStyle statLabel = TextStyle(
    fontSize: 13, fontWeight: FontWeight.w500, color: AppColors.textMuted,
  );
  static const TextStyle navItem = TextStyle(
    fontSize: 14, fontWeight: FontWeight.w500,
  );
  static const TextStyle footerText = TextStyle(
    fontSize: 13, color: Color(0xFF334155),
  );
}
