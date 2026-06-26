import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/coaching/models/workout_schedule_model.dart';

class CoachQuoteWidget extends StatelessWidget {
  const CoachQuoteWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.lightBlueWhite, // لون أزرق فاتح جداً
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.coachMarcus.toUpperCase(), style: AppTextStyles.label10Blue),
          const SizedBox(height: 12),
          Text(
            l10n.coachQuote,
            style: const TextStyle(
              color: AppColors.primaryDark,
              fontSize: 16,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w700,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class TodayWorkoutCard extends StatelessWidget {
  final WorkoutScheduleModel workout;
  const TodayWorkoutCard({Key? key, required this.workout}) : super(key: key);

  // Helper لجلب النصوص من اللوكليزيشن لو الباك إند باعت Keys
  String _getL10n(String key, AppLocalizations l10n) {
    Map<String, String> translations = {
      'mondayWorkout': l10n.mondayWorkout,
      'benchPress': l10n.benchPress,
      'setsReps1': l10n.setsReps1,
      'pullUps': l10n.pullUps,
      'setsReps2': l10n.setsReps2,
      'overheadPress': l10n.overheadPress,
      'setsReps3': l10n.setsReps3,
      'coachNoteText': l10n.coachNoteText,
    };
    return translations[key] ?? key;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final exercises = workout.payload?['exercises'] as List<dynamic>? ?? [];
    final coachNote = workout.payload?['coach_note'];

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [BoxShadow(color: AppColors.darkCharcoal5, blurRadius: 10, offset: Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(12)),
                child: Text(l10n.todayBadge, style: AppTextStyles.label10Grey.copyWith(color: AppColors.white)),
              ),
              const Icon(Icons.fitness_center, color: AppColors.primary),
            ],
          ),
          const SizedBox(height: 16),
          Text(_getL10n(workout.title, l10n), style: AppTextStyles.heading24.copyWith(fontWeight: FontWeight.w800)),
          const SizedBox(height: 20),
          
          // قائمة التمارين
          ...exercises.map((ex) => Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(width: 4, height: 35, decoration: BoxDecoration(color: AppColors.divider, borderRadius: BorderRadius.circular(2))),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(_getL10n(ex['name'], l10n), style: AppTextStyles.body16.copyWith(color: AppColors.darkCharcoal, fontWeight: FontWeight.w700)),
                        Text(_getL10n(ex['details'], l10n), style: AppTextStyles.caption12.copyWith(color: AppColors.textGrey)),
                      ],
                    ),
                  ],
                ),
              )),
              
          if (coachNote != null) ...[
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: AppColors.surfaceColor, borderRadius: BorderRadius.circular(12)),
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    Container(width: 4, color: AppColors.primary),
                    const SizedBox(width: 12),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          style: AppTextStyles.body14Height,
                          children: [
                            TextSpan(text: l10n.coachNoteLabel, style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.w700)),
                            TextSpan(text: _getL10n(coachNote, l10n)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
          
          const SizedBox(height: 24),
          Container(
            width: double.infinity,
            height: 56,
            decoration: BoxDecoration(gradient: AppColors.primaryGradient, borderRadius: BorderRadius.circular(28)),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, shadowColor: Colors.transparent),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.play_arrow, color: AppColors.white),
                  const SizedBox(width: 8),
                  Text(l10n.startWorkout, style: AppTextStyles.primaryButton18),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CompletedWorkoutCard extends StatelessWidget {
  final WorkoutScheduleModel workout;
  const CompletedWorkoutCard({Key? key, required this.workout}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final timeStr = workout.payload?['time'] == 'time45m' ? l10n.time45m : '45m';
    final bpmStr = workout.payload?['bpm'] == 'bpm112' ? l10n.bpm112 : '112 BPM';

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: AppColors.background, borderRadius: BorderRadius.circular(24)),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(color: AppColors.white, shape: BoxShape.circle),
            child: const Icon(Icons.check_circle, color: AppColors.textGrey, size: 28),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(l10n.yesterdayBadge, style: AppTextStyles.label10Grey.copyWith(letterSpacing: 1.5)),
                const SizedBox(height: 4),
                Text(l10n.sundayWorkout, style: AppTextStyles.cardTitle16),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.timer_outlined, size: 14, color: AppColors.textGrey),
                    const SizedBox(width: 4),
                    Text(timeStr, style: AppTextStyles.caption12.copyWith(color: AppColors.textGrey)),
                    const SizedBox(width: 16),
                    const Icon(Icons.favorite_border, size: 14, color: AppColors.textGrey),
                    const SizedBox(width: 4),
                    Text(bpmStr, style: AppTextStyles.caption12.copyWith(color: AppColors.textGrey)),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class OverdueWorkoutCard extends StatelessWidget {
  final WorkoutScheduleModel workout;
  const OverdueWorkoutCard({Key? key, required this.workout}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.errorLightBg, // Light Red
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.errorRed.withOpacity(0.2), style: BorderStyle.solid), 
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: AppColors.errorRed.withOpacity(0.1), shape: BoxShape.circle),
            child: const Icon(Icons.warning_rounded, color: AppColors.errorRed, size: 28),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(l10n.overdueBadge, style: AppTextStyles.label10Grey.copyWith(color: AppColors.errorRed, letterSpacing: 1.5)),
                const SizedBox(height: 4),
                Text(l10n.saturdayWorkout, style: AppTextStyles.cardTitle16),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.white,
              foregroundColor: AppColors.darkCharcoal,
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: Text(l10n.reschedule, style: const TextStyle(fontWeight: FontWeight.w700)),
          ),
        ],
      ),
    );
  }
}