import 'package:flutter/material.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import '../../../core/theme/app_colors.dart';

class AffectedAreaCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const AffectedAreaCard({
    super.key, 
    required this.icon, 
    required this.title, 
    required this.isSelected, 
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
          // 💡 هنا التعديل: تطبيق الـ Gradient لما يكون مختار
          gradient: isSelected
              ? const LinearGradient(
                  colors: [AppColors.gradientStart, AppColors.gradientEnd], // درجات الأزرق المتدرج
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          color: isSelected ? null : AppColors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.transparent, width: 2),
          boxShadow: isSelected 
            ? [] 
            : [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4))],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // الأيقونة تتغير للون الأبيض لما يكون مختار
            Icon(
              icon, 
              color: isSelected ? AppColors.white : AppColors.primary, 
              size: 28
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                // النص يتغير للأبيض لما يكون مختار
                style: AppTextStyles.cardTitle14.copyWith(
                  color: isSelected ? AppColors.white : AppColors.darkCharcoal
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}