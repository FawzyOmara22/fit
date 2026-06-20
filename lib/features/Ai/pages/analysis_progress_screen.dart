import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart'; // تأكد من مسار الترجمة
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/Ai/models/analysis_progress_model.dart';
import 'package:kinetic/features/Ai/widgets/analysis_progress_widgets.dart';

// 1. استدعاء صفحة النتيجة النهائية (تأكد من مطابقة المسار الفعلي عندك)
import 'analysis_result_screen.dart'; 

class AnalysisProgressScreen extends StatefulWidget {
  const AnalysisProgressScreen({Key? key}) : super(key: key);

  @override
  State<AnalysisProgressScreen> createState() => _AnalysisProgressScreenState();
}

class _AnalysisProgressScreenState extends State<AnalysisProgressScreen> {
  late AnalysisProgressModel progressData;

  @override
  void initState() {
    super.initState();
    // داتا وهمية لاختبار التصميم لحين ربط الـ API
    progressData = AnalysisProgressModel.fromJson({
      "uploadPercentage": 65,
      "fileName": "Bench_Press_Set_03.mp4",
      "insightTitle": "Proper Scapular Retraction",
      "insightDescription": "Before initiating the press, squeeze your shoulder blades together. This creates a stable base of support and protects your rotator cuffs during heavy loads.",
      "coachName": "Coach Marcus",
      "coachTitle": "Master Trainer, Kinetic Performance",
      "coachAvatarUrl": "https://images.unsplash.com/photo-1599566150163-29194dcaad36?q=80&w=200&auto=format&fit=crop", 
      "estimatedWaitSeconds": 45,
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close, color: AppColors.primary),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          l10n.form_analysis_title, 
          style: AppTextStyles.appBarTitle,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // الهيدر (معالجة)
            Text(l10n.analyzing_processing, style: AppTextStyles.sectionLabel),
            const SizedBox(height: 8),
            Text(l10n.analyzing_title, style: AppTextStyles.heading24.copyWith(fontWeight: FontWeight.w800)),
            const SizedBox(height: 48),

            // 2. التعديل تم هنا: إضافة GestureDetector للدائرة للانتقال لصفحة النتيجة
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AnalysisResultScreen(),
                  ),
                );
              },
              child: ProgressCircleWidget(
                percentage: progressData.uploadPercentage,
                uploadedText: l10n.analyzing_uploaded,
              ),
            ),
            const SizedBox(height: 32),

            // شريحة الملف
            FileChipWidget(fileName: progressData.fileName),
            const SizedBox(height: 48),

            // عنوان قسم الرؤى الاحترافية
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(l10n.analyzing_pro_insights, style: AppTextStyles.title18Dark.copyWith(fontSize: 20)),
                const Icon(Icons.lightbulb, color: AppColors.primary),
              ],
            ),
            const SizedBox(height: 16),

            // كارت الرؤية الاحترافية
            ProInsightDetailsCard(
              focusLabel: l10n.analyzing_form_focus,
              title: progressData.insightTitle,
              description: progressData.insightDescription,
              coachName: progressData.coachName,
              coachTitle: progressData.coachTitle,
              avatarUrl: progressData.coachAvatarUrl,
            ),
            const SizedBox(height: 16),

            // كروت الوقت والـ هل تعلم؟
            InfoCardsRowWidget(
              waitSeconds: progressData.estimatedWaitSeconds,
              waitTimeLabel: l10n.analyzing_wait_time,
              secondsLabel: l10n.analyzing_seconds,
              didYouKnowLabel: l10n.analyzing_did_you_know,
              factText: l10n.analyzing_form_checks_fact,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}