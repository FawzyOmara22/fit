import 'package:flutter/material.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import '../../../core/theme/app_colors.dart';

class UnitSelectionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData centerIcon;
  final bool isSelected;
  final VoidCallback onTap;

  const UnitSelectionCard({super.key, required this.title, required this.subtitle, required this.centerIcon, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: isSelected ? AppColors.primary : AppColors.inputBackground, width: 2),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4))],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 20, height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected ? AppColors.primary : Colors.transparent,
                  border: Border.all(color: isSelected ? Colors.transparent : AppColors.borderDark, width: 1.5),
                ),
                child: isSelected ? const Icon(Icons.check, size: 14, color: AppColors.white) : null,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: isSelected ? const Color(0xFFE6EFFF) : AppColors.inputBackground, shape: BoxShape.circle),
              child: Icon(centerIcon, color: isSelected ? AppColors.primary : AppColors.iconGrey, size: 28),
            ),
            const SizedBox(height: 16),
            Text(title, style: AppTextStyles.cardTitle18.copyWith(fontSize: 16)),
            const SizedBox(height: 4),
            Text(subtitle, style: AppTextStyles.label10GreyDark),
          ],
        ),
      ),
    );
  }
}