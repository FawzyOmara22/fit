import 'package:flutter/material.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import '../../../core/theme/app_colors.dart';

class EquipmentCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData iconData;
  final bool isSelected;
  final VoidCallback onTap;

  const EquipmentCard({super.key, required this.title, required this.subtitle, required this.iconData, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: isSelected ? AppColors.primary : Colors.transparent, width: 1.5),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8, offset: const Offset(0, 4))],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(iconData, color: AppColors.primary, size: 24),
                Container(
                  width: 20, height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected ? AppColors.primary : Colors.transparent,
                    border: Border.all(color: isSelected ? Colors.transparent : AppColors.borderDark, width: 1.5),
                  ),
                  child: isSelected ? const Icon(Icons.check, size: 14, color: AppColors.white) : null,
                ),
              ],
            ),
            const Spacer(),
            Text(title, style: AppTextStyles.cardTitle14, maxLines: 1, overflow: TextOverflow.ellipsis),
            const SizedBox(height: 2),
            Text(subtitle.toUpperCase(), style: AppTextStyles.label10Grey.copyWith(color: isSelected ? AppColors.primary : AppColors.textGrey, fontSize: 8), maxLines: 1, overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
    );
  }
}