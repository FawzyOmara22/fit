import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';

// استدعاء الشاشات المرتبطة بالكارت
import '../pages/Exercise Options Bottom Sheet.dart'; // تأكد من اسم الملف عندك
import '../pages/ExerciseDetailScreen.dart';
import '../pages/rest_settings_screen.dart';
import '../pages/new_pr_screen.dart';

// استدعاء الموديلز
import '../data/models/session_exercise_model.dart';
import '../data/models/workout_set_model.dart';

class ActiveSessionExerciseCard extends StatelessWidget {
  final SessionExerciseModel sessionExercise;
  final VoidCallback? onHeaderTap; // 👈 ضفنا الدالة هنا عشان تستقبل الضغطة من الشاشة الرئيسية

  const ActiveSessionExerciseCard({
    Key? key,
    required this.sessionExercise,
    this.onHeaderTap, // 👈 ضفناها في الـ Constructor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final exercise = sessionExercise.exercise;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.divider),
      ),
      child: Column(
        children: [
          Row(
            children: [
              // 👇 1. تغليف الصورة فقط بالضغط
              GestureDetector(
                onTap: onHeaderTap,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(exercise.imageUrl, width: 64, height: 64, fit: BoxFit.cover),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // 👇 2. تغليف اسم التمرين فقط بالضغط
                        GestureDetector(
                          onTap: onHeaderTap,
                          child: Text(exercise.title, style: AppTextStyles.sessionExTitle20),
                        ),
                        // زرار الثلاث نقط (Options) شغال لوحده
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true, 
                              backgroundColor: Colors.transparent, 
                              builder: (context) {
                                return BackdropFilter(
                                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), 
                                  child: ExerciseOptionsBottomSheet(
                                    exerciseName: exercise.title, 
                                    imageUrl: exercise.imageUrl,  
                                  ),
                                );
                              },
                            );
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Icon(Icons.more_horiz, color: AppColors.iconGrey),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const RestSettingsScreen()),
                            );
                          },
                          child: Row(
                            children: [
                              const Icon(Icons.timer_outlined, color: AppColors.primary, size: 14),
                              const SizedBox(width: 4),
                              Text(sessionExercise.restTime, style: AppTextStyles.sessionExRest12),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(exercise.muscle, style: AppTextStyles.sessionExMuscle12),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(flex: 1, child: Text(l10n.sessionSet, style: AppTextStyles.sessionTableHead10)),
              Expanded(flex: 2, child: Text(l10n.sessionPrevious, textAlign: TextAlign.center, style: AppTextStyles.sessionTableHead10)),
              Expanded(flex: 1, child: Text(l10n.sessionKg, textAlign: TextAlign.center, style: AppTextStyles.sessionTableHead10)),
              Expanded(flex: 1, child: Text(l10n.sessionReps, textAlign: TextAlign.center, style: AppTextStyles.sessionTableHead10)),
              const SizedBox(width: 32),
            ],
          ),
          const SizedBox(height: 12),
          ...sessionExercise.sets.map((set) => _buildSetRow(context, set)),
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(color: AppColors.inputBackground, borderRadius: BorderRadius.circular(12)),
            child: Text(l10n.sessionAddSet, textAlign: TextAlign.center, style: AppTextStyles.sessionAddSet14),
          ),
        ],
      ),
    );
  }

  Widget _buildSetRow(BuildContext context, WorkoutSetModel setModel) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      decoration: BoxDecoration(
        color: setModel.isCompleted ? AppColors.successLightBg : AppColors.inputBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Row(
              children: [
                if (setModel.isCurrent) Container(width: 4, height: 24, margin: const EdgeInsets.only(right: 8), decoration: BoxDecoration(color: AppColors.warningYellow, borderRadius: BorderRadius.circular(2))),
                Text(setModel.num, style: AppTextStyles.sessionSetNum14),
                if (setModel.isCurrent) 
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const NewPersonalRecordScreen()),
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(left: 4), 
                      child: Icon(Icons.star, color: AppColors.warningYellow, size: 14),
                    ),
                  ),
              ],
            ),
          ),
          Expanded(flex: 2, child: Text(setModel.prev, textAlign: TextAlign.center, style: AppTextStyles.sessionPrev12)),
          Expanded(flex: 1, child: Text(setModel.kg, textAlign: TextAlign.center, style: setModel.isCompleted ? AppTextStyles.sessionInput14 : AppTextStyles.sessionInputHint14)),
          Expanded(flex: 1, child: Text(setModel.reps, textAlign: TextAlign.center, style: setModel.isCompleted ? AppTextStyles.sessionInput14 : AppTextStyles.sessionInputHint14)),
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: setModel.isCompleted ? AppColors.successGreen : AppColors.white,
              shape: BoxShape.circle,
              border: setModel.isCompleted ? null : Border.all(color: AppColors.divider),
            ),
            child: setModel.isCompleted ? const Icon(Icons.check, color: AppColors.white, size: 18) : null,
          )
        ],
      ),
    );
  }
}