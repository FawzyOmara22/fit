import 'package:flutter/material.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';


// 1. كارت الـ Core Cues (الـ 4 مربعات)
class CoreCueCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const CoreCueCard({Key? key, required this.title, required this.description, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.dividerGrey), // تم استخدام اللون من ملفك
        boxShadow: [
          BoxShadow(color: AppColors.darkCharcoal5, blurRadius: 4, offset: const Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(color: AppColors.cardSelectedBg, shape: BoxShape.circle),
            child: Icon(icon, color: AppColors.primary, size: 16),
          ),
          const SizedBox(height: 12),
          Text(title, style: AppTextStyles.addExCardTitle.copyWith(fontSize: 14)),
          const SizedBox(height: 4),
          Text(description, style: AppTextStyles.body14NoHeight.copyWith(fontSize: 11)),
        ],
      ),
    );
  }
}

// 2. تصميم الـ Setup Guide (خطوات الـ Timeline)
class SetupStepTile extends StatelessWidget {
  final String title;
  final String description;
  final bool isFirst;
  final bool isLast;

  const SetupStepTile({Key? key, required this.title, required this.description, this.isFirst = false, this.isLast = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: isFirst ? AppColors.primary : AppColors.borderGrey, width: 3),
                color: AppColors.white,
              ),
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 50,
                color: AppColors.dividerGrey,
              ),
          ],
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.addExCardTitle),
                const SizedBox(height: 4),
                Text(description, style: AppTextStyles.body14Height),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// 3. تصميم الأخطاء الشائعة (علامة الصح والغلط)
class MistakeTile extends StatelessWidget {
  final String title;
  final String description;
  final bool isCorrect;

  const MistakeTile({Key? key, required this.title, required this.description, required this.isCorrect}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            isCorrect ? Icons.check_circle : Icons.cancel,
            color: isCorrect ? AppColors.successGreen : AppColors.errorRed,
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.addExCardTitle.copyWith(fontSize: 14)),
                const SizedBox(height: 4),
                Text(description, style: AppTextStyles.body14Height.copyWith(fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}