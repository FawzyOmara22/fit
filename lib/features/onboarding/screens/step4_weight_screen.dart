import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/onboarding/provider/onboarding_provider.dart';
import 'package:kinetic/features/onboarding/screens/step5_height_screen.dart';
import 'package:provider/provider.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/shared_widgets/custom_gradient_button.dart';
import '../widgets/weight_ruler.dart';
import '../widgets/onboarding_top_bar.dart';

class Step4WeightScreen extends StatefulWidget {
  const Step4WeightScreen({super.key});

  @override
  State<Step4WeightScreen> createState() => _Step4WeightScreenState();
}

class _Step4WeightScreenState extends State<Step4WeightScreen> {
  double _currentWeight = 75.5; 

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<OnboardingProvider>().setWeight(_currentWeight);
    });
  }

  void _toggleUnit(String newUnit, OnboardingProvider provider) {
    if (provider.weightUnit == newUnit) return; 
    setState(() {
      if (newUnit == 'LB') _currentWeight = double.parse((_currentWeight * 2.20462).toStringAsFixed(1));
      else _currentWeight = double.parse((_currentWeight / 2.20462).toStringAsFixed(1));
    });
    provider.setWeightUnit(newUnit);
    provider.setWeight(_currentWeight);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final onboardingProvider = context.watch<OnboardingProvider>();
    final isKG = onboardingProvider.weightUnit == 'KG';

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              OnboardingTopBar(stepText: l10n.step_4_of_14, onSkip: () {}),
              const SizedBox(height: 32),
              
              Align(alignment: AlignmentDirectional.centerStart, child: Text(l10n.biometrics, style: AppTextStyles.label10Blue.copyWith(letterSpacing: 1.50))),
              const SizedBox(height: 8),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: l10n.what_is_your_current_weight_p1),
                      TextSpan(text: l10n.what_is_your_current_weight_p2, style: const TextStyle(color: AppColors.primary)),
                      TextSpan(text: l10n.what_is_your_current_weight_p3),
                    ],
                  ),
                  style: AppTextStyles.heading36Black.copyWith(letterSpacing: -0.90, height: 1.25),
                ),
              ),

              const Spacer(flex: 1),

              Container(
                width: 160, height: 44,
                decoration: BoxDecoration(color: AppColors.inputBackground, borderRadius: BorderRadius.circular(22)),
                child: Stack(
                  children: [
                    AnimatedAlign(
                      duration: const Duration(milliseconds: 150), curve: Curves.easeInOut, 
                      alignment: isKG ? Alignment.centerLeft : Alignment.centerRight,
                      child: Container(
                        width: 80, height: 44,
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(22), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4, offset: const Offset(0, 2))]),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(child: GestureDetector(behavior: HitTestBehavior.opaque, onTap: () => _toggleUnit('KG', onboardingProvider), child: Center(child: Text(l10n.kg, style: AppTextStyles.body14NoHeight.copyWith(color: isKG ? AppColors.primary : AppColors.textGrey, fontWeight: FontWeight.w700))))),
                        Expanded(child: GestureDetector(behavior: HitTestBehavior.opaque, onTap: () => _toggleUnit('LB', onboardingProvider), child: Center(child: Text(l10n.lb, style: AppTextStyles.body14NoHeight.copyWith(color: !isKG ? AppColors.primary : AppColors.textGrey, fontWeight: FontWeight.w700))))),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              Row(
                mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.baseline, textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(_currentWeight.toStringAsFixed(1), style: const TextStyle(color: AppColors.primary, fontSize: 72, fontFamily: 'Inter', fontWeight: FontWeight.w900, height: 1, letterSpacing: -3.60)),
                  const SizedBox(width: 4),
                  Text(onboardingProvider.weightUnit, style: const TextStyle(color: AppColors.primaryLight, fontSize: 24, fontFamily: 'Inter', fontWeight: FontWeight.w700)),
                ],
              ),
              const SizedBox(height: 24),

              WeightRuler(
                key: ValueKey(onboardingProvider.weightUnit), 
                initialWeight: _currentWeight,
                minWeight: isKG ? 30 : 66,
                maxWeight: isKG ? 150 : 330,
                onChanged: (val) {
                  setState(() { _currentWeight = double.parse(val.toStringAsFixed(1)); });
                  onboardingProvider.setWeight(_currentWeight);
                },
              ),
              const SizedBox(height: 48), 

              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: const [BoxShadow(color: Color(0x0A000000), blurRadius: 20, offset: Offset(0, 10))]),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(padding: const EdgeInsets.all(10), decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.1), shape: BoxShape.circle), child: const Icon(Icons.timeline, color: AppColors.primary, size: 22)),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(l10n.metabolic_calibration_title, style: AppTextStyles.cardTitle18),
                          const SizedBox(height: 8),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(text: l10n.metabolic_calibration_desc_p1),
                                TextSpan(text: l10n.metabolic_calibration_desc_p2, style: const TextStyle(color: AppColors.darkCharcoal, fontWeight: FontWeight.w600)),
                                TextSpan(text: l10n.metabolic_calibration_desc_p3),
                              ],
                            ),
                            style: AppTextStyles.body14Height,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(flex: 2), 
              Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: CustomGradientButton(text: l10n.button_continue, onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (_) => const Step5HeightScreen())); }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}