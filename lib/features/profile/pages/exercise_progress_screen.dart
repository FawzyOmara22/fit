import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/features/profile/models/exercise_progress_model.dart';
import 'package:kinetic/features/profile/widgets/exercise_progress_widgets.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';


class ExerciseProgressScreen extends StatefulWidget {
  final ExerciseProgressModel? data;

  const ExerciseProgressScreen({Key? key, this.data}) : super(key: key);

  @override
  State<ExerciseProgressScreen> createState() => _ExerciseProgressScreenState();
}

class _ExerciseProgressScreenState extends State<ExerciseProgressScreen> {
  late ExerciseProgressModel progressData;

  @override
  void initState() {
    super.initState();
    // تحميل البيانات الافتراضية لو مفيش بيانات ممررة
    progressData = widget.data ?? ExerciseProgressModel.mockData();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(l10n.squat_progress, style: AppTextStyles.appBarTitle.copyWith(fontSize: 18)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: AppColors.textGrey),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProgressHeaderStats(data: progressData),
            const SizedBox(height: 24),
            
           // السطر الجديد الصحيح
            const ProgressLineChart(),
            const SizedBox(height: 24),
            
            HighlightsRow(data: progressData),
            const SizedBox(height: 32),
            
            WorkoutHistorySection(history: progressData.history),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}