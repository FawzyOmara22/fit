import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/onboarding/provider/onboarding_provider.dart';
import 'package:provider/provider.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/shared_widgets/custom_gradient_button.dart';
import '../widgets/gender_card.dart';
import '../widgets/onboarding_top_bar.dart';
import 'step4_weight_screen.dart';

class Step3GenderScreen extends StatelessWidget {
  const Step3GenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final onboardingProvider = context.watch<OnboardingProvider>();

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
              child: OnboardingTopBar(
                stepText: l10n.step_3_of_14,
                onSkip: () {},
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 32),
                      Text(l10n.onboarding_label, style: AppTextStyles.label10Blue.copyWith(letterSpacing: 1.50)),
                      const SizedBox(height: 8),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: l10n.what_is_your_gender_p1, style: AppTextStyles.heading36Black),
                            TextSpan(text: l10n.what_is_your_gender_p2, style: AppTextStyles.heading36Primary),
                            TextSpan(text: l10n.what_is_your_gender_p3, style: AppTextStyles.heading36Black),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(l10n.gender_subtitle, style: AppTextStyles.body16),
                      const SizedBox(height: 40),
                      GenderCard(icon: Icons.male, title: l10n.male, subtitle: l10n.physiological, isSelected: onboardingProvider.gender == 'Male', onTap: () => onboardingProvider.setGender('Male')),
                      GenderCard(icon: Icons.female, title: l10n.female, subtitle: l10n.physiological, isSelected: onboardingProvider.gender == 'Female', onTap: () => onboardingProvider.setGender('Female')),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: Column(
                children: [
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.lock_outline, size: 14, color: Color(0x7F5B5B60)),
                        const SizedBox(width: 6),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(text: l10n.privacy_policy_p1),
                              TextSpan(text: l10n.privacy_policy_p2, style: const TextStyle(fontWeight: FontWeight.w600, decoration: TextDecoration.underline)),
                              TextSpan(text: l10n.privacy_policy_p3),
                            ],
                          ),
                          style: AppTextStyles.caption12.copyWith(color: const Color(0x7F5B5B60)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  CustomGradientButton(
                    text: l10n.button_continue,
                    onPressed: onboardingProvider.gender != null ? () { Navigator.push(context, MaterialPageRoute(builder: (_) => const Step4WeightScreen())); } : () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}