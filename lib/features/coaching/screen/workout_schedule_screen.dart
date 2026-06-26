import 'package:flutter/material.dart';
import 'package:kinetic/features/coaching/models/workout_schedule_model.dart';
import 'package:kinetic/features/coaching/provider/workout_schedule_provider.dart';
import 'package:kinetic/features/coaching/widgets/workout_widgets.dart';
import 'package:provider/provider.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';



class WorkoutScheduleScreen extends StatefulWidget {
  const WorkoutScheduleScreen({Key? key}) : super(key: key);

  @override
  State<WorkoutScheduleScreen> createState() => _WorkoutScheduleScreenState();
}

class _WorkoutScheduleScreenState extends State<WorkoutScheduleScreen> {
  @override
  void initState() {
    super.initState();
    // استدعاء ה- API بمجرد فتح الشاشة
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<WorkoutScheduleProvider>(context, listen: false).fetchScheduleFromApi();
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBackground,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=11'),
          ),
        ),
        centerTitle: true,
        title: Text(l10n.workoutsTitle, style: AppTextStyles.appBarTitle.copyWith(fontSize: 18)),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today_outlined, color: AppColors.primary),
            onPressed: () {},
          ),
        ],
      ),
      body: Consumer<WorkoutScheduleProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator(color: AppColors.primary));
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CoachQuoteWidget(),
                const SizedBox(height: 32),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(l10n.weeklySchedule, style: AppTextStyles.sectionTitle),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Text(l10n.week12, style: AppTextStyles.label10Grey.copyWith(letterSpacing: 1.5)),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // عرض الكروت بناءً على الحالة اللي راجعة من ה- API
                ...provider.schedule.map((workout) {
                  Widget card;
                  switch (workout.status) {
                    case WorkoutStatus.today:
                      card = TodayWorkoutCard(workout: workout);
                      break;
                    case WorkoutStatus.completed:
                      card = CompletedWorkoutCard(workout: workout);
                      break;
                    case WorkoutStatus.overdue:
                      card = OverdueWorkoutCard(workout: workout);
                      break;
                  }
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: card,
                  );
                }).toList(),
                
                const SizedBox(height: 20), // مسافة سفلية إضافية عشان الـ Scroll
              ],
            ),
          );
        },
      ),
    );
  }
}