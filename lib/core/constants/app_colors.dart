import 'package:flutter/material.dart';

// Monochrome editorial palette — no neon, no accent colors.
abstract final class AppColors {
  AppColors._();

  static const Color background  = Color(0xFF0C0C0C);
  static const Color surfaceAlt   = Color(0xFF0E0E0E);
  static const Color surfaceCard  = Color(0xFF0F0F0F);

  static const Color white        = Color(0xFFFFFFFF);
  static const Color offWhite     = Color(0xFFF0F0F0);
  static const Color textBright   = Color(0xFFE8E8E8);

  static const Color textPrimary   = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFAAAAAA); // body / desc
  static const Color textTertiary  = Color(0xFF888888); // muted labels
  static const Color textQuiet     = Color(0xFF777777);
  static const Color textFaint     = Color(0xFF555555); // section numbers
  static const Color textGhost     = Color(0xFF3A3A3A); // bg numerals / marquee

  static const Color border        = Color(0xFF1E1E1E);
  static const Color borderHover   = Color(0xFF666666);
  static const Color divider       = Color(0xFF1A1A1A);

  static const Color bgGiant       = Color(0xFF131313); // huge bg "AA"
}
