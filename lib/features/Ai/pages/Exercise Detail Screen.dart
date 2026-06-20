import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/Ai/widgets/exercise_widgets.dart';


class ExerciseDetailScreen extends StatelessWidget {
  const ExerciseDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!; // استدعاء الترجمة

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBackground,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(l10n.ex_detail_header, style: AppTextStyles.addExAppBarTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz, color: AppColors.primary),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Hero Image / Video Section
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                image: const DecorationImage(
                  image: AssetImage('assets/images/squat_illustration.png'), // صورة التمرين
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.bottomLeft,
              child: Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(l10n.current_movement, style: AppTextStyles.label10Grey.copyWith(color: Colors.white70)),
                        const SizedBox(height: 4),
                        Text('Barbell Squat', style: AppTextStyles.primaryButton18), // ممكن تيجي من الـ Model
                      ],
                    ),
                    const SizedBox(width: 20),
                    const Icon(Icons.play_circle_fill, color: Colors.white, size: 28),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),

            // 2. Core Cues Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(l10n.core_cues, style: AppTextStyles.sectionLabelDark),
                Text(l10n.points_of_focus, style: AppTextStyles.sectionLabel),
              ],
            ),
            const SizedBox(height: 16),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 1.4,
              children: [
                // النصوص هنا ممكن تتغير حسب التمرين من الـ API، ده مثال
                CoreCueCard(title: 'Drive Heels', description: 'Weight mid-foot to heel.', icon: Icons.download),
                CoreCueCard(title: 'Chest Up', description: 'Keep torso proud and tall.', icon: Icons.keyboard_capslock),
                CoreCueCard(title: 'Brace Core', description: 'Fill belly with air, tighten.', icon: Icons.fitness_center),
                CoreCueCard(title: 'Knees Out', description: 'Track over second toe.', icon: Icons.expand),
              ],
            ),
            const SizedBox(height: 32),

            // 3. Setup Guide Section
            Text(l10n.setup_guide, style: AppTextStyles.sectionLabelDark),
            const SizedBox(height: 16),
            SetupStepTile(title: l10n.setup_step1_title, description: l10n.setup_step1_desc, isFirst: true),
            SetupStepTile(title: l10n.setup_step2_title, description: l10n.setup_step2_desc),
            SetupStepTile(title: l10n.setup_step3_title, description: l10n.setup_step3_desc, isLast: true),
            const SizedBox(height: 16),

            // 4. Common Mistakes Section
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.surfaceColor, // الرصاصي الفاتح من ملفك
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l10n.common_mistakes_title, style: AppTextStyles.sectionLabelDark),
                  const SizedBox(height: 16),
                  MistakeTile(title: l10n.mistake1_title, description: l10n.mistake1_desc, isCorrect: true),
                  MistakeTile(title: l10n.mistake2_title, description: l10n.mistake2_desc, isCorrect: false),
                  MistakeTile(title: l10n.mistake3_title, description: l10n.mistake3_desc, isCorrect: false),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // 5. Pro Insight Section
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient, // لون التدرج الأزرق
                borderRadius: BorderRadius.circular(16),
              ),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.auto_awesome, color: Colors.white, size: 16),
                          const SizedBox(width: 8),
                          Text(l10n.pro_insight, style: AppTextStyles.label10Grey.copyWith(color: Colors.white)),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(l10n.pro_insight_title, style: AppTextStyles.primaryButton18),
                      const SizedBox(height: 8),
                      Text(
                        l10n.pro_insight_desc,
                        style: AppTextStyles.body14Height.copyWith(color: Colors.white.withOpacity(0.9)),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), shape: BoxShape.circle),
                      child: const Icon(Icons.add, color: Colors.white, size: 20),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 32),

            // 6. Start AI Analysis Button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.psychology, color: Colors.white),
                label: Text(l10n.start_ai_analysis, style: AppTextStyles.primaryButton16),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  elevation: 0,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}