import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/onboarding/provider/onboarding_provider.dart';
import 'package:kinetic/features/onboarding/screens/step7_physical_constraints_screen.dart';
import 'package:provider/provider.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/shared_widgets/custom_gradient_button.dart';
import '../widgets/experience_card.dart';
import '../widgets/onboarding_top_bar.dart';

class Step6ExperienceScreen extends StatelessWidget {
  const Step6ExperienceScreen({super.key});

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
              child: OnboardingTopBar(stepText: l10n.step_6_of_14, onSkip: () {}),
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
                      Text(l10n.onboarding_label, style: AppTextStyles.label10Blue.copyWith(letterSpacing: 2)),
                      const SizedBox(height: 8),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: l10n.whats_your_experience_p1, style: AppTextStyles.heading36Black.copyWith(letterSpacing: -0.75)),
                            TextSpan(text: l10n.whats_your_experience_p2, style: AppTextStyles.heading36Primary.copyWith(letterSpacing: -0.75)),
                            TextSpan(text: l10n.whats_your_experience_p3, style: AppTextStyles.heading36Black.copyWith(letterSpacing: -0.75)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(l10n.experience_subtitle, style: AppTextStyles.body16),
                      const SizedBox(height: 32),

                      ExperienceCard(icon: Icons.fitness_center, title: l10n.beginner, description: l10n.beginner_desc, isSelected: onboardingProvider.experienceLevel == 'Beginner', onTap: () => onboardingProvider.setExperienceLevel('Beginner')),
                      ExperienceCard(icon: Icons.open_in_full, title: l10n.intermediate, description: l10n.intermediate_desc, isSelected: onboardingProvider.experienceLevel == 'Intermediate', onTap: () => onboardingProvider.setExperienceLevel('Intermediate')),
                      ExperienceCard(icon: Icons.trending_up, title: l10n.advanced, description: l10n.advanced_desc, isSelected: onboardingProvider.experienceLevel == 'Advanced', onTap: () => onboardingProvider.setExperienceLevel('Advanced')),
                      ExperienceCard(icon: Icons.emoji_events_outlined, title: l10n.elite, description: l10n.elite_desc, isSelected: onboardingProvider.experienceLevel == 'Elite', onTap: () => onboardingProvider.setExperienceLevel('Elite')),
                      
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: CustomGradientButton(text: l10n.button_continue, onPressed: onboardingProvider.experienceLevel != null ? () { Navigator.push(context, MaterialPageRoute(builder: (_) => const Step7PhysicalConstraintsScreen())); } : () {}),
            ),
          ],
        ),
      ),
    );
  }
}