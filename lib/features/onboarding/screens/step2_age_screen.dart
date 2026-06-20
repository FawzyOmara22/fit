import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/onboarding/provider/onboarding_provider.dart';
import 'package:kinetic/features/onboarding/screens/step3_gender_screen.dart';
import 'package:provider/provider.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/shared_widgets/custom_gradient_button.dart';
import '../widgets/onboarding_top_bar.dart';

class Step2AgeScreen extends StatefulWidget {
  const Step2AgeScreen({super.key});

  @override
  State<Step2AgeScreen> createState() => _Step2AgeScreenState();
}

class _Step2AgeScreenState extends State<Step2AgeScreen> {
  late List<int> years;
  int _selectedYear = 1990; 

  @override
  void initState() {
    super.initState();
    final int currentYear = DateTime.now().year;
    years = List.generate(currentYear - 1950 + 1, (index) => 1950 + index);
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<OnboardingProvider>().setBirthYear(_selectedYear);
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final onboardingProvider = context.read<OnboardingProvider>();

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
                stepText: l10n.step_2_of_14,
                onSkip: () {},
              ),
              const SizedBox(height: 32),

              Text(l10n.biometrics, style: AppTextStyles.label10Blue.copyWith(fontSize: 11, letterSpacing: 1.0)),
              const SizedBox(height: 8),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: l10n.what_is_your_age_p1, style: AppTextStyles.heading36Black),
                    TextSpan(text: l10n.what_is_your_age_p2, style: AppTextStyles.heading36Primary),
                    TextSpan(text: l10n.what_is_your_age_p3, style: AppTextStyles.heading36Black),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Text(l10n.age_subtitle, style: AppTextStyles.body16.copyWith(fontSize: 18)),

              const Spacer(),

              SizedBox(
                height: 300,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(height: 80, decoration: const BoxDecoration(border: Border(top: BorderSide(color: Color(0x1A0058BB), width: 1.5), bottom: BorderSide(color: Color(0x1A0058BB), width: 1.5)))),
                    ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return LinearGradient(
                          begin: Alignment.topCenter, end: Alignment.bottomCenter,
                          colors: [Colors.transparent, AppColors.scaffoldBackground, AppColors.scaffoldBackground, Colors.transparent],
                          stops: const [0.0, 0.3, 0.7, 1.0],
                        ).createShader(bounds);
                      },
                      blendMode: BlendMode.dstIn,
                      child: ListWheelScrollView.useDelegate(
                        itemExtent: 80,
                        perspective: 0.005,
                        diameterRatio: 1.5,
                        physics: const FixedExtentScrollPhysics(),
                        controller: FixedExtentScrollController(initialItem: years.indexOf(1990)),
                        onSelectedItemChanged: (index) {
                          setState(() { _selectedYear = years[index]; });
                          onboardingProvider.setBirthYear(_selectedYear);
                        },
                        childDelegate: ListWheelChildBuilderDelegate(
                          childCount: years.length,
                          builder: (context, index) {
                            final year = years[index];
                            final isSelected = year == _selectedYear;
                            final difference = (years.indexOf(_selectedYear) - index).abs();

                            TextStyle textStyle;
                            if (isSelected) textStyle = const TextStyle(color: AppColors.primary, fontSize: 72, fontFamily: 'Inter', fontWeight: FontWeight.w900, height: 1, letterSpacing: -1.80);
                            else if (difference == 1) textStyle = const TextStyle(color: Color(0xCC2D2E33), fontSize: 30, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.20);
                            else if (difference == 2) textStyle = const TextStyle(color: Color(0x7F2D2E33), fontSize: 24, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.33);
                            else textStyle = const TextStyle(color: Color(0x4C2D2E33), fontSize: 20, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.40);

                            return Center(child: Text(year.toString(), style: textStyle));
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: const [BoxShadow(color: Color(0x08000000), blurRadius: 15, offset: Offset(0, 5))]),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(padding: const EdgeInsets.all(10), decoration: const BoxDecoration(color: AppColors.primary10, shape: BoxShape.circle), child: const Icon(Icons.monitor_heart, color: AppColors.primary, size: 20)),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(l10n.metabolic_data_title, style: AppTextStyles.cardTitle14.copyWith(letterSpacing: 0.70)),
                          const SizedBox(height: 6),
                          Text(l10n.metabolic_data_desc, style: AppTextStyles.body14Height),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 24.0, top: 24.0),
                child: CustomGradientButton(text: l10n.button_continue, onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (_) => const Step3GenderScreen())); }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}