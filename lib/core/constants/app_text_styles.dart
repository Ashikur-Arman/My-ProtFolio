import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

abstract final class AppSizes {
  AppSizes._();
  static const double maxWidth   = 1400.0;
  static const double navHeight  = 64.0;
  static const double sectionV   = 100.0;
  static const double hPadMin    = 24.0;
  static const double hPadMax    = 100.0;

  static double responsivePad(double w) {
    if (w < 600)  return hPadMin;
    if (w < 1000) return 48.0;
    if (w < 1300) return 80.0;
    return hPadMax;
  }
}

/// All text styles for the Bold Editorial / Monochrome design.
/// Serif (Playfair Display) is used for headlines.
/// Sans (Inter) is the default body font, set globally in AppTheme.
abstract final class AppTextStyles {
  AppTextStyles._();

  static TextStyle _serif({
    required double size,
    required FontWeight weight,
    double letterSpacing = 0,
    double height = 1.0,
    Color color = AppColors.white,
    FontStyle style = FontStyle.normal,
  }) {
    return GoogleFonts.playfairDisplay(
      fontSize: size, fontWeight: weight, letterSpacing: letterSpacing,
      height: height, color: color, fontStyle: style,
    );
  }

  // ── Hero ─────────────────────────────────────────────────────
  static TextStyle heroName({double size = 80}) => _serif(
    size: size, weight: FontWeight.w900, letterSpacing: -3, height: 1.0,
  );

  static TextStyle heroNameItalic({double size = 80}) => _serif(
    size: size, weight: FontWeight.w900, letterSpacing: -3, height: 1.0,
    color: AppColors.textTertiary, style: FontStyle.italic,
  );

  static const TextStyle heroLabel = TextStyle(
    fontSize: 12, fontWeight: FontWeight.w700,
    letterSpacing: 3, color: AppColors.textTertiary,
  );

  static const TextStyle typewriter = TextStyle(
    fontSize: 16, fontWeight: FontWeight.w600,
    letterSpacing: 1, color: AppColors.white,
  );

  // ── Sections ─────────────────────────────────────────────────
  static const TextStyle sectionNum = TextStyle(
    fontSize: 12, fontWeight: FontWeight.w700,
    letterSpacing: 3, color: AppColors.textFaint,
  );

  static TextStyle sectionTitle({double size = 48}) => _serif(
    size: size, weight: FontWeight.w700, letterSpacing: -1,
  );

  static const TextStyle sectionCount = TextStyle(
    fontSize: 60, fontWeight: FontWeight.w800,
    letterSpacing: -3, color: AppColors.border,
  );

  // ── Body text ────────────────────────────────────────────────
  static const TextStyle body = TextStyle(
    fontSize: 16, fontWeight: FontWeight.w400,
    color: AppColors.textSecondary, height: 1.85,
  );

  static const TextStyle bodySm = TextStyle(
    fontSize: 13, fontWeight: FontWeight.w400,
    color: AppColors.textTertiary, height: 1.85,
  );

  // ── Stats ────────────────────────────────────────────────────
  static const TextStyle statValue = TextStyle(
    fontSize: 36, fontWeight: FontWeight.w800,
    letterSpacing: -2, color: AppColors.white,
  );

  static const TextStyle statLabel = TextStyle(
    fontSize: 11, fontWeight: FontWeight.w600,
    letterSpacing: 2, color: AppColors.textQuiet,
  );

  // ── Nav / Buttons / Misc ─────────────────────────────────────
  static const TextStyle navItem = TextStyle(
    fontSize: 12, fontWeight: FontWeight.w600, letterSpacing: 2,
  );

  static const TextStyle btnLabel = TextStyle(
    fontSize: 12, fontWeight: FontWeight.w700, letterSpacing: 2,
  );

  static const TextStyle logo = TextStyle(
    fontSize: 13, fontWeight: FontWeight.w700, letterSpacing: 4,
    color: AppColors.white,
  );

  static const TextStyle footerText = TextStyle(
    fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 2,
    color: AppColors.textGhost,
  );

  static const TextStyle tagLabel = TextStyle(
    fontSize: 10, fontWeight: FontWeight.w700, letterSpacing: 2,
    color: AppColors.textQuiet,
  );

  static const TextStyle marquee = TextStyle(
    fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 3,
    color: AppColors.textGhost,
  );

  // ── Projects ─────────────────────────────────────────────────
  static TextStyle projTitle({double size = 26}) => _serif(
    size: size, weight: FontWeight.w700, letterSpacing: -0.5, height: 1.15,
  );

  // ── Contact ──────────────────────────────────────────────────
  static TextStyle contactBig({double size = 56}) => _serif(
    size: size, weight: FontWeight.w700, letterSpacing: -2, height: 1.08,
  );

  static TextStyle contactBigItalic({double size = 56}) => _serif(
    size: size, weight: FontWeight.w700, letterSpacing: -2, height: 1.08,
    color: AppColors.textFaint, style: FontStyle.italic,
  );
}
