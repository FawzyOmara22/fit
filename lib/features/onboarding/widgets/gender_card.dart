import 'package:flutter/material.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';

class GenderCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool isSelected;
  final VoidCallback onTap;

  const GenderCard({super.key, required this.icon, required this.title, required this.subtitle, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        margin: const EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.070, horizontal: 30),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.white : AppColors.inputBackground,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: isSelected ? AppColors.primary : Colors.transparent, width: 2),
          boxShadow: isSelected ? [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4))] : [],
        ),
        child: Row(
          children: [
            Container(
              width: 56, height: 56,
              decoration: BoxDecoration(color: isSelected ? AppColors.primary10 : AppColors.lightGray, shape: BoxShape.circle),
              child: Icon(icon, color: isSelected ? AppColors.primary : AppColors.textGrey, size: 28),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextStyles.heading24),
                  const SizedBox(height: 4),
                  Text(subtitle, style: AppTextStyles.body14Height.copyWith(color: AppColors.textGrey.withOpacity(0.6))),
                ],
              ),
            ),
            Container(
              width: 32, height: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? AppColors.primary : Colors.transparent,
                border: Border.all(color: isSelected ? AppColors.primary : AppColors.borderDark, width: 2),
              ),
              child: isSelected ? const Icon(Icons.check, size: 20, color: AppColors.white) : null,
            ),
          ],
        ),
      ),
    );
  }
}