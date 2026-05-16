import 'package:flutter/material.dart';

class AppColors {
  // Background colors
  static const Color background = Color(0xFF0F1123);
  static const Color surface = Color(0xFF1A1D35);
  static const Color surfaceLight = Color(0xFF252845);
  static const Color cardBorder = Color(0xFF2A2D4A);

  // Primary accent colors
  static const Color primary = Color(0xFF6C63FF);
  static const Color primaryLight = Color(0xFF8B83FF);
  static const Color secondary = Color(0xFF00D9FF);
  static const Color accent = Color(0xFFFF6B9D);
  static const Color success = Color(0xFF00E5A0);
  static const Color warning = Color(0xFFFFB946);
  static const Color error = Color(0xFFFF5B5B);

  // Text colors
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFF8B8FAD);
  static const Color textMuted = Color(0xFF5A5E7E);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF6C63FF), Color(0xFF00D9FF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient accentGradient = LinearGradient(
    colors: [Color(0xFFFF6B9D), Color(0xFFFF8E53)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient successGradient = LinearGradient(
    colors: [Color(0xFF00E5A0), Color(0xFF00D9FF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient warningGradient = LinearGradient(
    colors: [Color(0xFFFFB946), Color(0xFFFF6B9D)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
