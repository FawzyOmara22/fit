import 'package:flutter/material.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';

// 1. الدائرة الكبيرة الخاصة بنسبة الرفع
class ProgressCircleWidget extends StatelessWidget {
  final int percentage;
  final String uploadedText; // بتيجي من الترجمة

  const ProgressCircleWidget({Key? key, required this.percentage, required this.uploadedText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      height: 220,
      decoration: BoxDecoration(
        color: AppColors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryLight.withOpacity(0.15),
            blurRadius: 40,
            spreadRadius: 10,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$percentage%",
            style: AppTextStyles.timerHuge80.copyWith(fontSize: 64, height: 1.0),
          ),
          const SizedBox(height: 8),
          Text(
            uploadedText,
            style: AppTextStyles.label10Grey.copyWith(letterSpacing: 2),
          ),
        ],
      ),
    );
  }
}

// 2. شريحة اسم الملف
class FileChipWidget extends StatelessWidget {
  final String fileName;

  const FileChipWidget({Key? key, required this.fileName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.surfaceColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.insert_drive_file_outlined, size: 14, color: AppColors.textGrey),
          const SizedBox(width: 8),
          Text(
            fileName,
            style: AppTextStyles.body14NoHeight.copyWith(color: AppColors.textGrey),
          ),
        ],
      ),
    );
  }
}

// 3. كارت النصيحة الاحترافية (Pro Insight Card)
class ProInsightDetailsCard extends StatelessWidget {
  final String focusLabel;
  final String title;
  final String description;
  final String coachName;
  final String coachTitle;
  final String avatarUrl;

  const ProInsightDetailsCard({
    Key? key,
    required this.focusLabel,
    required this.title,
    required this.description,
    required this.coachName,
    required this.coachTitle,
    required this.avatarUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(focusLabel, style: AppTextStyles.sectionLabel),
          const SizedBox(height: 12),
          Text(title, style: AppTextStyles.cardTitle18.copyWith(fontSize: 20)),
          const SizedBox(height: 12),
          Text(description, style: AppTextStyles.body14Height),
          const SizedBox(height: 24),
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(avatarUrl),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(coachName, style: AppTextStyles.body14NoHeight.copyWith(color: AppColors.darkCharcoal, fontWeight: FontWeight.bold)),
                  Text(coachTitle, style: AppTextStyles.caption12.copyWith(color: AppColors.textGrey)),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

// 4. كارت وقت الانتظار وكارت هل تعلم
class InfoCardsRowWidget extends StatelessWidget {
  final int waitSeconds;
  final String waitTimeLabel;
  final String secondsLabel;
  final String didYouKnowLabel;
  final String factText;

  const InfoCardsRowWidget({
    Key? key,
    required this.waitSeconds,
    required this.waitTimeLabel,
    required this.secondsLabel,
    required this.didYouKnowLabel,
    required this.factText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // كارت وقت الانتظار (رصاصي)
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.surfaceColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.timer_outlined, color: AppColors.primary, size: 20),
                const SizedBox(height: 12),
                Text(waitTimeLabel, style: AppTextStyles.label10Grey.copyWith(letterSpacing: 1)),
                const SizedBox(height: 8),
                Text("~$waitSeconds", style: AppTextStyles.heading24.copyWith(fontWeight: FontWeight.bold)),
                Text(secondsLabel, style: AppTextStyles.body16.copyWith(color: AppColors.darkCharcoal, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        ),
        const SizedBox(width: 16),
        // كارت هل تعلم (أزرق)
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.flash_on, color: AppColors.white, size: 20),
                const SizedBox(height: 12),
                Text(didYouKnowLabel, style: AppTextStyles.label10Grey.copyWith(color: AppColors.white70, letterSpacing: 1)),
                const SizedBox(height: 8),
                Text(
                  factText,
                  style: AppTextStyles.body14Height.copyWith(color: AppColors.white, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}