import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/Ai/models/analysis_result_model.dart';

// 1. هيدر الفيديو
class ResultVideoHeaderWidget extends StatelessWidget {
  final String thumbnailUrl;
  final String exerciseName;

  const ResultVideoHeaderWidget({Key? key, required this.thumbnailUrl, required this.exerciseName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Container(
      height: 320,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        image: DecorationImage(image: NetworkImage(thumbnailUrl), fit: BoxFit.cover),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.black.withOpacity(0.3),
        ),
        child: Stack(
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.3), shape: BoxShape.circle),
                child: const Icon(Icons.play_arrow, color: Colors.white, size: 40),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(color: Colors.black.withOpacity(0.7), borderRadius: BorderRadius.circular(12)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(l10n.exercise_label, style: AppTextStyles.label10Grey.copyWith(color: Colors.white70)),
                    const SizedBox(height: 4),
                    Text(exerciseName, style: AppTextStyles.body16.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// 2. كارت النتيجة الدائري
class ScoreCardWidget extends StatelessWidget {
  final int score;
  final String title;
  final String subtitle;

  const ScoreCardWidget({Key? key, required this.score, required this.title, required this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(24)),
      child: Column(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.successGreen, width: 6),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // تم استخدام الـ $ لدمج الرقم مع علامة الـ % مباشرة
                Text("$score%", style: AppTextStyles.heading24.copyWith(fontSize: 32, fontWeight: FontWeight.w900)),
                Text(l10n.great_form, style: AppTextStyles.label10Grey.copyWith(fontSize: 9, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Text(title, style: AppTextStyles.heading24.copyWith(fontSize: 20, fontWeight: FontWeight.w800)),
          const SizedBox(height: 8),
          Text(subtitle, style: AppTextStyles.body14NoHeight.copyWith(color: AppColors.textGrey)),
        ],
      ),
    );
  }
}

// 3. كارت القياسات (العمق، المسار، إلخ)
class MetricTileWidget extends StatelessWidget {
  final MetricModel metric;

  const MetricTileWidget({Key? key, required this.metric}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    String getLocalizedLabel(String key) {
      if (key == 'metric_depth') return l10n.metric_depth;
      if (key == 'metric_bar_path') return l10n.metric_bar_path;
      if (key == 'metric_back_angle') return l10n.metric_back_angle;
      return key; 
    }

    IconData getIcon(String key) {
      if (key == 'metric_depth') return Icons.height;
      if (key == 'metric_bar_path') return Icons.show_chart;
      return Icons.straighten;
    }

    bool isSuccess = metric.status == 'success';

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppColors.surfaceColor, borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(8)),
            child: Icon(getIcon(metric.labelKey), color: AppColors.primary, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(getLocalizedLabel(metric.labelKey), style: AppTextStyles.label10Grey),
                const SizedBox(height: 4),
                Text(metric.value, style: AppTextStyles.body16.copyWith(fontWeight: FontWeight.bold, color: AppColors.darkCharcoal)),
              ],
            ),
          ),
          Icon(
            isSuccess ? Icons.check_circle_outline : Icons.warning_amber_rounded,
            color: isSuccess ? AppColors.successGreen : AppColors.warningYellow,
          )
        ],
      ),
    );
  }
}

// 4. كارت توجيهات الذكاء الاصطناعي
class AiCuesWidget extends StatelessWidget {
  final List<String> cues;

  const AiCuesWidget({Key? key, required this.cues}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: AppColors.surfaceColor, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.psychology, color: AppColors.primary),
              const SizedBox(width: 8),
              Text(l10n.ai_technique_cues, style: AppTextStyles.title18Dark),
            ],
          ),
          const SizedBox(height: 16),
          ...cues.map((cue) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 6, right: 8),
                      child: Icon(Icons.circle, size: 6, color: AppColors.primary),
                    ),
                    Expanded(child: Text(cue, style: AppTextStyles.body14Height)),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

// 5. كارت نصيحة المدرب
class CoachTipWidget extends StatelessWidget {
  final String coachName;
  final String tip;
  final String avatarUrl;

  const CoachTipWidget({Key? key, required this.coachName, required this.tip, required this.avatarUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.primary.withOpacity(0.1)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(radius: 24, backgroundImage: NetworkImage(avatarUrl)),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // تم استخدام الـ $ لدمج الترجمة مع اسم المدرب
                Text(
                  "${l10n.coach_tip_label} ${coachName.toUpperCase()}", 
                  style: AppTextStyles.label10Grey.copyWith(color: AppColors.primary, fontWeight: FontWeight.bold)
                ),
                const SizedBox(height: 8),
                // تم وضع النصيحة بين علامتين تنصيص
                Text(
                  '"$tip"', 
                  style: AppTextStyles.body14Height.copyWith(fontStyle: FontStyle.italic)
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}