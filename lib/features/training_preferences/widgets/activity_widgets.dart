import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/training_preferences/models/activity_model.dart';
import 'package:intl/intl.dart';

/// 1. الهيدر (صورة التمرين)
/// 1. الهيدر (صورة التمرين بالشكل الطولي)
class ActivityHeroHeader extends StatelessWidget {
  final WorkoutActivityModel data;
  const ActivityHeroHeader({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // التعديل الأساسي هنا: زودنا الطول لـ 420 بدل 260 عشان يدي الشكل الطولي المطلوب
      height: 420, 
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        image: const DecorationImage(
          image: AssetImage('assets/images/Hero .png'), // صورتك هنا
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            // ظبطنا التدرج عشان يغطي مساحة مناسبة من الطول الجديد
            colors: [Colors.transparent, Colors.black.withOpacity(0.9)],
            stops: const [0.4, 1.0], 
          ),
        ),
        padding: const EdgeInsets.all(24), // كبرنا الحواف الداخلية شوية لتناسب الحجم الجديد
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.dateText, 
              style: AppTextStyles.label10Blue.copyWith(color: AppColors.primaryLight, letterSpacing: 1.5)
            ),
            const SizedBox(height: 8),
            Text(
              data.title, 
              // كبرنا الخط لـ 36 وظبطنا الـ height عشان يبان فخم أكتر في المساحة الطولية
              style: AppTextStyles.heroHeadingItalic.copyWith(color: Colors.white, fontSize: 36, height: 1.1)
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(Icons.location_on_outlined, color: AppColors.lightBlueWhite80, size: 16),
                const SizedBox(width: 4),
                Text(
                  data.location, 
                  style: AppTextStyles.body14NoHeight.copyWith(color: AppColors.lightBlueWhite80)
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// 2. كروت الإحصائيات (Volume, Duration, Heart Rate)
class ActivityStatsCards extends StatelessWidget {
  final WorkoutActivityModel data;
  final AppLocalizations l10n;
  const ActivityStatsCards({Key? key, required this.data, required this.l10n}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat("#,##0", "en_US"); // لتنسيق الرقم 12,450
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _StatCard(title: l10n.totalVolume, value: formatCurrency.format(data.totalVolume), unit: l10n.kg),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _StatCard(title: l10n.duration, value: data.durationText, unit: ''),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l10n.avgHeartRate, style: AppTextStyles.label10GreyDark),
                  const SizedBox(height: 4),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('${data.avgHeartRate}', style: AppTextStyles.heading24.copyWith(fontWeight: FontWeight.w800)),
                      const SizedBox(width: 4),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Text(l10n.bpm, style: AppTextStyles.smallCaption11),
                      ),
                    ],
                  ),
                ],
              ),
              const Icon(Icons.bar_chart, color: AppColors.primary, size: 32),
            ],
          ),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title, value, unit;
  const _StatCard({required this.title, required this.value, required this.unit});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.label10GreyDark),
          const SizedBox(height: 4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(value, style: AppTextStyles.heading24.copyWith(fontWeight: FontWeight.w800)),
              if (unit.isNotEmpty) ...[
                const SizedBox(width: 4),
                Padding(padding: const EdgeInsets.only(bottom: 4), child: Text(unit, style: AppTextStyles.smallCaption11)),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

/// 3. زر إعادة التمرين
class RepeatWorkoutButton extends StatelessWidget {
  final AppLocalizations l10n;
  const RepeatWorkoutButton({Key? key, required this.l10n}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Color(0xFF3B82F6), Color(0xFF60A5FA)]),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.refresh, color: Colors.white, size: 20),
          const SizedBox(width: 8),
          Text(l10n.repeatThisWorkout, style: AppTextStyles.primaryButton16),
        ],
      ),
    );
  }
}

/// 4. سجل التمرين (المجموعات والأوزان مع أيقونات ديناميكية)
class ExerciseLogSection extends StatelessWidget {
  final ExerciseLogModel exercise;
  final AppLocalizations l10n;
  
  const ExerciseLogSection({Key? key, required this.exercise, required this.l10n}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // تحديد الأيقونة ولونها بشكل ديناميكي بناءً على اسم التمرين
    IconData exerciseIcon = Icons.fitness_center; // الدمبل (الافتراضي للـ Deadlift)
    Color iconColor = AppColors.primary; // أزرق

    if (exercise.name.toLowerCase().contains('pull up')) {
      exerciseIcon = Icons.vertical_align_top; // سهم لأعلى مع خط
      iconColor = AppColors.darkCharcoal; // رمادي داكن/أسود كما في الصورة
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(exercise.name, style: AppTextStyles.cardTitle18),
              // التعديل هنا: الأيقونة المتغيرة
              Icon(exerciseIcon, color: iconColor, size: 22),
            ],
          ),
          const SizedBox(height: 12),
          ...exercise.sets.map((set) => _SetRow(set: set, l10n: l10n)).toList(),
        ],
      ),
    );
  }
}

class _SetRow extends StatelessWidget {
  final SetModel set;
  final AppLocalizations l10n;
  const _SetRow({required this.set, required this.l10n});

  @override
  Widget build(BuildContext context) {
    final bool isPR = set.isPR;
    final Color bgColor = isPR ? AppColors.white : AppColors.inputBackground;
    final Color textColor = isPR ? AppColors.primary : AppColors.darkCharcoal;
    final Border? border = isPR ? Border.all(color: AppColors.primary.withOpacity(0.3), width: 1.5) : null;

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(16), border: border),
      child: Row(
        children: [
          SizedBox(width: 60, child: Text('${l10n.set} ${set.setNumber}', style: AppTextStyles.label10GreyDark.copyWith(color: isPR ? AppColors.primary : AppColors.textGrey))),
          Expanded(
            child: Column(
              children: [
                Text('${set.weight}', style: AppTextStyles.heading24.copyWith(color: textColor, fontSize: 20, fontWeight: FontWeight.w800)),
                Text(l10n.kg, style: AppTextStyles.smallCaption11),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text('${set.reps}', style: AppTextStyles.heading24.copyWith(color: textColor, fontSize: 20, fontWeight: FontWeight.w800)),
                Text(l10n.reps, style: AppTextStyles.smallCaption11),
              ],
            ),
          ),
          if (isPR)
            Container(
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(8)),
              child: Text(l10n.newPR, style: AppTextStyles.label10Blue.copyWith(color: Colors.white, fontSize: 8)),
            ),
          Icon(Icons.check_circle, color: isPR ? AppColors.primary : AppColors.iconGrey.withOpacity(0.5)),
        ],
      ),
    );
  }
}

/// 5. قسم التعليقات
class CommentsSection extends StatelessWidget {
  final WorkoutActivityModel data;
  final AppLocalizations l10n;
  const CommentsSection({Key? key, required this.data, required this.l10n}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(l10n.comments, style: AppTextStyles.trainSectionTitle24),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(color: AppColors.inputBackground, borderRadius: BorderRadius.circular(8)),
              child: Text('${data.comments.length}', style: AppTextStyles.label10GreyDark),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ...data.comments.map((comment) => _CommentTile(comment: comment, l10n: l10n)).toList(),
      ],
    );
  }
}

class _CommentTile extends StatelessWidget {
  final CommentModel comment;
  final AppLocalizations l10n;
  const _CommentTile({required this.comment, required this.l10n});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(backgroundImage: NetworkImage(comment.avatarUrl), radius: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(comment.authorName, style: AppTextStyles.cardTitle16),
                    Text(comment.timeAgo, style: AppTextStyles.smallCaption11),
                  ],
                ),
                const SizedBox(height: 4),
                Text(comment.content, style: AppTextStyles.body14Height.copyWith(color: AppColors.textGrey, fontSize: 13)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.favorite, color: AppColors.primary, size: 16),
                    const SizedBox(width: 4),
                    Text('${comment.likes}', style: AppTextStyles.body14BlueNoHeight),
                    const SizedBox(width: 16),
                    Text(l10n.reply, style: AppTextStyles.label10GreyDark),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}