import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';

// ==========================================
// 1. Custom Toggle Bar (Training / Body) - تم التعديل لتكون ديناميكية
// ==========================================
class StatToggleBar extends StatelessWidget {
  final bool isTrainingActive;
  final VoidCallback onTrainingTap;
  final VoidCallback onBodyTap;

  const StatToggleBar({
    Key? key,
    required this.isTrainingActive,
    required this.onTrainingTap,
    required this.onBodyTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.inputBackground,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: onTrainingTap,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: isTrainingActive ? AppColors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(26),
                  boxShadow: isTrainingActive 
                      ? [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4, offset: const Offset(0, 2))]
                      : [],
                ),
                child: Center(
                  child: Text(
                    l10n.training, 
                    style: isTrainingActive ? AppTextStyles.body14BlueNoHeight : AppTextStyles.body14NoHeight,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: onBodyTap,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: !isTrainingActive ? AppColors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(26),
                  boxShadow: !isTrainingActive 
                      ? [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4, offset: const Offset(0, 2))]
                      : [],
                ),
                child: Center(
                  child: Text(
                    l10n.body, 
                    style: !isTrainingActive ? AppTextStyles.body14BlueNoHeight : AppTextStyles.body14NoHeight,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// 2. Total Volume Card
// ==========================================
class StatTotalVolumeCard extends StatelessWidget {
  final double volume;
  final int percentage;

  const StatTotalVolumeCard({Key? key, required this.volume, required this.percentage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(24)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.totalVolume, style: AppTextStyles.profileStatLabel10),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text('$volume', style: AppTextStyles.heading36Black),
              const SizedBox(width: 8),
              Text(l10n.tons, style: AppTextStyles.profileVolumeUnit18.copyWith(fontWeight: FontWeight.w500)),
            ],
          ),
          const SizedBox(height: 16),
          // Custom Progress Bar
          Container(
            height: 8,
            width: double.infinity,
            decoration: BoxDecoration(color: AppColors.inputBackground, borderRadius: BorderRadius.circular(4)),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: 0.7, // نسبة التعبئة 70%
              child: Container(
                decoration: BoxDecoration(color: AppColors.primaryLight, borderRadius: BorderRadius.circular(4)),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.trending_up, color: AppColors.primary, size: 16),
              const SizedBox(width: 8),
              Text('$percentage% ${l10n.increaseFromLastMonth}', style: AppTextStyles.caption12.copyWith(color: AppColors.textGrey)),
            ],
          )
        ],
      ),
    );
  }
}

// ==========================================
// 3. Mini Stat Cards Row (Workouts & Reps)
// ==========================================
class StatMiniCardsRow extends StatelessWidget {
  final int workouts;
  final String reps;

  const StatMiniCardsRow({Key? key, required this.workouts, required this.reps}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Row(
      children: [
        _buildMiniCard(l10n.totalWorkouts, '$workouts'),
        const SizedBox(width: 16),
        _buildMiniCard(l10n.totalReps, reps),
      ],
    );
  }

  Widget _buildMiniCard(String title, String value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppTextStyles.profileStatLabel10),
            const SizedBox(height: 12),
            Text(value, style: AppTextStyles.profileWorkouts24),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 4. Training Volume Chart (Custom Bar Chart)
// ==========================================
class TrainingVolumeChart extends StatelessWidget {
  const TrainingVolumeChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    // داتا وهمية لرسم البارات بنسب مختلفة
    final List<double> chartHeights = [0.3, 0.4, 0.35, 0.6, 0.5, 0.7, 0.65, 0.75, 0.7, 0.8, 0.75, 1.0];

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(l10n.trainingVolume, style: AppTextStyles.profileListText16),
            Text(l10n.weeks12, style: AppTextStyles.label10Blue),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          height: 180,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(24)),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(chartHeights.length, (index) {
                    bool isLast = index == chartHeights.length - 1;
                    return FractionallySizedBox(
                      heightFactor: chartHeights[index],
                      child: Container(
                        width: 16,
                        decoration: BoxDecoration(
                          color: isLast ? AppColors.primary : AppColors.lightBlueWhite,
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(l10n.oct24, style: AppTextStyles.smallCaption11),
                  Text(l10n.nov24, style: AppTextStyles.smallCaption11),
                  Text(l10n.dec24, style: AppTextStyles.smallCaption11),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

// ==========================================
// 5. Workout Frequency Grid
// ==========================================
class WorkoutFrequencyGrid extends StatelessWidget {
  final double avgPerWeek;

  const WorkoutFrequencyGrid({Key? key, required this.avgPerWeek}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final List<String> days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
    // 0: Grey, 1: Light Blue, 2: Dark Blue
    final List<List<int>> activityData = [
      [2, 0, 2, 2, 0, 1, 0],
      [2, 1, 2, 2, 0, 2, 0]
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.workoutFrequency, style: AppTextStyles.profileListText16),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(24)),
          child: Column(
            children: [
              // Days Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: days.map((d) => SizedBox(width: 30, child: Center(child: Text(d, style: AppTextStyles.smallCaption11)))).toList(),
              ),
              const SizedBox(height: 12),
              // Grid Rows
              ...activityData.map((row) => Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: row.map((status) => _buildGridBox(status)).toList(),
                ),
              )).toList(),
              const SizedBox(height: 16),
              // Footer Stats
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text('$avgPerWeek', style: AppTextStyles.heading24.copyWith(fontWeight: FontWeight.w900)),
                      const SizedBox(width: 6),
                      Text(l10n.avgPerWeek, style: AppTextStyles.caption12.copyWith(color: AppColors.textGrey)),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.check_circle_outline, color: AppColors.primary, size: 16),
                      const SizedBox(width: 6),
                      Text(l10n.onTrack, style: AppTextStyles.body14BlueWithHeight),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGridBox(int status) {
    Color color;
    if (status == 2) color = AppColors.primary;
    else if (status == 1) color = AppColors.primaryLight;
    else color = AppColors.inputBackground;

    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
    );
  }
}

// ==========================================
// 6. Muscle Group Split Chart 
// ==========================================
class MuscleGroupSplit extends StatelessWidget {
  final Map<String, int> data;

  const MuscleGroupSplit({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.muscleGroupSplit, style: AppTextStyles.profileListText16),
        const SizedBox(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // الكارت الأبيض اللي بيحوط الدائرة
            Container(
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
              decoration: BoxDecoration(
                color: AppColors.white, 
                borderRadius: BorderRadius.circular(24),
              ),
              child: SizedBox(
                width: 180, 
                height: 180, 
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // الدائرة الرمادي الكاملة في الخلفية
                    SizedBox(
                      width: 180,
                      height: 180,
                      child: CircularProgressIndicator(
                        value: 1.0, 
                        strokeWidth: 26, 
                        color: AppColors.lightGray, 
                      ),
                    ),
                    // الدائرة الزرقاء الفاتحة (الصدر والظهر)
                    SizedBox(
                      width: 180,
                      height: 180,
                      child: CircularProgressIndicator(
                        value: 0.45, 
                        strokeWidth: 26, 
                        color: AppColors.primaryLight,
                      ),
                    ),
                    // الدائرة الزرقاء الغامقة (الصدر)
                    SizedBox(
                      width: 180,
                      height: 180,
                      child: CircularProgressIndicator(
                        value: 0.25, 
                        strokeWidth: 26, 
                        color: AppColors.primary,
                      ),
                    ),
                    // الأيقونة في النص
                    const Icon(Icons.fitness_center, color: AppColors.primary, size: 40),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 24),
            
            // البيانات (Legend)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildLegendItem(l10n.chest, data['CHEST'] ?? 25, AppColors.primary),
                  const SizedBox(height: 16),
                  _buildLegendItem(l10n.back, data['BACK'] ?? 20, AppColors.primaryLight),
                  const SizedBox(height: 16),
                  _buildLegendItem(l10n.legs, data['LEGS'] ?? 15, AppColors.textGrey), 
                  const SizedBox(height: 16),
                  _buildLegendItem(l10n.arms, data['ARMS'] ?? 10, AppColors.borderGrey), 
                ],
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget _buildLegendItem(String label, int percentage, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label.toUpperCase(), style: AppTextStyles.label10Blue.copyWith(color: color)),
        const SizedBox(height: 4),
        Text('$percentage%', style: AppTextStyles.profileStat20),
      ],
    );
  }
}