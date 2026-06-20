import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';

import 'package:kinetic/features/Ai/models/analysis_result_model.dart';
import 'package:kinetic/features/Ai/pages/ai_hub_result_screen.dart';

import 'package:kinetic/features/Ai/pages/ai_screen.dart';
import 'package:kinetic/features/Ai/widgets/analysis_result_widgets.dart';

// استدعاء الصفحات الحقيقية مباشرة بدون أي عناصر مؤقتة
import 'package:kinetic/features/train/pages/ShareMilestoneBottomSheet.dart'; 

class AnalysisResultScreen extends StatefulWidget {
  const AnalysisResultScreen({Key? key}) : super(key: key);

  @override
  State<AnalysisResultScreen> createState() => _AnalysisResultScreenState();
}

class _AnalysisResultScreenState extends State<AnalysisResultScreen> {
  late AnalysisResultModel resultData;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    
    final l10n = AppLocalizations.of(context)!;

    // تهيئة البيانات بالكامل من ملفات الـ Localization لتجنب أي نصوص حرة في الكود
    resultData = AnalysisResultModel(
      exerciseName: l10n.barbell_squat,
      videoThumbnailUrl: "https://images.unsplash.com/photo-1534438327276-14e5300c3a48?q=80&w=800&auto=format&fit=crop",
      overallScore: 92,
      performanceTitle: l10n.peak_technique,
      performanceSubtitle: l10n.top_5_percent,
      metrics: [
        MetricModel(labelKey: "metric_depth", value: l10n.parallel_102, status: "success"),
        MetricModel(labelKey: "metric_bar_path", value: l10n.stable_linear, status: "success"),
        MetricModel(labelKey: "metric_back_angle", value: l10n.slightly_forward, status: "warning"),
      ],
      aiCues: [
        l10n.ai_cue_1,
        l10n.ai_cue_2
      ],
      coachName: l10n.coach_marcus,
      coachTip: l10n.coach_tip_text,
      coachAvatarUrl: "https://images.unsplash.com/photo-1599566150163-29194dcaad36?q=80&w=200&auto=format&fit=crop"
    );
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
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () {
            // الانتقال المباشر لصفحة الـ AIScreen واستبدال الشاشة الحالية
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const AIScreen()),
            );
          },
        ),
        title: Text(l10n.form_analysis_title, style: AppTextStyles.appBarTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.share_outlined, color: AppColors.primary),
            onPressed: () {
              // فتح كارت المشاركة الحقيقي مع تفعيل تأثير الـ Blur بالكامل على الخلفية
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent, 
                isScrollControlled: true,
                builder: (context) => BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8), 
                  child: const ShareMilestoneBottomSheet(),
                ),
              );
            },
          )
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 16, bottom: 100),
            child: Column(
              children: [
                ResultVideoHeaderWidget(thumbnailUrl: resultData.videoThumbnailUrl, exerciseName: resultData.exerciseName),
                const SizedBox(height: 24),
                ScoreCardWidget(score: resultData.overallScore, title: resultData.performanceTitle, subtitle: resultData.performanceSubtitle),
                const SizedBox(height: 24),
                ...resultData.metrics.map((metric) => MetricTileWidget(metric: metric)).toList(),
                const SizedBox(height: 24),
                AiCuesWidget(cues: resultData.aiCues),
                const SizedBox(height: 24),
                CoachTipWidget(coachName: resultData.coachName, tip: resultData.coachTip, avatarUrl: resultData.coachAvatarUrl),
              ],
            ),
          ),
          
          // زر إعادة التسجيل الثابت في الأسفل مع الخلفية التدرجية الاحترافية المتناسقة مع واجهة التطبيق
          Positioned(
            bottom: 24,
            left: 20,
            right: 20,
            child: Container(
              width: double.infinity,
              height: 56,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.primaryLight, 
                    AppColors.primary,      
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ElevatedButton.icon(
                onPressed: () {
                  // تم التعديل هنا: الانتقال لصفحة AIScreen
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const AiHubResultScreen()),
                  );
                },
                icon: const Icon(Icons.videocam, color: Colors.white),
                label: Text(l10n.re_record_set, style: AppTextStyles.primaryButton16),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent, 
                  shadowColor: Colors.transparent,     
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  elevation: 0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}