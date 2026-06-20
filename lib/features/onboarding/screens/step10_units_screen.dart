import 'package:flutter/material.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/onboarding/screens/step11_processing_screen.dart';
import 'package:provider/provider.dart';
import 'package:kinetic/core/l10n/app_localizations.dart'; 
import '../../../core/theme/app_colors.dart';
import '../../../core/shared_widgets/custom_gradient_button.dart'; 
import '../provider/onboarding_provider.dart';
import '../widgets/unit_selection_card.dart'; 
import '../widgets/onboarding_top_bar.dart'; // 👈 استدعاء الشريط الموحد

class Step10UnitsScreen extends StatelessWidget {
  const Step10UnitsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final provider = context.watch<OnboardingProvider>();

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: Column(
          children: [
            // 1. الهيدر الموحد
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
              child: OnboardingTopBar(
                stepText: l10n.step_10_of_14, 
                onSkip: () {
                    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const Step11ProcessingScreen(), // 👈 غير HomeScreen باسم صفحتك
      ),
    );
                }, 
              ),
            ),

            // 2. المحتوى
            Expanded(
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 32),

                      // العنوان الرئيسي
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: l10n.set_your_units_p1, style: AppTextStyles.heading36Black.copyWith(fontSize: 40, letterSpacing: -1)),
                            TextSpan(text: l10n.set_your_units_p2, style: AppTextStyles.heading36Primary.copyWith(fontSize: 40, letterSpacing: -1)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),

                      // الوصف
                      Text(
                        l10n.set_your_units_desc,
                        style: AppTextStyles.body16.copyWith(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 40),

                      // --- قسم الوزن ---
                      Text(
                        l10n.weight_label,
                        style: AppTextStyles.label10GreyDark,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: UnitSelectionCard(
                              title: l10n.kilograms,
                              subtitle: l10n.kg_abbr,
                              centerIcon: Icons.scale_outlined, 
                              isSelected: provider.weightUnit == 'KG',
                              onTap: () => provider.setWeightUnit('KG'),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: UnitSelectionCard(
                              title: l10n.pounds,
                              subtitle: l10n.lbs_abbr,
                              centerIcon: Icons.fitness_center_outlined, 
                              isSelected: provider.weightUnit == 'LBS',
                              onTap: () => provider.setWeightUnit('LBS'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),

                      // --- قسم المسافة ---
                      Text(
                        l10n.distance_label,
                        style: AppTextStyles.label10GreyDark,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: UnitSelectionCard(
                              title: l10n.kilometers,
                              subtitle: l10n.km_abbr,
                              centerIcon: Icons.straighten_outlined, 
                              isSelected: provider.distanceUnit == 'KM',
                              onTap: () => provider.setDistanceUnit('KM'),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: UnitSelectionCard(
                              title: l10n.miles,
                              subtitle: l10n.mi_abbr,
                              centerIcon: Icons.route_outlined, 
                              isSelected: provider.distanceUnit == 'MI',
                              onTap: () => provider.setDistanceUnit('MI'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),

                      // --- صندوق المعلومات (Info Box) ---
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.insightBg, 
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.info_outline, color: AppColors.primary, size: 24),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                l10n.units_info_desc,
                                style: AppTextStyles.body14WithHeight,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ),

            // 3. الفوتر (الزر)
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: CustomGradientButton(
                text: 'CONTINUE',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Step11ProcessingScreen(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}