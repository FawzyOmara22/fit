import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/features/plan/widget/daily_protocol_card.dart';
import 'package:kinetic/features/plan/widget/day_indicator.dart';
import 'package:kinetic/features/plan/widget/progress_bar_item.dart';
import 'package:kinetic/features/plan/widget/stat_card.dart';

// 👇 استدعاء الثيم والألوان
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

// 👇 استدعاء زرار التدرج اللوني وصفحة تسجيل الدخول
import 'package:kinetic/core/shared_widgets/custom_gradient_button.dart'; 
import 'package:kinetic/features/auth/screens/login_screen.dart'; // تأكد من مسار صفحة اللوجين

class PlanScreen extends StatelessWidget {
  const PlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: Column(
          children: [
            // 1. الهيدر العلوى
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.menu, color: AppColors.primary, size: 28),
                  Text(
                    l10n.protocol_alpha.replaceAll('\n', ' ').toUpperCase(),
                    style: AppTextStyles.profileAppBar18,
                  ),
                  Container(
                    width: 36,
                    height: 36,
                    decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.deepSlate),
                    child: const Icon(Icons.person, color: AppColors.white, size: 20),
                  ),
                ],
              ),
            ),

            // 2. المحتوى القابل للتمرير
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      
                      // -- قسم العنوان والأسبوع --
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(l10n.protocol_alpha, style: AppTextStyles.profileVolume36.copyWith(fontSize: 32, letterSpacing: -1.60)),
                              const SizedBox(height: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(color: AppColors.lightBlueWhite, borderRadius: BorderRadius.circular(20)),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(Icons.star_border, color: AppColors.primary, size: 12),
                                    const SizedBox(width: 4),
                                    Text(l10n.hypertrophy_focus, style: AppTextStyles.profileProMember10),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(l10n.active_week, textAlign: TextAlign.right, style: AppTextStyles.profileStatLabel10),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Text('01', style: AppTextStyles.profileName30.copyWith(color: AppColors.primary)),
                                  Text('/ 08', style: AppTextStyles.profileConsistency18.copyWith(color: AppColors.textGrey.withOpacity(0.3))),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),

                      // -- كروت الإحصائيات --
                      Row(
                        children: [
                          Expanded(child: StatCard(icon: Icons.calendar_today, label: l10n.duration_label, value: l10n.duration_val)),
                          const SizedBox(width: 12),
                          Expanded(child: StatCard(icon: Icons.repeat, label: l10n.freq_label, value: l10n.freq_val)),
                          const SizedBox(width: 12),
                          Expanded(child: StatCard(icon: Icons.bar_chart, label: l10n.volume_label, value: l10n.volume_val)),
                        ],
                      ),
                      const SizedBox(height: 24),

                      // -- الإيقاع الأسبوعي --
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(24), boxShadow: const [BoxShadow(color: AppColors.darkCharcoal5, blurRadius: 10, offset: Offset(0, 4))]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(l10n.weekly_rhythm, style: AppTextStyles.addExSectionTitle),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                DayIndicator(day: l10n.day_m, status: 'completed'),
                                DayIndicator(day: l10n.day_t, status: 'planned'),
                                DayIndicator(day: l10n.day_w, status: 'rest'),
                                DayIndicator(day: l10n.day_th, status: 'planned'),
                                DayIndicator(day: l10n.day_f, status: 'rest'),
                                DayIndicator(day: l10n.day_s, status: 'planned'),
                                DayIndicator(day: l10n.day_su, status: 'rest'),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),

                      // -- توازن التحفيز --
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(24), boxShadow: const [BoxShadow(color: AppColors.darkCharcoal5, blurRadius: 10, offset: Offset(0, 4))]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(l10n.stimulus_balance, style: AppTextStyles.addExSectionTitle),
                                Text(l10n.optional_flow, style: AppTextStyles.label10Blue),
                              ],
                            ),
                            const SizedBox(height: 20),
                            ProgressBarItem(label: l10n.push, percent: 35, color: AppColors.primary),
                            const SizedBox(height: 16),
                            ProgressBarItem(label: l10n.pull, percent: 30, color: AppColors.gradientStart),
                            const SizedBox(height: 16),
                            ProgressBarItem(label: l10n.legs, percent: 35, color: AppColors.primaryLight),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),

                      // -- رؤية المدرب --
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(24)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(color: AppColors.white20, shape: BoxShape.circle),
                              child: const Icon(Icons.lightbulb_outline, color: AppColors.white, size: 20),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(l10n.coach_insight, style: AppTextStyles.textButton14Spacing.copyWith(color: AppColors.white)),
                                  const SizedBox(height: 8),
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(text: l10n.coach_insight_p1, style: AppTextStyles.body14WithHeight.copyWith(color: AppColors.lightBlueWhite)),
                                        TextSpan(text: l10n.coach_insight_p2, style: AppTextStyles.spanBlueUnderline.copyWith(color: AppColors.white)),
                                        TextSpan(text: l10n.coach_insight_p3, style: AppTextStyles.body14WithHeight.copyWith(color: AppColors.lightBlueWhite)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),

                      // -- البروتوكولات اليومية --
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(l10n.daily_protocols, style: AppTextStyles.trainRoutineTitle20.copyWith(fontWeight: FontWeight.w900)),
                          Row(
                            children: [
                              Container(width: 6, height: 6, decoration: const BoxDecoration(color: AppColors.primaryLight, shape: BoxShape.circle)),
                              const SizedBox(width: 4),
                              Text(l10n.upcoming, style: AppTextStyles.label10GreyDark),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      DailyProtocolCard(dayText: l10n.day1_mon, time: '45m', title: l10n.pull_and_core, desc: l10n.pull_and_core_desc, isActive: true),
                      const SizedBox(height: 12),
                      DailyProtocolCard(dayText: l10n.day2_tue, time: '50m', title: l10n.push_power, desc: l10n.push_power_desc, isActive: false),
                      const SizedBox(height: 12),
                      
                      // كارت الراحة النشطة
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(color: AppColors.surfaceColor, borderRadius: BorderRadius.circular(24)),
                        child: Row(
                          children: [
                            Container(padding: const EdgeInsets.all(12), decoration: const BoxDecoration(color: AppColors.white, shape: BoxShape.circle), child: const Icon(Icons.self_improvement, color: AppColors.primary)),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(l10n.day3_wed, style: AppTextStyles.label10GreyDark),
                                  const SizedBox(height: 4),
                                  Text(l10n.active_recovery, style: AppTextStyles.profileConsistency18),
                                ],
                              ),
                            ),
                            Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6), decoration: BoxDecoration(border: Border.all(color: AppColors.borderDark), borderRadius: BorderRadius.circular(16)), child: Text(l10n.rest, style: AppTextStyles.profileProMember10)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      
                      // الكارت المغلق
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(24), boxShadow: const [BoxShadow(color: AppColors.darkCharcoal5, blurRadius: 10, offset: Offset(0, 4))]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(l10n.day4_thu, style: AppTextStyles.label10GreyDark),
                                const SizedBox(width: 12),
                                const Icon(Icons.timer_outlined, color: AppColors.textGrey, size: 12),
                                const SizedBox(width: 4),
                                Text('60m', style: AppTextStyles.smallCaption11.copyWith(color: AppColors.textGrey)),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(l10n.legs_hypertrophy, style: AppTextStyles.settingsName20.copyWith(fontWeight: FontWeight.w900)),
                            const SizedBox(height: 8),
                            Text(l10n.legs_hypertrophy_desc, style: AppTextStyles.cardSubtitle13),
                            const SizedBox(height: 16),
                            Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6), decoration: BoxDecoration(color: AppColors.surfaceColor, borderRadius: BorderRadius.circular(16)), child: Row(mainAxisSize: MainAxisSize.min, children: [const Icon(Icons.lock_outline, color: AppColors.textGrey, size: 12), const SizedBox(width: 4), Text(l10n.locked, style: AppTextStyles.label10GreyDark)])),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),

                      // 👇 الزر الجديد للانتقال لشاشة تسجيل الدخول
                      CustomGradientButton(
                        text: l10n.button_continue, // استخدم النص المناسب من الترجمة
                        onPressed: () {
                          // الانتقال لشاشة اللوجين وإغلاق الشاشات السابقة
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => const LoginScreen()),
                            (route) => false,
                          );
                        },
                      ),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}