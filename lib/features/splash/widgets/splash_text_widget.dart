import 'package:flutter/material.dart'; // سطر استيراد الترجمة
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart'; 

class SplashTextWidget extends StatelessWidget {
  const SplashTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          // هيقرأ كلمة KINETIC أو كينيتك تلقائياً حسب اللغة
          AppLocalizations.of(context)!.kinetic, 
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: AppColors.darkCharcoal, // 0xFF2D2E33
            fontSize: 70.20,
            fontStyle: FontStyle.italic,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w900,
            height: 1,
            letterSpacing: -3.51,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          // هيقرأ السطر الترحيبي بالعربي أو الإنجليزي تلقائياً
          AppLocalizations.of(context)!.tagline, 
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: AppColors.grayText, // 0xFF5B5B60
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
            height: 1.43,
            letterSpacing: 4.20,
          ),
        ),
      ],
    );
  }
}