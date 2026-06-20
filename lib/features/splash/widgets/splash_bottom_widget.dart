import 'package:flutter/material.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/features/splash/provider/splash_provider.dart';
import 'package:provider/provider.dart';



class SplashBottomWidget extends StatelessWidget {
  const SplashBottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // شريط التحميل المربوط بالـ Provider
        Consumer<SplashProvider>(
          builder: (context, provider, child) {
            return LinearProgressIndicator(
              value: provider.progress,
              backgroundColor: AppColors.lightGray,
              color: AppColors.primary,
              minHeight: 4,
              borderRadius: BorderRadius.circular(4),
            );
          },
        ),
        const SizedBox(height: 24),
        // نصوص الإصدار والتاريخ
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'EST. 2024',
              style: TextStyle(
                color: Color(0xFFADACB2), 
                fontSize: 12,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                letterSpacing: 2.40,
              ),
            ),
            const SizedBox(width: 16),
            // النقطة اللي في النص
            Container(
              width: 4,
              height: 4,
              decoration: const BoxDecoration(
                color: Color(0xFFADACB2),
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 16),
            const Text(
              'V2.1.0',
              style: TextStyle(
                color: Color(0xFFADACB2),
                fontSize: 12,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                letterSpacing: 2.40,
              ),
            ),
          ],
        ),
      ],
    );
  }
}