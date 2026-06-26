import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/coaching/models/session_review_model.dart';
import 'package:kinetic/features/coaching/provider/session_review_provider.dart';




// ==========================================
// 1. Header Widget 
// ==========================================
class HeaderWidget extends StatelessWidget {
  final SessionReviewModel data;
  const HeaderWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            const CircleAvatar(
              radius: 32,
              backgroundImage: NetworkImage('https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?auto=format&fit=crop&w=200&q=80'),
              backgroundColor: AppColors.surfaceColor,
            ),
            Container(
              decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.white),
              padding: const EdgeInsets.all(2),
              child: const Icon(Icons.verified, color: AppColors.primary, size: 20),
            )
          ],
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.clientName, 
              style: AppTextStyles.cardTitle18.copyWith(
                fontWeight: FontWeight.w900, 
                fontSize: 18,
                letterSpacing: -0.5,
              )
            ),
            const SizedBox(height: 4),
            Text(
              data.programName.toUpperCase(), 
              style: AppTextStyles.label10Blue.copyWith(
                fontWeight: FontWeight.w800,
                letterSpacing: 1.2,
              )
            ),
          ],
        )
      ],
    );
  }
}

// ==========================================
// 2. Stats Row Widget 
// ==========================================
class StatsRowWidget extends StatelessWidget {
  final SessionReviewModel data;
  const StatsRowWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _statCard(l10n.duration, '${data.durationMins}', suffix: 'm'),
        _statCard(l10n.volume, '${data.volumeK}', suffix: 'k'),
        _statCard(l10n.vs_avg, '${data.avgRpe}', isHighlighted: true),
      ],
    );
  }

  Widget _statCard(String label, String value, {String? suffix, bool isHighlighted = false}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(color: AppColors.darkCharcoal.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4))
          ]
        ),
        child: Column(
          children: [
            Text(
              label.toUpperCase(), 
              style: AppTextStyles.label10GreyDark.copyWith(
                fontWeight: FontWeight.w800,
                letterSpacing: 1.5,
                fontSize: 11,
              )
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  value, 
                  style: TextStyle(
                    color: isHighlighted ? AppColors.primary : AppColors.darkCharcoal,
                    fontSize: 28,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w900,
                    letterSpacing: -1.0,
                  ),
                ),
                if (suffix != null)
                  Text(
                    suffix,
                    style: const TextStyle(
                      color: AppColors.textGrey,
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                    ),
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 3. Volume Trend Widget 
// ==========================================
class VolumeTrendWidget extends StatelessWidget {
  final SessionReviewModel data;
  const VolumeTrendWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      decoration: BoxDecoration(
        color: AppColors.white, 
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.volumeTrend.toUpperCase(), 
                style: AppTextStyles.label10GreyDark.copyWith(
                  fontWeight: FontWeight.w800, 
                  letterSpacing: 1.5
                )
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Text(
                    '+${data.volumeTrendPercentage.toInt()}%', 
                    style: const TextStyle(
                      color: AppColors.darkCharcoal, 
                      fontSize: 26, 
                      fontWeight: FontWeight.w900, 
                      fontFamily: 'Inter',
                      letterSpacing: -1.0,
                    )
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(color: AppColors.lightBlueWhite, borderRadius: BorderRadius.circular(6)),
                    child: Text(l10n.vsAvg, style: AppTextStyles.label10Blue.copyWith(fontWeight: FontWeight.w800)),
                  )
                ],
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _chartBar(30, AppColors.lightBlueWhite80),
              _chartBar(25, AppColors.lightBlueWhite80),
              _chartBar(40, AppColors.lightBlueWhite80),
              _chartBar(20, AppColors.lightBlueWhite80),
              _chartBar(50, AppColors.primary),
            ],
          )
        ],
      ),
    );
  }

  Widget _chartBar(double height, Color color) {
    return Container(
      width: 14,
      height: height,
      margin: const EdgeInsets.only(left: 6),
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(4)),
    );
  }
}

// ==========================================
// 4. Performance Log Widget 
// ==========================================
class PerformanceLogWidget extends StatelessWidget {
  final SessionReviewModel data;
  const PerformanceLogWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              l10n.performanceLog, 
              style: AppTextStyles.cardTitle18.copyWith(fontWeight: FontWeight.w900)
            ),
            const Icon(Icons.filter_list, color: AppColors.darkCharcoal, size: 24),
          ],
        ),
        const SizedBox(height: 16),
        ...data.exercises.map((ex) => _buildExerciseCard(context, ex, l10n)).toList(),
      ],
    );
  }

  Widget _buildExerciseCard(BuildContext context, ExerciseModel exercise, dynamic l10n) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            exercise.name, 
            style: AppTextStyles.cardTitle16.copyWith(fontWeight: FontWeight.w900, fontSize: 17)
          ),
          if (exercise.isPrAchieved) ...[
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(color: AppColors.prBg, borderRadius: BorderRadius.circular(8)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.emoji_events, color: AppColors.prText, size: 14),
                  const SizedBox(width: 6),
                  Text(
                    l10n.prSetAchieved, 
                    style: AppTextStyles.prCardLabel10.copyWith(color: AppColors.prText, fontWeight: FontWeight.w800, letterSpacing: 1.0)
                  ),
                ],
              ),
            ),
          ],
          const SizedBox(height: 16),
          ...exercise.sets.map((set) => _buildSetRow(set)).toList(),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            decoration: BoxDecoration(color: AppColors.inputBackground, borderRadius: BorderRadius.circular(16)),
            child: TextField(
              decoration: InputDecoration(
                hintText: l10n.addSpecificFeedback,
                hintStyle: AppTextStyles.caption12.copyWith(color: AppColors.hintColor, fontWeight: FontWeight.w500),
                border: InputBorder.none,
              ),
              style: AppTextStyles.body14NoHeight.copyWith(fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSetRow(SetModel set) {
    final isPr = set.isPr;
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: isPr ? AppColors.lightBlueWhite : AppColors.surfaceColor,
        borderRadius: BorderRadius.circular(12),
        border: isPr ? Border.all(color: AppColors.primary10, width: 1.5) : null,
      ),
      child: Row(
        children: [
          Text(
            '0${set.setNumber}', 
            style: AppTextStyles.body14NoHeight.copyWith(fontWeight: FontWeight.w700, color: AppColors.textGrey)
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Row(
              children: [
                Text(
                  '${set.weight.toInt()}kg × ${set.reps}', 
                  style: TextStyle(
                    color: isPr ? AppColors.primary : AppColors.darkCharcoal,
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Inter',
                  )
                ),
                if (isPr) ...[
                  const SizedBox(width: 8),
                  const Icon(Icons.star, color: AppColors.primary, size: 16),
                ]
              ],
            ),
          ),
          Text(
            'RPE ${set.rpe.toInt()}', 
            style: TextStyle(
              color: isPr ? AppColors.primary : AppColors.textGrey,
              fontSize: 13,
              fontWeight: FontWeight.w800,
              fontFamily: 'Inter',
            )
          ),
        ],
      ),
    );
  }
}

// ==========================================
// 5. Coach Insights Widget
// ==========================================
class CoachInsightsWidget extends StatelessWidget {
  final SessionReviewModel data;
  const CoachInsightsWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: AppColors.insightBg, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.coachInsights.toUpperCase(), style: AppTextStyles.insightTitle.copyWith(fontWeight: FontWeight.w900, letterSpacing: 1.5)),
          const SizedBox(height: 16),
          ...data.insights.map((insight) {
            IconData icon = insight.type == 'trend' ? Icons.trending_up : Icons.access_time;
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(icon, color: AppColors.insightIconBg, size: 18),
                  const SizedBox(width: 12),
                  Expanded(child: Text(insight.text, style: AppTextStyles.insightBody.copyWith(fontWeight: FontWeight.w600))),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}

// ==========================================
// 6. Feedback Card Widget
// ==========================================
class FeedbackCardWidget extends StatelessWidget {
  final SessionReviewProvider provider;
  const FeedbackCardWidget({Key? key, required this.provider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.feedbackSummary, style: AppTextStyles.cardTitle16.copyWith(fontWeight: FontWeight.w900)),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: AppColors.surfaceColor, borderRadius: BorderRadius.circular(16)),
            child: TextField(
              controller: provider.feedbackController,
              maxLines: 4,
              decoration: const InputDecoration(border: InputBorder.none),
              style: AppTextStyles.body14Height.copyWith(fontWeight: FontWeight.w500, color: AppColors.darkCharcoal),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              SizedBox(
                height: 24,
                width: 24,
                child: Checkbox(
                  value: provider.isCriticalReview,
                  activeColor: AppColors.primary,
                  onChanged: provider.toggleCriticalReview,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                ),
              ),
              const SizedBox(width: 12),
              Text(l10n.flag_as_critical, style: AppTextStyles.body14WithHeight.copyWith(fontWeight: FontWeight.w700, color: AppColors.darkCharcoal)),
            ],
          ),
          const SizedBox(height: 24),
          InkWell(
            onTap: provider.isSubmitting ? null : () async {
              bool success = await provider.submitReview();
              if (success && context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Sent Successfully!')));
              }
            },
            borderRadius: BorderRadius.circular(28),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 18),
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(28),
                boxShadow: [
                  BoxShadow(color: AppColors.primary.withOpacity(0.3), blurRadius: 12, offset: const Offset(0, 6))
                ]
              ),
              child: provider.isSubmitting 
                ? const Center(child: SizedBox(height: 24, width: 24, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 3)))
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(l10n.sendToClient, style: AppTextStyles.primaryButton16.copyWith(fontWeight: FontWeight.w900, fontSize: 17)),
                      const SizedBox(width: 8),
                      const Icon(Icons.send, color: Colors.white, size: 20),
                    ],
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// 7. Bottom Actions Widget
// ==========================================
class BottomActionsWidget extends StatelessWidget {
  const BottomActionsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      children: [
        _actionTile(Icons.chat_bubble_outline, "${l10n.messageClient} Marcus"),
        const SizedBox(height: 12),
        _actionTile(Icons.tune, l10n.suggestAdjustment),
      ],
    );
  }

  Widget _actionTile(IconData icon, String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary, size: 22),
          const SizedBox(width: 16),
          Expanded(child: Text(title, style: AppTextStyles.cardTitle14.copyWith(fontWeight: FontWeight.w800, fontSize: 15))),
          const Icon(Icons.chevron_right, color: AppColors.iconGrey),
        ],
      ),
    );
  }
}