import 'package:flutter/material.dart'; // تأكد من مسار الترجمة
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          //  _buildNavItem(index: 0, icon: Icons.home_outlined, label: l10n.navBarHome),
            _buildNavItem(index: 0, icon: Icons.fitness_center, label: l10n.navBarPrograms), // هتقرأ كلمة TRAIN من ملف اللغة
            _buildNavItem(index: 1, icon: Icons.smart_toy, label: l10n.navBarAiHub),
            _buildNavItem(index: 2, icon: Icons.person_outline, label: l10n.navBarProfile),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({required int index, required IconData icon, required String label}) {
    final isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () => onTap(index),
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        padding: isSelected 
            ? const EdgeInsets.symmetric(horizontal: 20, vertical: 12)
            : const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          gradient: isSelected 
              ? AppColors.primaryGradient 
              : const LinearGradient(
                  colors: [Colors.transparent, Colors.transparent],
                ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              // 👇 التعديل هنا: خلينا اللون أسود صريح بدل الرمادي لو الأيقونة مش Selected
              color: isSelected ? AppColors.white : Colors.black, 
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label, 
              style: isSelected ? AppTextStyles.navBarSelected10 : AppTextStyles.navBarUnselected10.copyWith(
                color: Colors.black, // وخلينا النص كمان أسود عشان يبقى متناسق مع الأيقونة
              ),
            ),
          ],
        ),
      ),
    );
  }
}