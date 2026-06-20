import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/onboarding/provider/onboarding_provider.dart';
import 'package:kinetic/features/onboarding/screens/step6_experience_screen.dart';
import 'package:provider/provider.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/shared_widgets/custom_gradient_button.dart';
import '../widgets/onboarding_top_bar.dart';

class Step5HeightScreen extends StatefulWidget {
  const Step5HeightScreen({super.key});

  @override
  State<Step5HeightScreen> createState() => _Step5HeightScreenState();
}

class _Step5HeightScreenState extends State<Step5HeightScreen> {
  int _currentValue = 175;
  late FixedExtentScrollController _scrollController;

  List<int> _generateList(bool isCm) {
    if (isCm) return List.generate(151, (index) => 100 + index);
    else return List.generate(61, (index) => 40 + index); 
  }

  @override
  void initState() {
    super.initState();
    _scrollController = FixedExtentScrollController(initialItem: _generateList(true).indexOf(_currentValue));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<OnboardingProvider>().setHeight(_currentValue);
    });
  }

  void _toggleUnit(String newUnit, OnboardingProvider provider) {
    if (provider.heightUnit == newUnit) return;
    setState(() {
      if (newUnit == 'ft/in') _currentValue = (_currentValue / 2.54).round();
      else _currentValue = (_currentValue * 2.54).round();
      final newList = _generateList(newUnit == 'cm');
      int newIndex = newList.indexOf(_currentValue);
      if (newIndex == -1) newIndex = 0;
      _scrollController.jumpToItem(newIndex);
    });
    provider.setHeightUnit(newUnit);
    provider.setHeight(_currentValue);
  }

  String _formatFtIn(int totalInches) {
    int feet = totalInches ~/ 12;
    int inches = totalInches % 12;
    return "$feet'$inches\"";
  }

  @override
  void dispose() { _scrollController.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final onboardingProvider = context.watch<OnboardingProvider>();
    final isCm = onboardingProvider.heightUnit == 'cm';
    final itemsList = _generateList(isCm);

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
              child: OnboardingTopBar(stepText: l10n.step_5_of_14, onSkip: () {}),
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
                      Text(l10n.personal_metrics, style: AppTextStyles.label10Blue.copyWith(letterSpacing: 0.50)),
                      const SizedBox(height: 8),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: l10n.what_is_your_current_height_p1),
                            TextSpan(text: l10n.what_is_your_current_height_p2, style: const TextStyle(color: AppColors.primary)),
                            TextSpan(text: l10n.what_is_your_current_height_p3),
                          ],
                        ),
                        style: AppTextStyles.heading36Black.copyWith(height: 1.25, letterSpacing: -0.90),
                      ),
                      const SizedBox(height: 32),

                      Center(
                        child: Container(
                          width: 160, height: 44,
                          decoration: BoxDecoration(color: AppColors.inputBackground, borderRadius: BorderRadius.circular(22)),
                          child: Stack(
                            children: [
                              AnimatedAlign(
                                duration: const Duration(milliseconds: 150), curve: Curves.easeOutCubic,
                                alignment: isCm ? Alignment.centerLeft : Alignment.centerRight,
                                child: Container(width: 80, height: 44, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(22), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4, offset: const Offset(0, 2))])),
                              ),
                              Row(
                                children: [
                                  Expanded(child: GestureDetector(behavior: HitTestBehavior.opaque, onTap: () => _toggleUnit('cm', onboardingProvider), child: Center(child: Text(l10n.cm, style: TextStyle(color: isCm ? AppColors.primary : AppColors.textGrey, fontSize: 14, fontWeight: FontWeight.w700))))),
                                  Expanded(child: GestureDetector(behavior: HitTestBehavior.opaque, onTap: () => _toggleUnit('ft/in', onboardingProvider), child: Center(child: Text(l10n.ft_in, style: TextStyle(color: !isCm ? AppColors.primary : AppColors.textGrey, fontSize: 14, fontWeight: FontWeight.w700))))),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),

                      SizedBox(
                        height: 300,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(width: double.infinity, height: 100, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24), boxShadow: const [BoxShadow(color: Color(0x0A000000), blurRadius: 20, offset: Offset(0, 5))])),
                            ListWheelScrollView.useDelegate(
                              controller: _scrollController, itemExtent: 80, perspective: 0.002, physics: const FixedExtentScrollPhysics(),
                              onSelectedItemChanged: (index) {
                                setState(() { _currentValue = itemsList[index]; });
                                onboardingProvider.setHeight(_currentValue);
                              },
                              childDelegate: ListWheelChildBuilderDelegate(
                                childCount: itemsList.length,
                                builder: (context, index) {
                                  final value = itemsList[index];
                                  final isSelected = value == _currentValue;
                                  String displayText = isCm ? value.toString() : _formatFtIn(value);
                                  
                                  if (isSelected) return Center(child: Text(displayText, style: const TextStyle(color: AppColors.primary, fontSize: 72, fontWeight: FontWeight.w900)));
                                  return Center(child: Text(displayText, style: const TextStyle(color: Color(0x662D2E33), fontSize: 36, fontWeight: FontWeight.w700)));
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                      
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: const [BoxShadow(color: Color(0x0A000000), blurRadius: 20, offset: Offset(0, 10))]),
                        child: Row(
                          children: [
                            const Icon(Icons.show_chart, color: AppColors.primary),
                            const SizedBox(width: 16),
                            Expanded(child: Text(l10n.height_calibration_desc, style: AppTextStyles.body14Height)),
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
              child: CustomGradientButton(text: 'CONTINUE', onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (_) => const Step6ExperienceScreen())); }),
            ),
          ],
        ),
      ),
    );
  }
}