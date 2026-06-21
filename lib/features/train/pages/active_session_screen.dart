import 'dart:ui';
import 'dart:async'; // 👈 ضروري عشان الـ Timer
import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/features/Ai/pages/Exercise%20Detail%20Screen.dart';

// استدعاء الصفحات
import 'package:kinetic/features/train/pages/AddExerciseScreen.dart';
import 'package:kinetic/features/train/pages/session_summary_screen.dart';


import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

// استدعاء الموديلز و Widget الكارت
import '../data/models/exercise_model.dart';
import '../data/models/workout_set_model.dart';
import '../data/models/session_exercise_model.dart';
import '../widgets/active_session_exercise_card.dart';

class ActiveSessionScreen extends StatefulWidget {
  const ActiveSessionScreen({Key? key}) : super(key: key);

  @override
  State<ActiveSessionScreen> createState() => _ActiveSessionScreenState();
}

class _ActiveSessionScreenState extends State<ActiveSessionScreen> {
  // ================= العدادات (Timers) =================
  Timer? _mainTimer;
  int _mainSeconds = 0; // العداد الأساسي بيبدأ من صفر

  Timer? _restTimer;
  int _restSeconds = 0; // عداد الراحة
  
  // ================= الداتا =================
  final List<SessionExerciseModel> _activeExercises = [
    SessionExerciseModel(
      id: 's1',
      restTime: '2:00 Rest',
      exercise: ExerciseModel(
        id: '1', title: 'Barbell Squat', muscle: 'Quadriceps', equipment: 'Barbell', 
        imageUrl: 'https://images.unsplash.com/photo-1534438327276-14e5300c3a48?q=80&w=200&auto=format&fit=crop',
      ),
      sets: [
        WorkoutSetModel(id: 'set1', num: '1', prev: '100kg x 8', kg: '110', reps: '8', isCompleted: true, isCurrent: true),
        WorkoutSetModel(id: 'set2', num: '2', prev: '100kg x 8', kg: '105', reps: '8', isCompleted: false, isCurrent: false),
      ],
    ),
    SessionExerciseModel(
      id: 's2',
      restTime: '1:30 Rest',
      exercise: ExerciseModel(
        id: '2', title: 'Bench Press', muscle: 'Chest', equipment: 'Barbell', 
        imageUrl: 'https://images.unsplash.com/photo-1571019614242-c5c5dee9f50b?q=80&w=200&auto=format&fit=crop',
      ),
      sets: [
        WorkoutSetModel(id: 'set3', num: '1', prev: '80kg x 10', kg: '80', reps: '10', isCompleted: false, isCurrent: false),
      ],
    ),
  ];

  @override
  void initState() {
    super.initState();
    _startMainTimer(); // تشغيل العداد الأساسي أول ما الصفحة تفتح
  }

  @override
  void dispose() {
    _mainTimer?.cancel();
    _restTimer?.cancel();
    super.dispose();
  }

  // 👈 دالة العداد الأساسي
  void _startMainTimer() {
    _mainTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _mainSeconds++;
      });
    });
  }

  // 👈 دالة عداد الراحة (بتشتغل لما ندوس صح في الكارت)
  void _startRestTimer(int seconds) {
    _restTimer?.cancel(); // نوقف أي عداد قديم
    setState(() {
      _restSeconds = seconds;
    });
    
    _restTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_restSeconds > 0) {
        setState(() {
          _restSeconds--;
        });
      } else {
        timer.cancel(); // العداد خلص
      }
    });
  }

  // 👈 دوال تنسيق الوقت لشكل جميل (00:00:00)
  String _formatMainTime(int totalSeconds) {
    int h = totalSeconds ~/ 3600;
    int m = (totalSeconds % 3600) ~/ 60;
    int s = totalSeconds % 60;
    return '${h.toString().padLeft(2, '0')}:${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }

  String _formatRestTime(int totalSeconds) {
    int m = totalSeconds ~/ 60;
    int s = totalSeconds % 60;
    return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.sessionBg,
      appBar: _buildAppBar(context, l10n),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                _buildHeader(l10n),
                const SizedBox(height: 24),
                
                // عرض الكروت وتمرير دالة الراحة
                ..._activeExercises.map((sessionEx) => Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: ActiveSessionExerciseCard(
                    sessionExercise: sessionEx,
                    onHeaderTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const ExerciseDetailScreen()));
                    },
                    // 👈 بنستقبل وقت الراحة من الكارت ونشغل العداد
                    onRestStarted: (restDuration) {
                      _startRestTimer(restDuration);
                    },
                  ),
                )).toList(),
                
                _buildAddExerciseButton(context, l10n),
                
                const SizedBox(height: 120),
              ],
            ),
          ),
          
          // 👈 شريط الراحة السفلي بيظهر بس لو العداد أكبر من صفر
          if (_restSeconds > 0)
            Align(
              alignment: Alignment.bottomCenter,
              child: _buildFloatingRestTimer(l10n),
            ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context, AppLocalizations l10n) {
    return AppBar(
      backgroundColor: AppColors.sessionBg,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.close, color: AppColors.textGrey),
        onPressed: () => _showDiscardDialog(context, l10n),
      ),
      title: Column(
        children: [
          Text(_formatMainTime(_mainSeconds), style: AppTextStyles.sessionTime18), // 👈 العداد الأساسي لايف
          Text(l10n.sessionActive, style: AppTextStyles.sessionActive10),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16, top: 10, bottom: 10),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SessionSummaryScreen()));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              elevation: 0,
            ),
            child: Text(l10n.sessionFinish, style: AppTextStyles.sessionFinish14),
          ),
        )
      ],
    );
  }

  Widget _buildHeader(AppLocalizations l10n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.sessionMorning, style: AppTextStyles.sessionMorning11),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: l10n.sessionLegDay, style: AppTextStyles.sessionTitle36),
                  TextSpan(text: l10n.sessionFocus, style: AppTextStyles.sessionFocus36),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text('842', style: AppTextStyles.sessionKcal24),
                Text(l10n.sessionKcal, style: AppTextStyles.sessionKcalLabel10),
              ],
            )
          ],
        ),
      ],
    );
  }

  Widget _buildAddExerciseButton(BuildContext context, AppLocalizations l10n) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const AddExerciseScreen()));
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(color: AppColors.inputBackground, borderRadius: BorderRadius.circular(24)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(l10n.sessionAddExercise, style: AppTextStyles.sessionAddEx18),
            Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
              child: const Icon(Icons.add, color: AppColors.white, size: 16),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildFloatingRestTimer(AppLocalizations l10n) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24, left: 40, right: 40),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(40),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.hourglass_empty, color: AppColors.restPurple, size: 20),
          const SizedBox(width: 12),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(l10n.sessionResting, style: AppTextStyles.sessionResting14),
              Text('${l10n.sessionNextSet}2', style: AppTextStyles.sessionNextSet10),
            ],
          ),
          const SizedBox(width: 32),
          Text(_formatRestTime(_restSeconds), style: AppTextStyles.sessionRestTime20), // 👈 العداد التنازلي لايف
          const SizedBox(width: 12),
          GestureDetector(
            onTap: () {
              // لو عايز يعمل Skip للراحة
              setState(() {
                _restTimer?.cancel();
                _restSeconds = 0;
              });
            },
            child: const Icon(Icons.skip_next, color: Colors.white, size: 24),
          ),
        ],
      ),
    );
  }

  void _showDiscardDialog(BuildContext context, AppLocalizations l10n) {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierLabel: "DiscardDialog",
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (ctx, anim1, anim2) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Dialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            backgroundColor: AppColors.white,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(color: AppColors.discardIconBg, shape: BoxShape.circle),
                    child: const Icon(Icons.warning_amber_rounded, color: AppColors.discardBtnRed, size: 32),
                  ),
                  const SizedBox(height: 20),
                  Text(l10n.dialogDiscardTitle, style: AppTextStyles.dialogTitle24),
                  const SizedBox(height: 12),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: l10n.dialogDiscardBody1, style: AppTextStyles.dialogBody16),
                        TextSpan(text: l10n.dialogDiscardBodyBold, style: AppTextStyles.dialogBodyBold16),
                        TextSpan(text: l10n.dialogDiscardBody2, style: AppTextStyles.dialogBody16),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.of(ctx).pop(); 
                        Navigator.of(context).pop(); 
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.discardBtnRed,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                        elevation: 0,
                      ),
                      icon: const Icon(Icons.delete_outline, color: Colors.white, size: 20),
                      label: Text(l10n.dialogBtnDiscard, style: AppTextStyles.dialogBtnRed16),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(ctx).pop(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.keepTrainingBg,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                        elevation: 0,
                      ),
                      child: Text(l10n.dialogBtnKeepTraining, style: AppTextStyles.dialogBtnGray16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}