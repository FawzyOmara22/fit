import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/profile/models/training_calendar_model.dart';
import 'package:kinetic/features/profile/widgets/training_calendar_widgets.dart';
 // استدعاء ملف الويدجتس الجديد

class TrainingCalendarScreen extends StatelessWidget {
  final TrainingCalendarModel data;

  const TrainingCalendarScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBackground,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: AppColors.darkCharcoal),
          onPressed: () {},
        ),
        title: Text(l10n.training_calendar_title, style: AppTextStyles.appBarTitle),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CircleAvatar(
              radius: 16,
              backgroundImage: const NetworkImage('https://via.placeholder.com/150'),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StreakAndStatusRow(streak: data.currentStreak, status: data.statusTitle),
            const SizedBox(height: 30),

            CalendarWidget(monthYear: data.currentMonthYear),
            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(l10n.todays_session, style: AppTextStyles.sectionTitle),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.lightBlueWhite,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    data.todaySession.dateString,
                    style: AppTextStyles.navBarSelected10.copyWith(color: AppColors.primary),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TodaySessionCard(session: data.todaySession),
            const SizedBox(height: 30),

            Text(l10n.monthly_performance, style: AppTextStyles.sectionTitle),
            const SizedBox(height: 16),
            MonthlyPerformanceSection(performance: data.monthlyPerformance),
            
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}