import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/training_preferences/provider/activity_provider.dart';
import 'package:kinetic/features/training_preferences/widgets/activity_widgets.dart';
import 'package:provider/provider.dart';


class ActivityScreen extends StatefulWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  @override
  void initState() {
    super.initState();
    // جلب البيانات بمجرد فتح الشاشة
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ActivityProvider>().fetchActivityDetails();
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final provider = context.watch<ActivityProvider>();

    return Scaffold(
      backgroundColor: AppColors.background,
appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
        ),
        // التعديل هنا: كلمة ACTIVITY أصبحت باللون الأسود الداكن
        title: Text(
          l10n.activity, 
          style: AppTextStyles.label10GreyDark.copyWith(
            color: AppColors.darkCharcoal, 
            fontSize: 12, 
            letterSpacing: 1.5,
            fontWeight: FontWeight.w800,
          )
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share_outlined, color: AppColors.primary),
            onPressed: () {},
          ),
        ],
      ),
      body: provider.isLoading || provider.activityData == null
          ? const Center(child: CircularProgressIndicator(color: AppColors.primary))
          : SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ActivityHeroHeader(data: provider.activityData!),
                  const SizedBox(height: 24),
                  
                  ActivityStatsCards(data: provider.activityData!, l10n: l10n),
                  const SizedBox(height: 24),
                  
                  RepeatWorkoutButton(l10n: l10n),
                  const SizedBox(height: 32),
                  
                  Text(l10n.exerciseLog, style: AppTextStyles.trainSectionTitle24),
                  const SizedBox(height: 16),
                  
                  // عرض التمارين والمجموعات
                  ...provider.activityData!.exercises.map((ex) => ExerciseLogSection(exercise: ex, l10n: l10n)).toList(),
                  
                  const SizedBox(height: 24),
                  
                  // قسم التعليقات
                  CommentsSection(data: provider.activityData!, l10n: l10n),
                  const SizedBox(height: 40), // مساحة سفلية مريحة للعين
                ],
              ),
            ),
    );
  }
}