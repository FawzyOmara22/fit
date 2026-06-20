import 'package:flutter/material.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import '../../../core/theme/app_colors.dart';

class OnboardingCard extends StatelessWidget {
  final IconData icon;
  final String tag;
  final String title;
  final String body;

  const OnboardingCard({super.key, required this.icon, required this.tag, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.lightGray.withOpacity(0.5)),
        boxShadow: const [BoxShadow(color: Color(0x08000000), blurRadius: 15, offset: Offset(0, 5))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: AppColors.primary10, borderRadius: BorderRadius.circular(14)),
                child: Icon(icon, color: AppColors.primary, size: 24),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(color: AppColors.primary10, borderRadius: BorderRadius.circular(20)),
                child: Text(tag, style: AppTextStyles.label10Blue.copyWith(fontSize: 12, letterSpacing: -0.30)),
              ),
            ],
          ),
          const Spacer(),
          Text(title, style: AppTextStyles.title18Dark.copyWith(fontWeight: FontWeight.w400)),
          const SizedBox(height: 8),
          Text(body, style: AppTextStyles.body14Height),
        ],
      ),
    );
  }
}