import 'package:flutter/material.dart';

/// App theme colors and design tokens
class AppColors {
  AppColors._();

  // Primary Palette
  static const Color primary = Color(0xFF6C63FF);
  static const Color primaryLight = Color(0xFF8B85FF);
  static const Color primaryDark = Color(0xFF5046E5);
  
  // Secondary Palette
  static const Color secondary = Color(0xFFFF6584);
  static const Color secondaryLight = Color(0xFFFF8DA3);
  static const Color secondaryDark = Color(0xFFE54D6C);
  
  // Accent Colors
  static const Color accent = Color(0xFF00BFA6);
  static const Color accentLight = Color(0xFF33CDB8);
  static const Color warning = Color(0xFFFFB800);
  static const Color error = Color(0xFFFF4757);
  
  // Neutral Colors - Light Theme
  static const Color background = Color(0xFFF8F9FE);
  static const Color surface = Colors.white;
  static const Color surfaceVariant = Color(0xFFF0F1F5);
  static const Color onSurface = Color(0xFF2D3142);
  static const Color onSurfaceVariant = Color(0xFF8E92BC);
  static const Color border = Color(0xFFE8E9F0);
  static const Color divider = Color(0xFFE8E9F0);
  
  // Neutral Colors - Dark Theme
  static const Color darkBackground = Color(0xFF12131A);
  static const Color darkSurface = Color(0xFF1C1E2A);
  static const Color darkSurfaceVariant = Color(0xFF252836);
  static const Color darkOnSurface = Color(0xFFF5F6FA);
  static const Color darkOnSurfaceVariant = Color(0xFF8E92BC);
  static const Color darkBorder = Color(0xFF2A2D3E);
  static const Color darkDivider = Color(0xFF2A2D3E);
  
  // Gradient Colors
  static const List<Color> primaryGradient = [
    Color(0xFF6C63FF),
    Color(0xFF8B85FF),
  ];
  
  static const List<Color> accentGradient = [
    Color(0xFF00BFA6),
    Color(0xFF33CDB8),
  ];
  
  static const List<Color> warmGradient = [
    Color(0xFFFF6584),
    Color(0xFFFF8DA3),
  ];
}
