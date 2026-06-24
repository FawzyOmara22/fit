import 'package:flutter/material.dart';
import 'package:kinetic/features/train/logic/train_provider.dart';
import 'package:provider/provider.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';


// ----------------------------------------------------
// الويدجت الخاصة بالـ Streak
// ----------------------------------------------------
class StreakCardWidget extends StatelessWidget {
  const StreakCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    // قراءة الداتا من البروفايدر
    final provider = context.watch<TrainProvider>();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.trainCurrentStreak, style: AppTextStyles.trainStreakLabel10),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text('${provider.currentStreak}', style: AppTextStyles.trainStreakValue60),
              const SizedBox(width: 4),
              Text(l10n.trainDays, style: AppTextStyles.trainStreakUnit20),
            ],
          ),
          const SizedBox(height: 4),
          Text('${l10n.trainBestStreak}: ${provider.bestStreak} ${l10n.trainDays}', style: AppTextStyles.trainStreakBest11),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(7, (index) {
              bool isActiveDay = provider.last7DaysActivity[index];
              return Expanded(
                child: Container(
                  margin: const EdgeInsets.only(right: 4),
                  height: 4,
                  decoration: BoxDecoration(
                    color: isActiveDay ? AppColors.primary : AppColors.lightGray,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}

// ----------------------------------------------------
// الويدجت الخاصة بالـ Volume
// ----------------------------------------------------
class VolumeCardWidget extends StatelessWidget {
  const VolumeCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final provider = context.watch<TrainProvider>();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(l10n.trainMonthlyVolume, style: AppTextStyles.trainVolumeLabel10),
              const Icon(Icons.bar_chart_rounded, color: AppColors.primary, size: 20),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 32, 
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _buildChartBar(12, false),
                _buildChartBar(20, false),
                _buildChartBar(14, false),
                _buildChartBar(24, false),
                _buildChartBar(32, true), 
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text('${provider.monthlyVolume}k', style: AppTextStyles.trainVolumeValue24),
              const SizedBox(width: 4),
              Text(l10n.trainLbs, style: AppTextStyles.trainVolumeUnit10),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChartBar(double height, bool isPrimary) {
    return Container(
      width: 8, 
      height: height,
      margin: const EdgeInsets.only(right: 6), 
      decoration: BoxDecoration(
        color: isPrimary ? AppColors.primary : AppColors.primary.withOpacity(0.15),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}