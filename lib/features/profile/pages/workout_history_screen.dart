import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/profile/models/workout_history_model.dart';
import 'package:kinetic/features/profile/widgets/workout_widgets.dart';

class WorkoutHistoryScreen extends StatefulWidget {
  const WorkoutHistoryScreen({Key? key}) : super(key: key);

  @override
  State<WorkoutHistoryScreen> createState() => _WorkoutHistoryScreenState();
}

class _WorkoutHistoryScreenState extends State<WorkoutHistoryScreen> {
  // داتا وهمية مطابقة للاسكرين
  final WorkoutHistoryModel data = WorkoutHistoryModel(
    streakDays: 14,
    workoutsThisMonth: 18,
    totalTimeHours: 22,
    thisWeekSessions: [
      WorkoutSession(
        title: 'Full Body Power',
        isPro: true,
        date: 'Today, 8:30 AM',
        duration: 45,
        volume: 12450,
        sets: 24,
        tags: ['CHEST', 'BACK', 'LEGS'],
      ),
      WorkoutSession(
        title: 'Morning Push',
        isPro: false,
        date: 'Tuesday, 7:15 AM',
        duration: 52,
        volume: 8200,
        sets: 18,
        tags: ['TRICEPS', 'SHOULDERS'],
      ),
    ],
    lastWeekSessions: [
      WorkoutSession(
        title: 'Evening Pull Session',
        isPro: false,
        date: 'Sunday, Oct 24 • 6:45 PM',
        volume: 9840,
        tags: [], // الكارت ده مش محتاج تاجز
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.menu, color: AppColors.primary),
        title: Text(l10n.workoutHistory, style: AppTextStyles.trainAppBar20),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: AppColors.iconGrey),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: AppColors.iconGrey),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StreakCard(streakDays: data.streakDays),
            const SizedBox(height: 16),
            Row(
              children: [
                StatCard(
                  title: l10n.workoutsThisMonth,
                  value: '${data.workoutsThisMonth}',
                  // لون أزرق وخط عريض لرقم 18
                  valueStyle: AppTextStyles.heading36Primary.copyWith(fontSize: 32),
                  icon: Icons.trending_up,
                  iconColor: AppColors.primary,
                ),
                const SizedBox(width: 16),
                StatCard(
                  title: l10n.totalTime,
                  value: '${data.totalTimeHours}',
                  unit: l10n.h,
                  // لون أسود وخط عريض لرقم 22
                  valueStyle: AppTextStyles.heading36Black.copyWith(fontSize: 32),
                  icon: Icons.timer_outlined,
                  iconColor: AppColors.iconGrey,
                ),
              ],
            ),
            const SizedBox(height: 32),
            
            // قسم هذا الأسبوع
            _buildSectionHeader(l10n.thisWeek, '${data.thisWeekSessions.length} ${l10n.sessions}'),
            const SizedBox(height: 16),
            // استخدام SessionCard العادي اللي فيه التاجز والأيقونات
            ...data.thisWeekSessions.map((session) => SessionCard(session: session)).toList(),
            
            const SizedBox(height: 24),
            
            // قسم الأسبوع الماضي
            _buildSectionHeader(l10n.lastWeek, '${data.lastWeekSessions.length} ${l10n.sessions}'),
            const SizedBox(height: 16),
            // استخدام CompactSessionCard المخصص للديزاين المضغوط
            ...data.lastWeekSessions.map((session) => CompactSessionCard(session: session)).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, String subtitle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(title, style: AppTextStyles.trainSectionTitle24),
        Text(subtitle.toUpperCase(), style: AppTextStyles.profileStatLabel10),
      ],
    );
  }
}