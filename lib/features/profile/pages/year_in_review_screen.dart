import 'package:flutter/material.dart'; // مسار ملف الـ L10n
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/profile/models/year_review_model.dart';
import 'package:kinetic/features/profile/widgets/year_review_widgets.dart';
 // مسار ملف الويدجتس المجمعة اللي فوق

class YearInReviewScreen extends StatefulWidget {
  const YearInReviewScreen({super.key});

  @override
  State<YearInReviewScreen> createState() => _YearInReviewScreenState();
}

class _YearInReviewScreenState extends State<YearInReviewScreen> {
  // Mock Data (دي المفروض تيجي من الـ API وتتحط في الموديل بتاعنا)
  final YearReviewModel mockData = YearReviewModel(
    workoutsCount: 248,
    kgLifted: '1.2M',
    hoursTrained: 480,
    dailyStreak: 12,
    topPercent: 5,
    mostImproved: [
      ImprovedLift(name: 'Squat', increase: '+45kg'),
      ImprovedLift(name: 'Bench Press', increase: '+20kg'),
    ],
    topLifts: [
      TopLift(name: 'Deadlift', reps: 1240, progress: 0.8),
      TopLift(name: 'Pull-ups', reps: 980, progress: 0.6),
    ],
  );

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(l10n.reviewTitle, style: AppTextStyles.appBarTitle.copyWith(color: AppColors.primary)),
        actions: [
          IconButton(
            icon: const Icon(Icons.share, color: AppColors.primary),
            onPressed: () {
              // Share action logic
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Header Card
            const ReviewHeaderCard(),
            const SizedBox(height: 24),

            // 2. Stats Grid / Row
            StatCard(
              icon: Icons.fitness_center,
              value: mockData.workoutsCount.toString(),
              label: l10n.workouts,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: StatCard(
                    icon: Icons.shopping_bag_outlined, // Use custom icon if available
                    value: mockData.kgLifted,
                    label: l10n.kgLifted,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: StatCard(
                    icon: Icons.access_time,
                    value: mockData.hoursTrained.toString(),
                    label: l10n.hoursTrained,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),

            // 3. Consistency Graph
            ConsistencySection(streak: mockData.dailyStreak),
            const SizedBox(height: 32),

            // 4. Most Improved
            MostImprovedSection(lifts: mockData.mostImproved),
            const SizedBox(height: 32),

            // 5. Top Lifts
            TopLiftsSection(topLifts: mockData.topLifts),
            const SizedBox(height: 40),

            // 6. Share Button with Gradient
            GradientShareButton(
              onTap: () {
                // Share action
              },
            ),
            const SizedBox(height: 16),

            // 7. Footer text
            Center(
              child: Text(
                l10n.generatedOn.toUpperCase(),
                style: AppTextStyles.settingsVersion10,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}