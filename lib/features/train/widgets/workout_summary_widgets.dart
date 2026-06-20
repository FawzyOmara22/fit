import 'dart:ui'; // 👈 ضرورية جداً عشان تأثير البلور
import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/train/pages/ShareMilestoneBottomSheet.dart';

// 👇 تأكد من وضع المسار الصحيح للملف الذي أنشأناه للـ Bottom Sheet


// ==========================================
// 0. ويدجت مساعدة لعمل نصوص بتدريج لوني
// ==========================================
class GradientText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Gradient gradient;

  const GradientText({
    Key? key,
    required this.text,
    required this.style,
    required this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}

// ==========================================
// 1. Top App Bar
// ==========================================
class WorkoutSummaryWidgets extends StatelessWidget {
  const WorkoutSummaryWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: const BoxDecoration(
            color: AppColors.surfaceColor,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(Icons.close, color: AppColors.darkCharcoal, size: 20),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        // التعديل: النص أصبح ثابت ومطابق للصورة 'WORKOUT COMPLETE'
        GradientText(
          text: 'WORKOUT COMPLETE', 
          style: AppTextStyles.body14BlueWithHeight.copyWith(letterSpacing: 1.0, fontWeight: FontWeight.w900),
          gradient: AppColors.primaryGradient,
        ),
        const SizedBox(width: 48),
      ],
    );
  }
}

// ==========================================
// 2. Header (Session Summary)
// ==========================================
class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(loc.sumSession, style: AppTextStyles.sumSession10),
        const SizedBox(height: 4),
        Text(loc.sumCrushed, style: AppTextStyles.sumCrushed36),
      ],
    );
  }
}

// ==========================================
// 3. Volume Card
// ==========================================
class VolumeCardWidget extends StatelessWidget {
  const VolumeCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          colors: [AppColors.white, AppColors.cardSelectedBg.withOpacity(0.8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(loc.sumTotalVolume, style: AppTextStyles.sumStatTitle10),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              GradientText(
                text: '14,250',
                style: AppTextStyles.sumTotalVolume48,
                gradient: AppColors.primaryGradient,
              ),
              const SizedBox(width: 8),
              Text(loc.trainLbs, style: AppTextStyles.profileVolumeUnit18),
            ],
          ),
        ],
      ),
    );
  }
}

// ==========================================
// 4. Duration Card
// ==========================================
class DurationCardWidget extends StatelessWidget {
  const DurationCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.gradientStart, AppColors.gradientEnd],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(loc.sumDuration, style: AppTextStyles.sumStatTitle10.copyWith(color: AppColors.white)),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('01:12:45', style: AppTextStyles.heading36Black.copyWith(color: AppColors.white)),
              Text(
                '+15M VS AVG',
                style: AppTextStyles.sumStatTitle10.copyWith(color: AppColors.white.withOpacity(0.8), fontWeight: FontWeight.w900),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Icon(Icons.timer_outlined, color: AppColors.white, size: 24),
        ],
      ),
    );
  }
}

// ==========================================
// 5. Stats Row (Sets & Intensity)
// ==========================================
class StatsRowWidget extends StatelessWidget {
  const StatsRowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(loc.sumTotalSets, style: AppTextStyles.sumStatTitle10),
                const SizedBox(height: 8),
                const Text('18', style: AppTextStyles.sumStatValue30),
                const SizedBox(height: 12),
                const Icon(Icons.menu, color: AppColors.primaryLight, size: 24),
              ],
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(loc.sumIntensity, style: AppTextStyles.sumStatTitle10),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Container(height: 4, width: 20, color: AppColors.primary),
                    const SizedBox(width: 4),
                    Container(height: 4, width: 20, color: AppColors.primary),
                    const SizedBox(width: 4),
                    Container(height: 4, width: 10, color: AppColors.primary10),
                  ],
                ),
                const SizedBox(height: 12),
                Text('HARD (RPE 8)', style: AppTextStyles.sumSession10.copyWith(fontSize: 9)),
                const SizedBox(height: 6),
                const Icon(Icons.bolt, color: AppColors.primaryLight, size: 24),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ==========================================
// 6. Volume Trend Card & Chart Bar
// ==========================================
class VolumeTrendCardWidget extends StatelessWidget {
  const VolumeTrendCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(24)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(loc.sumVolumeTrend, style: AppTextStyles.title18Dark),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.divider),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.circle, size: 8, color: AppColors.primary),
                    SizedBox(width: 6),
                    Text('TODAY', style: AppTextStyles.label10GreyDark),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 4),
          Text('Rolling 30-day cumulative\nload (${loc.trainLbs.toLowerCase()})', style: AppTextStyles.body14NoHeight.copyWith(fontSize: 12)),
          const SizedBox(height: 32),
          SizedBox(
            height: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                _ChartBar(height: 40, isToday: false),
                _ChartBar(height: 45, isToday: false),
                _ChartBar(height: 35, isToday: false),
                _ChartBar(height: 50, isToday: false),
                _ChartBar(height: 48, isToday: false),
                _ChartBar(height: 60, isToday: false),
                _ChartBar(height: 100, isToday: true, label: '17.6k'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ChartBar extends StatelessWidget {
  final double height;
  final bool isToday;
  final String? label;
  
  const _ChartBar({Key? key, required this.height, required this.isToday, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (label != null) ...[
          Text(label!, style: AppTextStyles.label10Blue.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
        ],
        Container(
          width: 28,
          height: height,
          decoration: BoxDecoration(
            gradient: isToday ? AppColors.primaryGradient : null,
            color: isToday ? null : AppColors.surfaceColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(6)),
          ),
        ),
      ],
    );
  }
}

// ==========================================
// 7. Muscle Engagement Widget
// ==========================================
class MuscleEngagementWidget extends StatelessWidget {
  const MuscleEngagementWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(24)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Muscle Engagement', style: AppTextStyles.title18Dark),
          const SizedBox(height: 20),
          _buildMuscleRow('Chest', '45 %', 0.45),
          const SizedBox(height: 16),
          _buildMuscleRow('Triceps', '30 %', 0.30),
          const SizedBox(height: 16),
          _buildMuscleRow(loc.shoulders, '25 %', 0.25),
        ],
      ),
    );
  }

  Widget _buildMuscleRow(String name, String percentage, double fraction) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(name, style: AppTextStyles.body14WithHeight.copyWith(color: AppColors.darkCharcoal)),
            GradientText(
              text: percentage,
              style: AppTextStyles.body14BlueNoHeight.copyWith(fontWeight: FontWeight.bold),
              gradient: AppColors.primaryGradient,
            ),
          ],
        ),
        const SizedBox(height: 8),
        LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              width: constraints.maxWidth,
              height: 8,
              decoration: BoxDecoration(
                color: AppColors.surfaceColor,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                children: [
                  Container(
                    width: constraints.maxWidth * fraction,
                    height: 8,
                    decoration: BoxDecoration(
                      gradient: AppColors.primaryGradient,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

// ==========================================
// 8. Personal Records Card
// ==========================================
class PersonalRecordsCardWidget extends StatelessWidget {
  const PersonalRecordsCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(loc.sumPersonalRecords, style: AppTextStyles.title18Dark),
            const Icon(Icons.military_tech, color: AppColors.prText),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(color: AppColors.prBg, borderRadius: BorderRadius.circular(24)),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: AppColors.prText.withOpacity(0.15), shape: BoxShape.circle),
                child: const Icon(Icons.emoji_events, color: AppColors.prText, size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('NEW PR: BENCH PRESS', style: AppTextStyles.sumPR16),
                    SizedBox(height: 4),
                    Text('100kg x 8 reps (+5kg increase)', style: AppTextStyles.sumPRSub14),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

// ==========================================
// 9. Exercises Breakdown
// ==========================================
class ExercisesBreakdownWidget extends StatelessWidget {
  const ExercisesBreakdownWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(loc.sumExercisesBreakdown, style: AppTextStyles.title18Dark),
        const SizedBox(height: 16),
        // التعديل: هنا يمكنك كتابة مسارات الأصول الحقيقية لصور التمارين بدلاً من الـ null
        const _ExerciseTile(
          title: 'BENCH PRESS (BARBELL)', 
          subtitle: '4 SETS · TOP WEIGHT 100KG', 
          imageAsset: 'assets/images/bench_press.png', 
        ),
        const SizedBox(height: 12),
        const _ExerciseTile(
          title: 'INCLINE DUMBBELL PRESS', 
          subtitle: '3 SETS · TOP WEIGHT 34KG', 
          imageAsset: 'assets/images/incline_press.png',
        ),
        const SizedBox(height: 12),
        const _ExerciseTile(
          title: 'TRICEP PUSHDOWNS', 
          subtitle: '3 SETS · TOP WEIGHT 45KG', 
          imageAsset: 'assets/images/tricep_pushdown.png',
        ),
      ],
    );
  }
}

class _ExerciseTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? imageAsset; 
  
  const _ExerciseTile({Key? key, required this.title, required this.subtitle, this.imageAsset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          // التعديل: المربع الآن يعرض الصور الفعلية بتغطية كاملة وحواف دائرية متناسقة
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: AppColors.surfaceColor, 
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: imageAsset != null 
                  ? Image.asset(
                      imageAsset!, 
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        // حماية: إذا لم تكن الصورة مضافة في الـ assets يرجع تلقائياً للشكل الاحتياطي
                        return const Icon(Icons.fitness_center, color: AppColors.iconGrey);
                      },
                    )
                  : const Icon(Icons.fitness_center, color: AppColors.iconGrey),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.sumBreakdownTitle16),
                const SizedBox(height: 4),
                Text(subtitle, style: AppTextStyles.sessionExMuscle12.copyWith(fontWeight: FontWeight.w700, fontSize: 10)),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: AppColors.iconGrey),
        ],
      ),
    );
  }
}

// ==========================================
// 10. Bottom Navigation Bar
// ==========================================
class SummaryBottomBarWidget extends StatelessWidget {
  const SummaryBottomBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: const BoxDecoration(
        color: AppColors.background, 
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: TextButton.icon(
              // 👇 التعديل تم هنا لفتح الـ Bottom Sheet مع تأثير البلور
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.transparent, // مهم جداً عشان الحواف الدائرية تبان
                  isScrollControlled: true, 
                  builder: (context) {
                    return BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0), // تأثير البلور
                      child: const ShareMilestoneBottomSheet(),
                    );
                  },
                );
              },
              icon: const Icon(Icons.share, color: AppColors.darkCharcoal, size: 20),
              label: Text(
                loc.sumShareResults,
                textAlign: TextAlign.center,
                style: AppTextStyles.label10GreyDark.copyWith(color: AppColors.darkCharcoal, fontSize: 10),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient, 
                borderRadius: BorderRadius.circular(24),
              ),
              child: ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent, 
                  shadowColor: Colors.transparent,     
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                  elevation: 0,
                ),
                icon: const Icon(Icons.check_circle_outline, color: AppColors.white, size: 20),
                label: Text(
                  loc.sumDone,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.primaryButton16.copyWith(fontSize: 14, letterSpacing: 1.20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}