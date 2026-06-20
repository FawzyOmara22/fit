import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/profile/models/workout_history_model.dart';


// ==========================================
// 1. كارت الـ Streak (تم إضافة الأيقونة في الخلفية)
// ==========================================
class StreakCard extends StatelessWidget {
  final int streakDays;

  const StreakCard({Key? key, required this.streakDays}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      width: double.infinity,
      height: 140, // تثبيت الارتفاع لظبط الخلفية
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: AppColors.primaryGradient,
      ),
      child: Stack(
        children: [
          // الأيقونة الخفيفة في الخلفية (النار)
          Positioned(
            right: -20,
            bottom: -20,
            child: Icon(
              Icons.local_fire_department,
              size: 150,
              color: Colors.white.withOpacity(0.15),
            ),
          ),
          // المحتوى الأساسي
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(l10n.trainingStreak, style: AppTextStyles.trainStreakLabel10.copyWith(color: AppColors.white70)),
                const SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text('$streakDays', style: AppTextStyles.trainStreakValue60.copyWith(color: AppColors.white)),
                    const SizedBox(width: 8),
                    Text(l10n.days, style: AppTextStyles.trainStreakUnit20.copyWith(color: AppColors.white)),
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

// ==========================================
// 2. كروت الإحصائيات الصغيرة (تم تعديل الألوان وسمك الخط)
// ==========================================
class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final String? unit;
  final IconData icon;
  final Color iconColor;
  final TextStyle valueStyle; // لاستقبال ستايل مخصص للرقم

  const StatCard({
    Key? key,
    required this.title,
    required this.value,
    this.unit,
    required this.icon,
    required this.iconColor,
    required this.valueStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppTextStyles.profileStatLabel10),
            const SizedBox(height: 16),
            Row(
              children: [
                Text(value, style: valueStyle), // تطبيق الستايل الجديد هنا
                if (unit != null) ...[
                  const SizedBox(width: 4),
                  Text(unit!, style: AppTextStyles.body14NoHeight),
                ],
                const Spacer(),
                Icon(icon, color: iconColor, size: 24),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 3. كارت الجلسة الأساسي (This Week) (تم إضافة الأيقونات الصغيرة)
// ==========================================
class SessionCard extends StatelessWidget {
  final WorkoutSession session;

  const SessionCard({Key? key, required this.session}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(session.title, style: AppTextStyles.trainRoutineTitle20),
              if (session.isPro)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.cardSelectedBg,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(l10n.pro, style: AppTextStyles.profileProMember10),
                ),
            ],
          ),
          const SizedBox(height: 4),
          Text(session.date, style: AppTextStyles.trainRoutineMeta12),
          const SizedBox(height: 16),
          
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            decoration: BoxDecoration(
              color: AppColors.inputBackground,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: session.duration != null ? MainAxisAlignment.spaceBetween : MainAxisAlignment.end,
              children: [
                if (session.duration != null)
                  _buildInnerStat('${session.duration}', l10n.m, l10n.duration),
                _buildInnerStat('${session.volume}', l10n.kg, l10n.volume),
                if (session.sets != null)
                  _buildInnerStat('${session.sets}', '', l10n.sets),
              ],
            ),
          ),
          const SizedBox(height: 16),
          
          // الصف السفلي: الأيقونات على الشمال، والتاجز على اليمين
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // الأيقونات الدائرية الصغيرة
              Row(
                children: [
                  _buildCircleIcon(Icons.fitness_center),
                  const SizedBox(width: 8),
                  _buildCircleIcon(Icons.adjust), // بديل لأيقونة التارجت
                  const SizedBox(width: 8),
                  _buildCircleIcon(Icons.layers),
                ],
              ),
              // التاجز
              if (session.tags.isNotEmpty)
                Wrap(
                  spacing: 8,
                  children: session.tags.map((tag) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceColor, // لون رمادي فاتح للتاجز
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(tag, style: AppTextStyles.addExTagEquipment),
                    );
                  }).toList(),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInnerStat(String value, String unit, String label) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(value, style: AppTextStyles.cardTitle18),
            if (unit.isNotEmpty) Text(unit, style: AppTextStyles.smallCaption11),
          ],
        ),
        const SizedBox(height: 4),
        Text(label.toUpperCase(), style: AppTextStyles.label10GreyDark),
      ],
    );
  }

  // ميثود لعمل الأيقونات الدائرية الصغيرة
  Widget _buildCircleIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: const BoxDecoration(
        color: AppColors.surfaceColor,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 16, color: AppColors.textGrey),
    );
  }
}

// ==========================================
// 4. كارت الجلسة المضغوط (Last Week) (كارت واحد بالكامل)
// ==========================================
class CompactSessionCard extends StatelessWidget {
  final WorkoutSession session;

  const CompactSessionCard({Key? key, required this.session}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.inputBackground, // لون الكارت بالكامل رمادي فاتح
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // الجزء الأيسر: العنوان والتاريخ
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(session.title, style: AppTextStyles.trainRoutineTitle20), // Evening Pull Session
              const SizedBox(height: 4),
              Text(session.date, style: AppTextStyles.trainRoutineMeta12),
            ],
          ),
          // الجزء الأيمن: الوزن والحجم
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${session.volume} ${l10n.kg}', 
                style: AppTextStyles.trainRoutineTitle20.copyWith(fontWeight: FontWeight.w900),
              ),
              const SizedBox(height: 4),
              Text(l10n.volume.toUpperCase(), style: AppTextStyles.label10GreyDark),
            ],
          ),
        ],
      ),
    );
  }
}