import 'package:flutter/material.dart';
import 'package:kinetic/core/theme/app_colors.dart';

class SplashLogoWidget extends StatelessWidget {
  const SplashLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: AppColors.darkCharcoal5, // استخدام لون الشفافية اللي عملناه
            blurRadius: 30,
            offset: Offset(0, 15),
          ),
        ],
      ),
      child: const Center(
        // استخدمت أيقونة مشابهة مؤقتاً لحد ما تضيف الـ SVG الحقيقي
        child: Icon(
          Icons.fitness_center, 
          color: AppColors.primary, 
          size: 60,
        ),
      ),
    );
  }
}