import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';

class OnboardingTopBar extends StatelessWidget {
  final String stepText; // زي: "STEP 1 OF 14"
  final VoidCallback? onSkip;

  const OnboardingTopBar({
    super.key,
    required this.stepText,
    this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    // شيلنا الـ Padding من هنا علشان نتحكم فيه من الشاشة براحتنا
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back, color: AppColors.primary),
        ),
        Text(
          stepText,
          style: AppTextStyles.topBarStep,
        ),
        GestureDetector(
          onTap: onSkip ?? () {}, // لو مبعتش دالة الـ Skip مش هيعمل إيرور
          child: Text(
            l10n.skip,
            style: AppTextStyles.topBarSkip,
          ),
        ),
      ],
    );
  }
}