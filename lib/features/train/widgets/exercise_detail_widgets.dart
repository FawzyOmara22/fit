import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart'; // تأكد من مسار الترجمة
import '../../../../core/theme/app_colors.dart'; // تأكد من المسار
import '../../../../core/theme/app_text_style.dart'; // تأكد من المسار

class ExerciseVideoHeader extends StatelessWidget {
  final String imageUrl;
  
  const ExerciseVideoHeader({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Container(
      height: 220,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          // التظليل عشان التيكست والزرار يبانوا بوضوح
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Colors.black.withOpacity(0.6), Colors.transparent],
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white.withOpacity(0.3)),
              ),
              child: Text(
                l10n.exerciseVideo.toUpperCase(),
                style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1),
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.play_arrow, color: AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }
}

class PersonalBestCard extends StatelessWidget {
  const PersonalBestCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(l10n.personalBest, style: const TextStyle(color: AppColors.textGrey, fontSize: 10, fontWeight: FontWeight.w700, letterSpacing: 1)),
              const Icon(Icons.emoji_events, color: AppColors.primary, size: 16),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              const Text('225', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: AppColors.darkCharcoal)),
              const SizedBox(width: 4),
              Text(l10n.lbs, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.textGrey)),
            ],
          ),
          const SizedBox(height: 4),
          Text(l10n.achievedDate, style: const TextStyle(fontSize: 12, color: AppColors.textGrey)),
        ],
      ),
    );
  }
}

class TargetedMusclesSection extends StatelessWidget {
  const TargetedMusclesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.targetedMuscles, style: const TextStyle(color: AppColors.textGrey, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
        const SizedBox(height: 12),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Primary Muscle
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l10n.primaryMuscle, style: const TextStyle(color: AppColors.primary, fontSize: 8, fontWeight: FontWeight.bold, letterSpacing: 1)),
                  const SizedBox(height: 8),
                  Container(
                    height: 90,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.primaryLight, // غيرها لدرجة الأزرق المناسبة من ملف ألوانك
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.accessibility_new, color: Colors.white, size: 20),
                        Text(l10n.chest, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w800)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            // Secondary Muscles
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l10n.secondaryMuscle, style: const TextStyle(color: AppColors.textGrey, fontSize: 8, fontWeight: FontWeight.bold, letterSpacing: 1)),
                  const SizedBox(height: 8),
                  _buildSecondaryPill(l10n.frontDeltoids),
                  const SizedBox(height: 8),
                  _buildSecondaryPill(l10n.tricepsBrachii),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSecondaryPill(String name) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.inputBackground, // الرمادي الفاتح
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name, style: const TextStyle(color: AppColors.darkCharcoal, fontSize: 12, fontWeight: FontWeight.w700)),
          Container(width: 6, height: 6, decoration: const BoxDecoration(color: AppColors.primaryLight, shape: BoxShape.circle)),
        ],
      ),
    );
  }
}

class HowToPerformStep extends StatelessWidget {
  final String stepNum;
  final String title;
  final String description;

  const HowToPerformStep({Key? key, required this.stepNum, required this.title, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(stepNum, style: const TextStyle(color: AppColors.primary, fontSize: 16, fontWeight: FontWeight.w900)),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: AppColors.darkCharcoal, fontSize: 16, fontWeight: FontWeight.w800)),
                const SizedBox(height: 6),
                Text(description, style: const TextStyle(color: AppColors.textGrey, fontSize: 13, height: 1.5)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProFormTipsCard extends StatelessWidget {
  const ProFormTipsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.insightBg, // لون الخلفية اللبني الفاتح
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(8)),
                    child: const Icon(Icons.lightbulb_outline, color: Colors.white, size: 16),
                  ),
                  const SizedBox(width: 12),
                  Text(l10n.proFormTips, style: const TextStyle(color: AppColors.darkCharcoal, fontSize: 16, fontWeight: FontWeight.w800)),
                ],
              ),
              Icon(Icons.verified, color: AppColors.textGrey.withOpacity(0.2), size: 36), // Watermark icon
            ],
          ),
          const SizedBox(height: 20),
          _buildTipRow(l10n.tip1),
          const SizedBox(height: 12),
          _buildTipRow(l10n.tip2),
          const SizedBox(height: 12),
          _buildTipRow(l10n.tip3),
        ],
      ),
    );
  }

  Widget _buildTipRow(String tip) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 2),
          child: Icon(Icons.check_circle, color: AppColors.primary, size: 14),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(tip, style: const TextStyle(color: AppColors.deepSlate, fontSize: 13, height: 1.5, fontWeight: FontWeight.w500)),
        ),
      ],
    );
  }
}