import 'package:flutter/material.dart';

abstract final class AppColors {
  AppColors._();

  // Background
  static const Color background = Color(0xFF0A0E1A);
  static const Color surface = Color(0xFF111827);
  static const Color surfaceElevated = Color(0xFF1A2235);
  static const Color cardBg = Color(0xFF131C2E);

  // Neon Accent
  static const Color neonCyan = Color(0xFF00D4FF);
  static const Color neonPurple = Color(0xFF7C3AED);
  static const Color neonGreen = Color(0xFF00FF88);
  static const Color accentGradientStart = Color(0xFF00D4FF);
  static const Color accentGradientEnd = Color(0xFF7C3AED);

  // Text
  static const Color textPrimary = Color(0xFFE2E8F0);
  static const Color textSecondary = Color(0xFF94A3B8);
  static const Color textMuted = Color(0xFF475569);

  // Border / Divider
  static const Color border = Color(0xFF1E2D45);
  static const Color borderGlow = Color(0xFF00D4FF33);

  // Status
  static const Color success = Color(0xFF00FF88);
  static const Color error = Color(0xFFFF4757);
}
