import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/train/pages/filters_bottom_sheet.dart';


// -----------------------------------------------------------------
// 1. شريط البحث (Search Bar)
// -----------------------------------------------------------------
class ExerciseSearchBar extends StatelessWidget {
  // 👇 تم إضافة المتغير ده عشان نربط البحث بالشاشة الرئيسية
  final Function(String)? onChanged;

  const ExerciseSearchBar({Key? key, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      decoration: BoxDecoration(
        color: AppColors.inputBackground,
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextField(
        onChanged: onChanged, // 👇 تم إضافة الخاصية دي عشان تبعت النص اللي بيتكتب
        decoration: InputDecoration(
          hintText: l10n.searchExercises,
          hintStyle: AppTextStyles.addExSearchHint,
          prefixIcon: const Icon(Icons.search, color: AppColors.textGrey),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------
// 2. زر الفلاتر (Filters Button)
// -----------------------------------------------------------------
class ExerciseFiltersButton extends StatelessWidget {
  final VoidCallback? onTap; // 👈 ضفنا المتغير ده عشان نتحكم في الزرار من بره

  const ExerciseFiltersButton({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.divider),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(24),
          onTap: onTap, // 👈 هنا بقى بينفذ الأمر اللي جياله من الشاشة الرئيسية
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.tune_rounded, color: AppColors.primary, size: 20),
                const SizedBox(width: 8),
                Text(l10n.filters, style: AppTextStyles.addExFiltersBtn),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// -----------------------------------------------------------------
// 3. كارت التمرين (Exercise Card)
// -----------------------------------------------------------------
class ExerciseCardWidget extends StatelessWidget {
  final Map<String, dynamic> exercise;
  final bool isSelected;
  final VoidCallback onTap;

  const ExerciseCardWidget({
    Key? key,
    required this.exercise,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.divider,
            width: isSelected ? 2 : 1,
          ),
          boxShadow: [
            if (isSelected)
              BoxShadow(
                color: AppColors.primary.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              )
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                exercise['imageUrl'],
                width: 64,
                height: 64,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(exercise['title'], style: AppTextStyles.addExCardTitle),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(exercise['muscle'], style: AppTextStyles.addExTagMuscle),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: Text('•', style: TextStyle(color: AppColors.iconGrey, fontSize: 10)),
                      ),
                      Text(exercise['equipment'], style: AppTextStyles.addExTagEquipment),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : AppColors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? AppColors.primary : AppColors.borderDark,
                  width: 1.5,
                ),
              ),
              child: isSelected
                  ? const Icon(Icons.check, color: AppColors.white, size: 18)
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------
// 4. الزر السفلي العائم للحفظ (Bottom Submit Button)
// -----------------------------------------------------------------
class AddExercisesBottomButton extends StatelessWidget {
  final int selectedCount;
  final VoidCallback onPressed;

  const AddExercisesBottomButton({
    Key? key,
    required this.selectedCount,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
      decoration: BoxDecoration(
        color: AppColors.background,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.background.withOpacity(0.0),
            AppColors.background.withOpacity(0.9),
            AppColors.background,
          ],
          stops: const [0.0, 0.4, 1.0],
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          gradient: LinearGradient(
            colors: [
              AppColors.primary.withOpacity(0.7), 
              AppColors.primary,
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent, 
            shadowColor: Colors.transparent, 
            minimumSize: const Size(double.infinity, 56),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28),
            ),
            elevation: 0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.add_circle_outline, color: Colors.white, size: 20),
              const SizedBox(width: 8),
              Text(l10n.addNExercises(selectedCount), style: AppTextStyles.addExSubmitBtn),
            ],
          ),
        ),
      ),
    );
  }
}