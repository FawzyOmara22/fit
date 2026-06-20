import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';

// كارت العمق (Depth)
class DepthCardWidget extends StatelessWidget {
  final double depth;
  final String label; // بييجي من اللوكاليزيشن

  const DepthCardWidget({Key? key, required this.depth, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(label, style: AppTextStyles.label10Grey.copyWith(color: AppColors.white70)),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.white.withOpacity(0.2)),
              ),
              child: Text(
                "${depth.toInt()}%",
                style: AppTextStyles.heading24.copyWith(color: AppColors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// كارت العدّات (Rep Count)
class RepCountCardWidget extends StatelessWidget {
  final int reps;
  final String label; // من اللوكاليزيشن
  final String repText; // من اللوكاليزيشن

  const RepCountCardWidget({Key? key, required this.reps, required this.label, required this.repText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(label, style: AppTextStyles.label10Grey.copyWith(color: AppColors.white70)),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.primaryLight.withOpacity(0.3), AppColors.white.withOpacity(0.1)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.white.withOpacity(0.2)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.circle, color: AppColors.successGreen, size: 10),
                  const SizedBox(width: 8),
                  Text(
                    "$repText${reps.toString().padLeft(2, '0')}",
                    style: AppTextStyles.heading24.copyWith(color: AppColors.white, fontStyle: FontStyle.italic, fontWeight: FontWeight.w900),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// أزرار الفلاتر (Toggles)
class FilterToggleButton extends StatelessWidget {
  final IconData icon;
  final String label; // من اللوكاليزيشن
  final bool isActive;
  final VoidCallback onTap;

  const FilterToggleButton({Key? key, required this.icon, required this.label, required this.isActive, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isActive ? AppColors.errorRed : AppColors.white.withOpacity(0.2), // إعطاء لون مميز عند التفعيل
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppColors.white, size: 20),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: AppTextStyles.label10Grey.copyWith(
              color: isActive ? AppColors.white : AppColors.white70,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}