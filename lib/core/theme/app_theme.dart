import 'package:flutter/material.dart';
import 'package:kinetic/core/theme/app_colors.dart';


class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Inter', // الخط اللي استخرجناه
      scaffoldBackgroundColor: AppColors.scaffoldBackground,
      primaryColor: AppColors.primary,
      
      // توحيد شكل الـ AppBar في التطبيق كله
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.scaffoldBackground,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.darkCharcoal),
      ),
      
      // توحيد شكل النصوص
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: AppColors.darkCharcoal),
        bodyMedium: TextStyle(color: AppColors.grayText),
      ),
    );
  }
}