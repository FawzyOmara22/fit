import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/onboarding/provider/onboarding_provider.dart';
import 'package:kinetic/features/onboarding/screens/step8_schedule_screen.dart';
import 'package:provider/provider.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/shared_widgets/custom_gradient_button.dart';
import '../widgets/affected_area_card.dart';
import '../widgets/onboarding_top_bar.dart';

class Step7PhysicalConstraintsScreen extends StatelessWidget {
  const Step7PhysicalConstraintsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final onboardingProvider = context.watch<OnboardingProvider>();

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      resizeToAvoidBottomInset: true, 
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
              child: OnboardingTopBar(stepText: l10n.step_7_of_14, onSkip: () {}),
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
                      Text(l10n.physical_constraints_label, style: AppTextStyles.label10Blue.copyWith(fontSize: 14, letterSpacing: -0.35)),
                      const SizedBox(height: 8),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: l10n.identify_constraints_p1, style: AppTextStyles.heading36Black.copyWith(letterSpacing: -0.70)),
                            TextSpan(text: l10n.identify_constraints_p2, style: AppTextStyles.heading36Primary.copyWith(letterSpacing: -0.70)),
                            TextSpan(text: l10n.identify_constraints_p3, style: AppTextStyles.heading36Black.copyWith(letterSpacing: -0.70)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(l10n.constraints_subtitle, style: AppTextStyles.body14WithHeight.copyWith(fontWeight: FontWeight.w500, height: 1.63)),
                      const SizedBox(height: 32),

                      GestureDetector(
                        onTap: () => onboardingProvider.toggleNoInjuries(),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200), padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            gradient: onboardingProvider.hasNoInjuries ? const LinearGradient(colors: [AppColors.primaryDark, AppColors.primaryLight], begin: Alignment.centerLeft, end: Alignment.centerRight) : null,
                            color: onboardingProvider.hasNoInjuries ? null : Colors.white,
                            borderRadius: BorderRadius.circular(24),
                            boxShadow: onboardingProvider.hasNoInjuries ? [] : [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))],
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(color: onboardingProvider.hasNoInjuries ? Colors.white.withOpacity(0.2) : AppColors.inputBackground, shape: BoxShape.circle),
                                child: Icon(onboardingProvider.hasNoInjuries ? Icons.keyboard_arrow_down : Icons.check_circle_outline, color: onboardingProvider.hasNoInjuries ? Colors.white : AppColors.primary, size: 20),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(l10n.none_no_injuries, style: AppTextStyles.cardTitle14.copyWith(color: onboardingProvider.hasNoInjuries ? Colors.white : AppColors.darkCharcoal, fontSize: 16)),
                                    const SizedBox(height: 4),
                                    Text(l10n.ready_for_full_intensity, style: TextStyle(color: onboardingProvider.hasNoInjuries ? Colors.white.withOpacity(0.7) : AppColors.textGrey, fontSize: 10, fontFamily: 'Inter', fontWeight: FontWeight.w500, letterSpacing: 0.25)),
                                  ],
                                ),
                              ),
                              Icon(Icons.chevron_right, color: onboardingProvider.hasNoInjuries ? Colors.white : AppColors.borderDark),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 32),

                      Opacity(
                        opacity: onboardingProvider.hasNoInjuries ? 0.4 : 1.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(l10n.select_affected_areas, style: AppTextStyles.label10Grey.copyWith(letterSpacing: 1.50)),
                            const SizedBox(height: 16),
                            GridView.count(
                              crossAxisCount: 2, shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), mainAxisSpacing: 16, crossAxisSpacing: 16, childAspectRatio: 1.1,
                              children: [
                                AffectedAreaCard(icon: Icons.accessibility_new, title: l10n.lower_back, isSelected: onboardingProvider.affectedAreas.contains('Lower Back'), onTap: () => onboardingProvider.toggleAffectedArea('Lower Back')),
                                AffectedAreaCard(icon: Icons.airline_seat_legroom_extra, title: l10n.knees, isSelected: onboardingProvider.affectedAreas.contains('Knees'), onTap: () => onboardingProvider.toggleAffectedArea('Knees')),
                                AffectedAreaCard(icon: Icons.fitness_center, title: l10n.shoulders, isSelected: onboardingProvider.affectedAreas.contains('Shoulders'), onTap: () => onboardingProvider.toggleAffectedArea('Shoulders')),
                                AffectedAreaCard(icon: Icons.back_hand, title: l10n.wrists, isSelected: onboardingProvider.affectedAreas.contains('Wrists'), onTap: () => onboardingProvider.toggleAffectedArea('Wrists')),
                                AffectedAreaCard(icon: Icons.do_not_step, title: l10n.ankles, isSelected: onboardingProvider.affectedAreas.contains('Ankles'), onTap: () => onboardingProvider.toggleAffectedArea('Ankles')),
                                AffectedAreaCard(icon: Icons.person, title: l10n.neck, isSelected: onboardingProvider.affectedAreas.contains('Neck'), onTap: () => onboardingProvider.toggleAffectedArea('Neck')),
                              ],
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 40),

                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(color: AppColors.inputBackground, borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          children: [
                            ClipRRect(borderRadius: BorderRadius.circular(12), child: Image.asset('assets/images/Container.png', width: 60, height: 60, fit: BoxFit.cover)),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(l10n.ai_adaptive_planning, style: AppTextStyles.cardTitle14.copyWith(fontSize: 16, fontWeight: FontWeight.w800)),
                                  const SizedBox(height: 4),
                                  Text(l10n.ai_adaptive_planning_desc, style: AppTextStyles.body14WithHeight.copyWith(fontSize: 11)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: CustomGradientButton(text: 'CONTINUE', onPressed: (onboardingProvider.hasNoInjuries || onboardingProvider.affectedAreas.isNotEmpty) ? () { Navigator.push(context, MaterialPageRoute(builder: (context) => const Step8ScheduleScreen())); } : () {}),
            ),
          ],
        ),
      ),
    );
  }
}