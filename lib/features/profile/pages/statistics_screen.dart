import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/profile/models/statistics_model.dart';
import 'package:kinetic/features/profile/widgets/statistics_widgets.dart';

// ضيف مسار شاشة BodyProgressScreen هنا (عدل المسار لو الفولدر مختلف عندك)
import 'body_progress_screen.dart'; 

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({Key? key}) : super(key: key);

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  // داتا وهمية مطابقة للاسكرين
  final StatisticsModel data = StatisticsModel(
    totalVolumeTons: 412.5,
    volumeIncreasePercentage: 12,
    totalWorkouts: 142,
    totalReps: '12.4k',
    averagePerWeek: 4.2,
    isOnTrack: true,
    muscleSplit: {
      'CHEST': 25,
      'BACK': 20,
      'LEGS': 15,
      'ARMS': 10,
    },
  );

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.assessment_outlined, color: AppColors.primary),
        title: Text(l10n.statistics, style: AppTextStyles.trainAppBar20),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.share_outlined, color: AppColors.darkCharcoal),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: AppColors.darkCharcoal),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // التعديل هنا: ربط التوجل بار بشاشة BodyProgressScreen
            StatToggleBar(
              isTrainingActive: true, // إحنا حالياً في شاشة الـ Training
              onTrainingTap: () {}, // مش هنعمل حاجة لو داس عليها
              onBodyTap: () {
                // التوجيه لشاشة الـ Body بدون أنيميشن عشان تبان كأنها تاب
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) => const BodyProgressScreen(),
                    transitionDuration: Duration.zero, 
                  ),
                );
              },
            ),
            const SizedBox(height: 24),
            
            StatTotalVolumeCard(
              volume: data.totalVolumeTons, 
              percentage: data.volumeIncreasePercentage
            ),
            const SizedBox(height: 16),
            
            StatMiniCardsRow(
              workouts: data.totalWorkouts, 
              reps: data.totalReps
            ),
            const SizedBox(height: 32),
            
            const TrainingVolumeChart(),
            const SizedBox(height: 32),
            
            WorkoutFrequencyGrid(avgPerWeek: data.averagePerWeek),
            const SizedBox(height: 32),
            
            MuscleGroupSplit(data: data.muscleSplit),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}