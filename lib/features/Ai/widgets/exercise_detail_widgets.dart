import 'package:flutter/material.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/Ai/models/ai_exercise_detail_model.dart';

// 1. كارت الـ Core Cue
class CoreCueCard extends StatelessWidget {
  final InstructionItem cue;
  final IconData iconData;

  const CoreCueCard({Key? key, required this.cue, required this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.lightBlueWhite,
              shape: BoxShape.circle,
            ),
            child: Icon(iconData, color: AppColors.primary, size: 20),
          ),
          const SizedBox(height: 12),
          Text(cue.title, style: AppTextStyles.cardTitle14),
          const SizedBox(height: 4),
          Text(cue.description, style: AppTextStyles.cardSubtitle13),
        ],
      ),
    );
  }
}

// 2. ويدجت الـ Setup Guide (التايم لاين)
class SetupStepTile extends StatelessWidget {
  final InstructionItem step;
  final bool isLast;

  const SetupStepTile({Key? key, required this.step, this.isLast = false}) : super(key: key);

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
                border: Border.all(color: AppColors.primary, width: 3),
                color: AppColors.white,
              ),
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 60, // ارتفاع تقريبي للخط الفاصل
                color: AppColors.divider,
              ),
          ],
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(step.title, style: AppTextStyles.settingsItemTitle16),
                const SizedBox(height: 4),
                Text(step.description, style: AppTextStyles.body14Height),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// 3. كارت الأخطاء الشائعة
class CommonMistakeTile extends StatelessWidget {
  final MistakeItem mistake;

  const CommonMistakeTile({Key? key, required this.mistake}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            mistake.isCorrectWay ? Icons.check_circle : Icons.cancel,
            color: mistake.isCorrectWay ? AppColors.successGreen : AppColors.errorRed,
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(mistake.title, style: AppTextStyles.settingsItemTitle16),
                const SizedBox(height: 4),
                Text(mistake.description, style: AppTextStyles.body14Height),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 4. كارت الـ Pro Insight
class ProInsightCard extends StatelessWidget {
  final ProInsight insight;
  final String labelText; // "PRO INSIGHT"

  const ProInsightCard({Key? key, required this.insight, required this.labelText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.auto_awesome, color: AppColors.white, size: 16),
                  const SizedBox(width: 8),
                  Text(labelText, style: AppTextStyles.spotlightTag),
                ],
              ),
              const SizedBox(height: 16),
              Text(insight.title, style: AppTextStyles.dialogTitle24.copyWith(color: AppColors.white)),
              const SizedBox(height: 12),
              Text(insight.description, style: AppTextStyles.body14Height.copyWith(color: AppColors.white70)),
              const SizedBox(height: 16), // مساحة للزرار العائم
            ],
          ),
          Positioned(
            bottom: -40,
            right: -10,
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: AppColors.primaryLight, // أو أي لون مناسب للزر
              mini: true,
              elevation: 0,
              child: const Icon(Icons.add, color: AppColors.white),
            ),
          ),
        ],
      ),
    );
  }
}