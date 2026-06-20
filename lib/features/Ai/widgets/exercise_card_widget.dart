import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart'; // تأكد من المسار
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/Ai/models/exercise_model.dart' show ExerciseModel;

class ExerciseCardWidget extends StatelessWidget {
  final ExerciseModel exercise;
  final VoidCallback onTap;

  const ExerciseCardWidget({
    Key? key,
    required this.exercise,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // استدعاء ملف الترجمة
    final l10n = AppLocalizations.of(context)!;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // صورة التمرين مع زر التشغيل
            Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                color: AppColors.darkCharcoal,
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  // تم التعديل هنا لـ NetworkImage عشان يقرأ الصور من النت
                  image: NetworkImage(exercise.imagePath), 
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.4),
                    BlendMode.darken,
                  ),
                ),
              ),
              child: const Center(
                child: Icon(Icons.play_circle_fill, color: AppColors.white, size: 28),
              ),
            ),
            const SizedBox(width: 16),
            
            // تفاصيل التمرين
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          // اسم التمرين يأتي من الـ API
                          exercise.name, 
                          style: AppTextStyles.addExCardTitle,
                        ),
                      ),
                      // شارة الذكاء الاصطناعي تظهر فقط إذا كان التمرين يدعمها
                      if (exercise.hasAiAnalysis) _buildAiBadge(l10n),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    // العضلات المستهدفة تأتي من الـ API
                    exercise.muscles,
                    style: AppTextStyles.body14NoHeight.copyWith(color: AppColors.textGrey),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    // التاجات (مثل Barbell, Compound) تأتي من الـ API
                    children: exercise.tags.map((tag) => _buildTag(tag)).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ويدجت الـ Badge (هنا نستخدم الـ Localization لأنها كلمة ثابتة)
  Widget _buildAiBadge(AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.lightBlueWhite,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.auto_awesome, color: AppColors.primary, size: 12),
          const SizedBox(width: 4),
          Text(
            // تم استخدام المفتاح الموجود في ملف الـ arb الخاص بك
            l10n.ai_analysis_badge, 
            style: AppTextStyles.addExTagMuscle,
          ),
        ],
      ),
    );
  }

  // ويدجت التاجات (الكلمات تأتي من الـ API مباشرة فلا نستخدم لها Localization)
  Widget _buildTag(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.surfaceColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label, // عرض النص القادم من الموديل مباشرة
        style: AppTextStyles.addExTagEquipment,
      ),
    );
  }
}