import 'package:flutter/material.dart';

abstract final class AppColors {
  AppColors._();

  static const Color background   = Color(0xFF080C14);
  static const Color surface      = Color(0xFF111827);
  static const Color surfaceCard  = Color(0xFF111827);
  static const Color border       = Color(0xFF1E293B);
  static const Color borderGlow   = Color(0xFF00D4FF);

  static const Color neonCyan     = Color(0xFF00D4FF);
  static const Color neonPurple   = Color(0xFF7C3AED);
  static const Color neonGreen    = Color(0xFF00FF88);
  static const Color neonAmber    = Color(0xFFFFC107);
  static const Color neonPink     = Color(0xFFFF6B9D);

  static const Color textPrimary   = Color(0xFFF1F5F9);
  static const Color textSecondary = Color(0xFF64748B);
  static const Color textMuted     = Color(0xFF334155);
  static const Color textCard      = Color(0xFFCBD5E1);

  static const Gradient brandGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [neonCyan, neonPurple],
  );
}
