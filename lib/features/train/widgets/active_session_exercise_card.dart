import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:kinetic/features/train/logic/workout_provider.dart';
import 'package:provider/provider.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';

// استدعاء الشاشات المرتبطة بالكارت
import '../pages/Exercise Options Bottom Sheet.dart'; 
import '../pages/rest_settings_screen.dart';
import '../pages/new_pr_screen.dart';

// استدعاء الموديلز
import '../data/models/session_exercise_model.dart';
import '../data/models/workout_set_model.dart';


class ActiveSessionExerciseCard extends StatefulWidget {
  final SessionExerciseModel sessionExercise;
  final VoidCallback? onHeaderTap; 
  final Function(int)? onRestStarted;

  const ActiveSessionExerciseCard({
    Key? key,
    required this.sessionExercise,
    this.onHeaderTap,
    this.onRestStarted, 
  }) : super(key: key);

  @override
  State<ActiveSessionExerciseCard> createState() => _ActiveSessionExerciseCardState();
}

class _ActiveSessionExerciseCardState extends State<ActiveSessionExerciseCard> {
  late List<WorkoutSetModel> currentSets;

  @override
  void initState() {
    super.initState();
    currentSets = List.from(widget.sessionExercise.sets);
  }

  void _addNewSet() {
    setState(() {
      currentSets.add(
        WorkoutSetModel(
          id: DateTime.now().millisecondsSinceEpoch.toString(), 
          num: (currentSets.length + 1).toString(),
          prev: '-', 
          kg: '', 
          reps: '',
          isCompleted: false,
          isCurrent: false,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final exercise = widget.sessionExercise.exercise;
    final workoutProvider = context.watch<WorkoutProvider>();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.divider),
      ),
      child: Column(
        children: [
          // ============ الهيدر (صورة واسم التمرين) ============
          Row(
            children: [
              GestureDetector(
                onTap: widget.onHeaderTap,
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
                        GestureDetector(
                          onTap: widget.onHeaderTap,
                          child: Text(exercise.title, style: AppTextStyles.sessionExTitle20),
                        ),
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
                              Text(workoutProvider.formattedDefaultRestTime, style: AppTextStyles.sessionExRest12),
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

          // ============ جدول المجموعات (Sets) ============
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
          
          ...currentSets.map((set) => _buildSetRow(context, set)).toList(),
          
          const SizedBox(height: 12),
          
          GestureDetector(
            onTap: _addNewSet,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(color: AppColors.inputBackground, borderRadius: BorderRadius.circular(12)),
              child: Text(l10n.sessionAddSet, textAlign: TextAlign.center, style: AppTextStyles.sessionAddSet14),
            ),
          ),
        ],
      ),
    );
  }

  // ============ تصميم صف المجموعة (Row) ============
  Widget _buildSetRow(BuildContext context, WorkoutSetModel setModel) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        color: setModel.isCompleted ? AppColors.successLightBg : AppColors.inputBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // الرقم
          Expanded(
            flex: 1,
            child: Row(
              children: [
                // 👇 التعديل الجديد: الخط الذهبي بيظهر بس لما المجموعة تخلص (isCompleted)
                if (setModel.isCompleted) 
                  Container(
                    width: 4, 
                    height: 24, 
                    margin: const EdgeInsets.only(right: 8), 
                    decoration: BoxDecoration(color: AppColors.warningYellow, borderRadius: BorderRadius.circular(2)),
                  ),
                
                Text(setModel.num, style: AppTextStyles.sessionSetNum14),
                
                // 👇 التعديل الجديد: النجمة الذهبى بتظهر برضه لما المجموعة تخلص (isCompleted)
                if (setModel.isCompleted) 
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const NewPersonalRecordScreen()));
                    },
                    child: const Padding(padding: EdgeInsets.only(left: 4), child: Icon(Icons.star, color: AppColors.warningYellow, size: 14)),
                  ),
              ],
            ),
          ),
          // السابق
          Expanded(flex: 2, child: Text(setModel.prev, textAlign: TextAlign.center, style: AppTextStyles.sessionPrev12)),
          
          // حقل الـ KG
          Expanded(
            flex: 1, 
            child: TextFormField(
              initialValue: setModel.kg,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              enabled: !setModel.isCompleted, 
              style: setModel.isCompleted ? AppTextStyles.sessionInput14 : AppTextStyles.sessionInputHint14.copyWith(color: AppColors.darkCharcoal),
              decoration: const InputDecoration(border: InputBorder.none, isDense: true, contentPadding: EdgeInsets.zero),
              onChanged: (val) => setModel.kg = val,
            ),
          ),
          
          // حقل الـ Reps
          Expanded(
            flex: 1, 
            child: TextFormField(
              initialValue: setModel.reps,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              enabled: !setModel.isCompleted,
              style: setModel.isCompleted ? AppTextStyles.sessionInput14 : AppTextStyles.sessionInputHint14.copyWith(color: AppColors.darkCharcoal),
              decoration: const InputDecoration(border: InputBorder.none, isDense: true, contentPadding: EdgeInsets.zero),
              onChanged: (val) => setModel.reps = val,
            ),
          ),
          
          // زر علامة الصح (تشغيل / إيقاف التايمر واللوجيك)
          GestureDetector(
            onTap: () {
              setState(() {
                setModel.isCompleted = !setModel.isCompleted;
              });
              
              if (setModel.isCompleted) {
                // 1. لو عمل صح -> بنشغل التايمر التنازلي للراحة
                if (widget.onRestStarted != null) {
                  int restSeconds = context.read<WorkoutProvider>().defaultRestSeconds;
                  widget.onRestStarted!(restSeconds);
                }
              } else {
                // 2. 👇 التعديل الجديد: لو شال علامة الصح (ضغط بالغلط) بنقفل التايمر فوراً ونخفي الشريط السفلي
                context.read<WorkoutProvider>().stopRestTimer();
              }
            },
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: setModel.isCompleted ? AppColors.successGreen : AppColors.white,
                shape: BoxShape.circle,
                border: setModel.isCompleted ? null : Border.all(color: AppColors.divider),
              ),
              child: setModel.isCompleted ? const Icon(Icons.check, color: AppColors.white, size: 18) : null,
            ),
          )
        ],
      ),
    );
  }
}