import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/Ai/models/ai_hub_model_result.dart';

// 1. كارت الملخص الأسبوعي (Weekly Summary Card)
class WeeklySummaryCardWidget extends StatelessWidget {
  final String trend;
  final int rank;
  final List<double> chartData;

  const WeeklySummaryCardWidget({Key? key, required this.trend, required this.rank, required this.chartData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(color: AppColors.primaryLight.withOpacity(0.05), blurRadius: 20, offset: const Offset(0, 10)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(l10n.editorial_analysis, style: AppTextStyles.label10Grey),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(color: AppColors.primaryLight.withOpacity(0.2), borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    const Icon(Icons.trending_up, color: AppColors.primary, size: 14),
                    const SizedBox(width: 4),
                    Text(trend, style: AppTextStyles.body14NoHeight.copyWith(color: AppColors.primary, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: 200, 
            child: Text(l10n.weekly_technique_summary, style: AppTextStyles.heading24.copyWith(fontWeight: FontWeight.w900, height: 1.1)),
          ),
          const SizedBox(height: 24),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: chartData.asMap().entries.map((entry) {
                  int idx = entry.key;
                  double height = entry.value;
                  bool isLastTwo = idx >= chartData.length - 2;
                  return Container(
                    margin: const EdgeInsets.only(right: 6),
                    width: 16,
                    height: height,
                    decoration: BoxDecoration(
                      color: isLastTwo ? AppColors.primary : AppColors.surfaceColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  );
                }).toList(),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(l10n.global_rank, style: AppTextStyles.label10Grey.copyWith(letterSpacing: 1)),
                  Text("$rank", style: AppTextStyles.timerHuge80.copyWith(fontSize: 40, color: AppColors.primary, height: 1.0)),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

// 2. زر الفلترة (Filter Chip)
class HubFilterChipWidget extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const HubFilterChipWidget({Key? key, required this.label, required this.isSelected, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.surfaceColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          label,
          style: AppTextStyles.body14NoHeight.copyWith(
            color: isSelected ? AppColors.white : AppColors.darkCharcoal,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

// 3. كارت التمرين (Chronological Check Card)
class ChronologicalCheckCardWidget extends StatelessWidget {
  final CheckItemModel checkItem;

  const ChronologicalCheckCardWidget({Key? key, required this.checkItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    String getStatusText(String key) {
      if (key == 'elite') return l10n.status_elite;
      if (key == 'needs_work') return l10n.status_needs_work;
      return l10n.status_good;
    }

    Color getStatusColor(String key) {
      if (key == 'elite') return AppColors.primary;
      if (key == 'needs_work') return AppColors.errorRed;
      return AppColors.darkCharcoal;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(image: NetworkImage(checkItem.imageUrl), fit: BoxFit.cover),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Center(
                child: Icon(Icons.play_circle_outline, color: Colors.white, size: 28),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(checkItem.exerciseName, style: AppTextStyles.title18Dark.copyWith(fontSize: 16)),
                const SizedBox(height: 4),
                // تم التعديل هنا: استدعاء التنسيق بالكامل من ملف الترجمة مباشرة وبشكل نظيف
                Text(
                  l10n.sets_analyzed_format(checkItem.dateString, checkItem.setsCount),
                  style: AppTextStyles.caption12.copyWith(color: AppColors.textGrey, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                getStatusText(checkItem.statusKey),
                style: AppTextStyles.label10Grey.copyWith(color: getStatusColor(checkItem.statusKey), fontWeight: FontWeight.w900),
              ),
              // تم التعديل هنا: النسبة المئوية تخرج من ملف الترجمة بالكامل
              Text(
                l10n.score_format(checkItem.score),
                style: AppTextStyles.heading24.copyWith(fontSize: 24, fontWeight: FontWeight.w900),
              ),
            ],
          )
        ],
      ),
    );
  }
}