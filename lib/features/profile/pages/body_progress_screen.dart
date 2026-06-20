import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/profile/models/body_progress_model.dart';
import 'package:kinetic/features/profile/pages/photo_log_screen.dart';
import 'package:kinetic/features/profile/widgets/body_progress_widgets.dart';

// مسارات ملفات الموديل والويدجتس الخاصة بصفحة الـ Body (لو حطيتهم في ملفات منفصلة)
// لو لسه معملتهمش، هتحتاج تعملهم من الكود اللي بعتهولك في الرسالة اللي كان فيها الديزاين ده

import 'package:kinetic/features/profile/widgets/statistics_widgets.dart'; // عشان نجيب منها الـ StatToggleBar
import 'statistics_screen.dart'; // عشان نرجع لشاشة الإحصائيات

class BodyProgressScreen extends StatefulWidget {
  const BodyProgressScreen({Key? key}) : super(key: key);

  @override
  State<BodyProgressScreen> createState() => _BodyProgressScreenState();
}

class _BodyProgressScreenState extends State<BodyProgressScreen> {
  // داتا وهمية مطابقة للديزاين اللي بعته
  final BodyProgressModel data = BodyProgressModel(
    beforeImageUrl: 'https://images.unsplash.com/photo-1581009146145-b5ef050c2e1e?q=80&w=1000&auto=format&fit=crop', // صورة مؤقتة
    beforeDate: 'Oct 12, 2023',
    beforeWeight: 185,
    afterImageUrl: 'https://images.unsplash.com/photo-1534438327276-14e5300c3a48?q=80&w=1000&auto=format&fit=crop', // صورة مؤقتة
    afterDate: 'Today',
    afterWeight: 178,
    totalWeightLoss: -7,
    bodyFatChange: -2.4,
    consistencyScorePercentage: 94,
    consistencyLevel: 'ELITE',
  );

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(l10n.compareProgress, style: AppTextStyles.trainAppBar20),
        centerTitle: true,
        actions: [
  IconButton(
    icon: const Icon(Icons.add, color: AppColors.primary),
    onPressed: () {
      // فتح شاشة الـ Photo Log كشاشة جديدة
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const PhotoLogScreen(),
        ),
      );
    },
  ),
],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // التوجل بار معدل عشان يرجعك لشاشة الـ Training
            StatToggleBar(
              isTrainingActive: false, // إحنا دلوقتي في شاشة الـ Body
              onTrainingTap: () {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, a1, a2) => const StatisticsScreen(),
                    transitionDuration: Duration.zero,
                  ),
                );
              },
              onBodyTap: () {}, // إحنا بالفعل فيها فمش هنعمل حاجة
            ),
            const SizedBox(height: 32),
            
            // العناوين
            Text(l10n.visualJourney.toUpperCase(), style: AppTextStyles.sectionLabel),
            const SizedBox(height: 4),
            Text(l10n.theEvolution.toUpperCase(), style: AppTextStyles.profileVolume36.copyWith(letterSpacing: -1.0)),
            const SizedBox(height: 24),
            
            // كارت قبل (Before)
            TransformationImageCard(
              imageUrl: data.beforeImageUrl,
              badgeText: l10n.before,
              isAfter: false,
              dateText: data.beforeDate,
              weightText: '${data.beforeWeight} ${l10n.lbs}',
            ),
            
            // كارت بعد (After)
            TransformationImageCard(
              imageUrl: data.afterImageUrl,
              badgeText: l10n.after,
              isAfter: true,
              dateText: data.afterDate,
              weightText: '${data.afterWeight} ${l10n.lbs}',
            ),
            const SizedBox(height: 8),
            
            // كارت الإحصائيات (الرمادي الفاتح اللي تحت الصور)
            BodyStatsCard(
              weightLoss: data.totalWeightLoss,
              bodyFatChange: data.bodyFatChange,
              consistencyScore: data.consistencyScorePercentage,
              consistencyLevel: data.consistencyLevel,
            ),
            const SizedBox(height: 32),
            
            // زراير الحفظ والمشاركة
            const BodyActionButtons(),
            const SizedBox(height: 40), // مساحة أمان من تحت
          ],
        ),
      ),
    );
  }
}