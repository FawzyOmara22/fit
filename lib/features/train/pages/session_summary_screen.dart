import 'package:flutter/material.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/features/train/widgets/workout_summary_widgets.dart';

class SessionSummaryScreen extends StatelessWidget {
  const SessionSummaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              WorkoutSummaryWidgets(),
              SizedBox(height: 24),
              HeaderWidget(),
              SizedBox(height: 24),
              VolumeCardWidget(),
              SizedBox(height: 16),
              DurationCardWidget(),
              SizedBox(height: 16),
              StatsRowWidget(),
              SizedBox(height: 24),
              VolumeTrendCardWidget(),
              SizedBox(height: 24),
              MuscleEngagementWidget(), // السكشن اللي كان ناقص
              SizedBox(height: 24),
              PersonalRecordsCardWidget(),
              SizedBox(height: 24),
              ExercisesBreakdownWidget(),
              SizedBox(height: 32),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const SummaryBottomBarWidget(),
    );
  }
}