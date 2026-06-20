import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/onboarding/provider/onboarding_provider.dart';
import 'package:kinetic/features/onboarding/screens/step2_age_screen.dart';
import 'package:provider/provider.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/shared_widgets/custom_gradient_button.dart';
import '../widgets/goal_option_card.dart';
import '../widgets/onboarding_top_bar.dart';

class Step1GoalScreen extends StatelessWidget {
  const Step1GoalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final onboardingProvider = context.watch<OnboardingProvider>();
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              OnboardingTopBar(
                stepText: l10n.step_1_of_14,
                onSkip: () {
                  Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const Step2AgeScreen(), // 👈 غير HomeScreen باسم صفحتك
      ),
    );
                },
              ),
              const SizedBox(height: 32),

              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: l10n.onb_step1_title_p1, style: AppTextStyles.heading36Black.copyWith(fontSize: 32, letterSpacing: -0.48)),
                    TextSpan(text: l10n.onb_step1_title_p2, style: AppTextStyles.heading36Primary.copyWith(fontSize: 32, letterSpacing: -0.48)),
                    TextSpan(text: l10n.onb_step1_title_p3, style: AppTextStyles.heading36Black.copyWith(fontSize: 32, letterSpacing: -0.48)),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Text(l10n.onb_step1_subtitle, style: AppTextStyles.body16),
              const SizedBox(height: 32),

              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    GoalOptionCard(icon: Icons.fitness_center, title: l10n.goal_build_muscle_title, subtitle: l10n.goal_build_muscle_desc, isSelected: onboardingProvider.primaryGoal == 'Build Muscle', onTap: () => onboardingProvider.setPrimaryGoal('Build Muscle')),
                    GoalOptionCard(icon: Icons.bolt, title: l10n.goal_inc_strength_title, subtitle: l10n.goal_inc_strength_desc, isSelected: onboardingProvider.primaryGoal == 'Increase Strength', onTap: () => onboardingProvider.setPrimaryGoal('Increase Strength')),
                    GoalOptionCard(icon: Icons.local_fire_department_outlined, title: l10n.goal_lose_weight_title, subtitle: l10n.goal_lose_weight_desc, isSelected: onboardingProvider.primaryGoal == 'Lose Weight', onTap: () => onboardingProvider.setPrimaryGoal('Lose Weight')),
                    GoalOptionCard(icon: Icons.directions_run, title: l10n.goal_improve_endurance_title, subtitle: l10n.goal_improve_endurance_desc, isSelected: onboardingProvider.primaryGoal == 'Improve Endurance', onTap: () => onboardingProvider.setPrimaryGoal('Improve Endurance')),
                    
                    const SizedBox(height: 16),
                    
                    Container(
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: const DecorationImage(image: AssetImage('assets/images/Background.png'), fit: BoxFit.cover, opacity: 0.3),
                      ),
                      alignment: Alignment.bottomLeft,
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Container(width: 6, height: 6, decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle)),
                          const SizedBox(width: 8),
                          Text(l10n.protocol_engine_active, style: AppTextStyles.insightTitle.copyWith(fontSize: 9, color: AppColors.primary)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 24.0, top: 16.0),
                child: CustomGradientButton(
                  text: l10n.button_continue, 
                  onPressed: onboardingProvider.primaryGoal != null ? () { Navigator.push(context, MaterialPageRoute(builder: (_) => const Step2AgeScreen())); } : () {}, 
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}