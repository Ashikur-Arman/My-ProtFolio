import 'package:flutter/material.dart';

abstract final class AppColors {
  AppColors._();

  static const Color background = Color(0xFF0C0C0C);
  static const Color surfaceAlt  = Color(0xFF0E0E0E);
  static const Color surface     = Color(0xFF111111);

  static const Color white       = Color(0xFFF0F0F0);
  static const Color pureWhite   = Color(0xFFFFFFFF);

  static const Color grey1       = Color(0xFF888888); // body text
  static const Color grey2       = Color(0xFF666666); // secondary
  static const Color grey3       = Color(0xFF555555); // muted
  static const Color grey4       = Color(0xFF444444); // labels
  static const Color grey5       = Color(0xFF333333); // faint
  static const Color grey6       = Color(0xFF2A2A2A); // very faint
  static const Color grey7       = Color(0xFF1E1E1E); // borders
  static const Color grey8       = Color(0xFF1A1A1A); // dividers
  static const Color grey9       = Color(0xFF141414); // bg text
}
