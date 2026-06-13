import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

abstract final class AppSizes {
  AppSizes._();
  static const double maxWidth  = 1400.0;
  static const double navHeight = 64.0;
  static const double sectionV  = 96.0;

  static double pad(double w) {
    if (w < 600)  return 24.0;
    if (w < 1000) return 48.0;
    if (w < 1300) return 80.0;
    return 100.0;
  }
}

abstract final class AppText {
  AppText._();

  static const TextStyle navLogo = TextStyle(
    fontSize: 13, fontWeight: FontWeight.w600,
    letterSpacing: 4, color: AppColors.white,
  );
  static const TextStyle navLink = TextStyle(
    fontSize: 12, fontWeight: FontWeight.w500,
    letterSpacing: 2, color: AppColors.grey3,
  );
  static const TextStyle navLinkActive = TextStyle(
    fontSize: 12, fontWeight: FontWeight.w500,
    letterSpacing: 2, color: AppColors.white,
  );

  static const TextStyle heroLabel = TextStyle(
    fontSize: 11, fontWeight: FontWeight.w600,
    letterSpacing: 3, color: AppColors.grey3,
  );
  static TextStyle heroName = GoogleFonts.playfairDisplay(
    textStyle: const TextStyle(
    fontSize: 88, fontWeight: FontWeight.w900,
    letterSpacing: -4, height: 0.98, color: AppColors.white,
    ),
  );
  static TextStyle heroNameItalic = GoogleFonts.playfairDisplay(
    textStyle: const TextStyle(
    fontSize: 88, fontWeight: FontWeight.w900,
    fontStyle: FontStyle.italic,
    letterSpacing: -4, height: 0.98, color: AppColors.grey1,
    ),
  );
  static const TextStyle typewriter = TextStyle(
    fontSize: 14, fontWeight: FontWeight.w500,
    letterSpacing: 2, color: AppColors.white,
  );
  static const TextStyle heroDesc = TextStyle(
    fontSize: 17, fontWeight: FontWeight.w400,
    color: AppColors.grey1, height: 1.8,
  );
  static const TextStyle btnSolid = TextStyle(
    fontSize: 12, fontWeight: FontWeight.w700,
    letterSpacing: 2, color: AppColors.background,
  );
  static const TextStyle btnGhost = TextStyle(
    fontSize: 12, fontWeight: FontWeight.w600,
    letterSpacing: 2, color: AppColors.white,
  );
  static const TextStyle statValue = TextStyle(
    fontSize: 40, fontWeight: FontWeight.w800,
    letterSpacing: -2, color: AppColors.white,
  );
  static const TextStyle statLabel = TextStyle(
    fontSize: 11, fontWeight: FontWeight.w600,
    letterSpacing: 2, color: AppColors.grey4,
  );
  static const TextStyle marqueeItem = TextStyle(
    fontSize: 11, fontWeight: FontWeight.w600,
    letterSpacing: 3, color: AppColors.grey6,
  );

  static const TextStyle sectionNum = TextStyle(
    fontSize: 11, fontWeight: FontWeight.w600,
    letterSpacing: 3, color: AppColors.grey5,
  );
  static TextStyle sectionTitle = GoogleFonts.playfairDisplay(
    textStyle: const TextStyle(
    fontSize: 48, fontWeight: FontWeight.w700,
    letterSpacing: -1, color: AppColors.white,
    ),
  );
  static const TextStyle sectionCount = TextStyle(
    fontSize: 60, fontWeight: FontWeight.w800,
    letterSpacing: -3, color: AppColors.grey7,
  );

  static const TextStyle expCompany = TextStyle(
    fontSize: 13, fontWeight: FontWeight.w700,
    letterSpacing: 2, color: AppColors.white,
  );
  static const TextStyle expPeriod = TextStyle(
    fontSize: 11, fontWeight: FontWeight.w500,
    letterSpacing: 1, color: AppColors.grey4,
  );
  static const TextStyle expTag = TextStyle(
    fontSize: 10, fontWeight: FontWeight.w600,
    letterSpacing: 2, color: AppColors.grey3,
  );
  static const TextStyle expRole = TextStyle(
    fontSize: 22, fontWeight: FontWeight.w700,
    letterSpacing: -0.5, color: AppColors.white,
  );
  static const TextStyle expBullet = TextStyle(
    fontSize: 14, fontWeight: FontWeight.w400,
    color: AppColors.grey2, height: 1.8,
  );

  static const TextStyle projNum = TextStyle(
    fontSize: 11, fontWeight: FontWeight.w600,
    letterSpacing: 3, color: AppColors.grey6,
  );
  static TextStyle projTitle = GoogleFonts.playfairDisplay(
    textStyle: const TextStyle(
    fontSize: 26, fontWeight: FontWeight.w700,
    letterSpacing: -0.5, color: AppColors.white, height: 1.15,
    ),
  );
  static const TextStyle projDesc = TextStyle(
    fontSize: 13, fontWeight: FontWeight.w400,
    color: AppColors.grey3, height: 1.8,
  );
  static const TextStyle projImpact = TextStyle(
    fontSize: 12, fontWeight: FontWeight.w400,
    color: AppColors.grey1, height: 1.7,
  );
  static const TextStyle projTag = TextStyle(
    fontSize: 10, fontWeight: FontWeight.w600,
    letterSpacing: 2, color: AppColors.grey4,
  );

  static const TextStyle skillCatLabel = TextStyle(
    fontSize: 10, fontWeight: FontWeight.w700,
    letterSpacing: 3, color: AppColors.grey5,
  );
  static const TextStyle skillPill = TextStyle(
    fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.grey1,
  );

  static const TextStyle achNum = TextStyle(
    fontSize: 32, fontWeight: FontWeight.w800,
    letterSpacing: -2, color: AppColors.grey7,
  );
  static const TextStyle achTitle = TextStyle(
    fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.white,
  );
  static const TextStyle achSub = TextStyle(
    fontSize: 12, fontWeight: FontWeight.w400,
    color: AppColors.grey4, height: 1.6,
  );

  static TextStyle contactBig = GoogleFonts.playfairDisplay(
    textStyle: const TextStyle(
    fontSize: 64, fontWeight: FontWeight.w700,
    letterSpacing: -3, height: 1.05, color: AppColors.white,
    ),
  );
  static TextStyle contactBigItalic = GoogleFonts.playfairDisplay(
    textStyle: const TextStyle(
    fontSize: 64, fontWeight: FontWeight.w700,
    fontStyle: FontStyle.italic,
    letterSpacing: -3, height: 1.05, color: AppColors.grey5,
    ),
  );
  static const TextStyle contactLink = TextStyle(
    fontSize: 11, fontWeight: FontWeight.w600,
    letterSpacing: 3, color: AppColors.grey3,
  );
  static const TextStyle contactPhone = TextStyle(
    fontSize: 11, fontWeight: FontWeight.w600,
    letterSpacing: 2, color: AppColors.grey5,
  );

  static const TextStyle footerText = TextStyle(
    fontSize: 11, fontWeight: FontWeight.w600,
    letterSpacing: 2, color: AppColors.grey6,
  );
}
