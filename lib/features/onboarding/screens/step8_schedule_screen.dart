import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/onboarding/provider/onboarding_provider.dart';
import 'package:kinetic/features/onboarding/screens/step9_equipment_screen.dart';
import 'package:provider/provider.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/shared_widgets/custom_gradient_button.dart';
import '../widgets/onboarding_top_bar.dart';

class Step8ScheduleScreen extends StatelessWidget {
  const Step8ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final provider = context.watch<OnboardingProvider>();

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
              child: OnboardingTopBar(stepText: l10n.step_8_of_14, onSkip: () {
                 Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const Step9EquipmentScreen(), // 👈 غير HomeScreen باسم صفحتك
      ),
    );
              }),
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
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: l10n.define_your_p1, style: AppTextStyles.heading36Black.copyWith(height: 0.95)),
                            TextSpan(text: l10n.define_your_p2, style: AppTextStyles.heading36Primary.copyWith(height: 0.95)),
                            TextSpan(text: l10n.define_your_p3, style: AppTextStyles.heading36Black.copyWith(height: 0.95)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),

                      Text(l10n.frequency_label, style: AppTextStyles.label10GreyDark.copyWith(color: AppColors.darkCharcoal, fontWeight: FontWeight.w900)),
                      const SizedBox(height: 4),
                      Text(l10n.how_many_days, style: AppTextStyles.body14WithHeight.copyWith(fontSize: 12)),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(7, (index) {
                          final day = index + 1;
                          final isSelected = provider.daysPerWeek == day;
                          return GestureDetector(
                            onTap: () => provider.setDaysPerWeek(day),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200), width: 40, height: 40,
                              decoration: BoxDecoration(
                                gradient: isSelected ? const LinearGradient(colors: [AppColors.gradientStart, AppColors.gradientEnd], begin: Alignment.topLeft, end: Alignment.bottomRight) : null,
                                color: isSelected ? null : Colors.white, shape: BoxShape.circle,
                                boxShadow: isSelected ? [] : [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 4, offset: const Offset(0, 2))],
                              ),
                              child: Center(child: Text(day.toString(), style: TextStyle(color: isSelected ? Colors.white : AppColors.darkCharcoal, fontSize: isSelected ? 14 : 12, fontFamily: 'Inter', fontWeight: isSelected ? FontWeight.w900 : FontWeight.w600))),
                            ),
                          );
                        }),
                      ),

                      const SizedBox(height: 40),

                      Text(l10n.start_of_week_label, style: AppTextStyles.label10GreyDark.copyWith(color: AppColors.darkCharcoal, fontWeight: FontWeight.w900)),
                      const SizedBox(height: 16),
                      Container(
                        height: 48, decoration: BoxDecoration(color: AppColors.inputBackground, borderRadius: BorderRadius.circular(16)),
                        child: Stack(
                          children: [
                            AnimatedAlign(
                              duration: const Duration(milliseconds: 200), curve: Curves.easeOutCubic, alignment: provider.startOfWeek == 'Monday' ? Alignment.centerLeft : Alignment.centerRight,
                              child: FractionallySizedBox(widthFactor: 0.5, child: Container(margin: const EdgeInsets.all(4), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4, offset: const Offset(0, 2))]))),
                            ),
                            Row(
                              children: [
                                Expanded(child: GestureDetector(behavior: HitTestBehavior.opaque, onTap: () => provider.setStartOfWeek('Monday'), child: Center(child: Text(l10n.monday, style: AppTextStyles.body14NoHeight.copyWith(color: provider.startOfWeek == 'Monday' ? AppColors.primary : AppColors.textGrey, fontSize: 12, fontWeight: FontWeight.w700))))),
                                Expanded(child: GestureDetector(behavior: HitTestBehavior.opaque, onTap: () => provider.setStartOfWeek('Sunday'), child: Center(child: Text(l10n.sunday, style: AppTextStyles.body14NoHeight.copyWith(color: provider.startOfWeek == 'Sunday' ? AppColors.primary : AppColors.textGrey, fontSize: 12, fontWeight: FontWeight.w700))))),
                              ],
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 40),

                      Text(l10n.typical_session_length, style: AppTextStyles.label10GreyDark.copyWith(color: AppColors.darkCharcoal, fontWeight: FontWeight.w900)),
                      const SizedBox(height: 16),
                      GridView.count(
                        crossAxisCount: 2, shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), mainAxisSpacing: 16, crossAxisSpacing: 16, childAspectRatio: 1.5,
                        children: [
                          _SessionLengthCard(label: l10n.express, time: l10n.min_30, isSelected: provider.sessionLength == '30 MIN', onTap: () => provider.setSessionLength('30 MIN')),
                          _SessionLengthCard(label: l10n.standard, time: l10n.min_45, isSelected: provider.sessionLength == '45 MIN', onTap: () => provider.setSessionLength('45 MIN')),
                          _SessionLengthCard(label: l10n.performance, time: l10n.min_60, isSelected: provider.sessionLength == '60 MIN', onTap: () => provider.setSessionLength('60 MIN')),
                          _SessionLengthCard(label: l10n.endurance, time: l10n.min_90_plus, isSelected: provider.sessionLength == '90+ MIN', onTap: () => provider.setSessionLength('90+ MIN')),
                        ],
                      ),

                      const SizedBox(height: 32),

                      Container(
                        padding: const EdgeInsets.all(20), decoration: BoxDecoration(color: AppColors.insightBg, borderRadius: BorderRadius.circular(16)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(padding: const EdgeInsets.all(8), decoration: const BoxDecoration(color: AppColors.insightIconBg, shape: BoxShape.circle), child: const Icon(Icons.lightbulb, color: Colors.white, size: 20)),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(l10n.kinetic_insight, style: AppTextStyles.insightTitle),
                                  const SizedBox(height: 6),
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(text: l10n.insight_desc_p1, style: AppTextStyles.insightBody),
                                        TextSpan(text: l10n.insight_desc_p2, style: AppTextStyles.insightBodyBold),
                                        TextSpan(text: l10n.insight_desc_p3, style: AppTextStyles.insightBody),
                                      ],
                                    ),
                                  ),
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
              child: CustomGradientButton(text: 'CONTINUE', onPressed: (provider.daysPerWeek != null && provider.sessionLength != null) ? () { Navigator.push(context, MaterialPageRoute(builder: (context) => const Step9EquipmentScreen())); } : () {}),
            ),
          ],
        ),
      ),
    );
  }
}

class _SessionLengthCard extends StatelessWidget {
  final String label;
  final String time;
  final bool isSelected;
  final VoidCallback onTap;

  const _SessionLengthCard({required this.label, required this.time, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200), padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: isSelected ? const LinearGradient(colors: [AppColors.gradientStart, AppColors.gradientEnd], begin: Alignment.topLeft, end: Alignment.bottomRight) : null,
          color: isSelected ? null : Colors.white, borderRadius: BorderRadius.circular(16),
          boxShadow: isSelected ? [] : [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4))],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(label, style: TextStyle(color: isSelected ? const Color(0xB2F0F2FF) : AppColors.primary, fontSize: 10, fontFamily: 'Inter', fontWeight: FontWeight.w900, letterSpacing: -0.40)),
                Container(
                  width: 20, height: 20, decoration: BoxDecoration(shape: BoxShape.circle, color: isSelected ? Colors.white : Colors.transparent, border: Border.all(color: isSelected ? Colors.transparent : AppColors.borderDark, width: 1.5)),
                  child: isSelected ? const Icon(Icons.check, size: 14, color: AppColors.gradientEnd) : null,
                ),
              ],
            ),
            const Spacer(),
            Text(time, style: TextStyle(color: isSelected ? Colors.white : AppColors.darkCharcoal, fontSize: 22, fontFamily: 'Inter', fontWeight: FontWeight.w800)),
          ],
        ),
      ),
    );
  }
}