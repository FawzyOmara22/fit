import 'package:flutter/material.dart'; // مسار ملف الـ L10n بتاعك
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/profile/models/year_review_model.dart';


class ReviewHeaderCard extends StatelessWidget {
  const ReviewHeaderCard({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.darkCharcoal5,
            blurRadius: 20,
            offset: const Offset(0, 10),
          )
        ],
      ),
      child: Column(
        children: [
          Text(l10n.eliteAchievements.toUpperCase(), style: AppTextStyles.label10Blue),
          const SizedBox(height: 8),
          Text(
            l10n.yearInReviewTitle,
            textAlign: TextAlign.center,
            style: AppTextStyles.heading36Black,
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.surfaceColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.bookmark, color: AppColors.primary, size: 16),
                const SizedBox(width: 8),
                Text(l10n.topLiftersBadge, style: AppTextStyles.caption12),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const StatCard({super.key, required this.icon, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.darkCharcoal5,
            blurRadius: 15,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.primaryLight, size: 28),
          const SizedBox(height: 16),
          Text(value, style: AppTextStyles.sumStatValue30),
          Text(label, style: AppTextStyles.sumStatTitle10),
        ],
      ),
    );
  }
}

class ConsistencySection extends StatelessWidget {
  final int streak;
  const ConsistencySection({super.key, required this.streak});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(l10n.consistency.toUpperCase(), style: AppTextStyles.profileConsistency18),
            Text('${l10n.dailyStreak} $streak', style: AppTextStyles.profileStreakLabel10.copyWith(color: AppColors.primary)),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(color: AppColors.darkCharcoal5, blurRadius: 15, offset: const Offset(0, 5))
            ],
          ),
          child: Column(
            children: [
              // Heatmap Mockup (Grid)
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 12,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                ),
                itemCount: 36, // Mockup boxes
                itemBuilder: (context, index) {
                  // Generate random opacity for realistic look
                  final opacities = [0.2, 0.4, 0.6, 0.8, 1.0];
                  final opacity = opacities[index % opacities.length];
                  return Container(
                    decoration: BoxDecoration(
                      color: index % 5 == 0 ? AppColors.surfaceColor : AppColors.primary.withOpacity(opacity),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  );
                },
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(l10n.jan, style: AppTextStyles.label10Grey),
                  Text(l10n.dec, style: AppTextStyles.label10Grey),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class MostImprovedSection extends StatelessWidget {
  final List<ImprovedLift> lifts;
  const MostImprovedSection({super.key, required this.lifts});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.mostImproved.toUpperCase(), style: AppTextStyles.profileConsistency18),
        const SizedBox(height: 16),
        ...lifts.map((lift) => Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(color: AppColors.darkCharcoal5, blurRadius: 10, offset: const Offset(0, 4))
            ],
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: AppColors.lightBlueWhite,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.trending_up, color: AppColors.primary, size: 20),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(lift.name, style: AppTextStyles.settingsItemTitle16),
                    Text(l10n.personalBest.toUpperCase(), style: AppTextStyles.label10Grey),
                  ],
                ),
              ),
              Text(lift.increase, style: AppTextStyles.cardTitle18.copyWith(color: AppColors.primary, fontWeight: FontWeight.w900)),
            ],
          ),
        )).toList(),
      ],
    );
  }
}

class TopLiftsSection extends StatelessWidget {
  final List<TopLift> topLifts;
  const TopLiftsSection({super.key, required this.topLifts});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.topLifts.toUpperCase(), style: AppTextStyles.profileConsistency18),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(color: AppColors.darkCharcoal5, blurRadius: 15, offset: const Offset(0, 5))
            ],
          ),
          child: Column(
            children: List.generate(topLifts.length, (index) {
              final lift = topLifts[index];
              return Padding(
                padding: EdgeInsets.only(bottom: index == topLifts.length - 1 ? 0 : 20),
                child: Row(
                  children: [
                    Text('0${index + 1}', style: AppTextStyles.sumStatValue30.copyWith(color: AppColors.borderGrey.withOpacity(0.5))),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(lift.name, style: AppTextStyles.settingsItemTitle16),
                              Text('${lift.reps} ${l10n.reps.toUpperCase()}', style: AppTextStyles.profileStatLabel10),
                            ],
                          ),
                          const SizedBox(height: 8),
                          LinearProgressIndicator(
                            value: lift.progress,
                            backgroundColor: AppColors.surfaceColor,
                            valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
                            minHeight: 6,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        )
      ],
    );
  }
}

class GradientShareButton extends StatelessWidget {
  final VoidCallback onTap;
  const GradientShareButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          gradient: AppColors.primaryGradient, // التدريج اللوني المطلوب
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.4),
              blurRadius: 20,
              offset: const Offset(0, 8),
            )
          ],
        ),
        child: Center(
          child: Text(
            l10n.shareMyYear.toUpperCase(),
            style: AppTextStyles.primaryButton16.copyWith(letterSpacing: 1.2),
          ),
        ),
      ),
    );
  }
}