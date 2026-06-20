import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/features/plan/widget/daily_protocol_card.dart';
import 'package:kinetic/features/plan/widget/day_indicator.dart';
import 'package:kinetic/features/plan/widget/progress_bar_item.dart';
import 'package:kinetic/features/plan/widget/stat_card.dart';

class PlanScreen extends StatelessWidget {
  const PlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      body: SafeArea(
        child: Column(
          children: [
            // 1. الهيدر العلوى
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.menu, color: Color(0xFF0058BB), size: 28),
                  Text(
                    l10n.protocol_alpha.replaceAll('\n', ' ').toUpperCase(),
                    style: const TextStyle(color: Color(0xFF2D2E33), fontSize: 18, fontFamily: 'Inter', fontWeight: FontWeight.w700, letterSpacing: -0.45),
                  ),
                  Container(
                    width: 36,
                    height: 36,
                    decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFF1E293B)),
                    child: const Icon(Icons.person, color: Colors.white, size: 20),
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
                              Text(l10n.protocol_alpha, style: const TextStyle(color: Color(0xFF2D2E33), fontSize: 32, fontFamily: 'Inter', fontWeight: FontWeight.w900, height: 1, letterSpacing: -1.60)),
                              const SizedBox(height: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(color: const Color(0xFFE6EFFF), borderRadius: BorderRadius.circular(20)),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(Icons.star_border, color: Color(0xFF0058BB), size: 12),
                                    const SizedBox(width: 4),
                                    Text(l10n.hypertrophy_focus, style: const TextStyle(color: Color(0xFF0058BB), fontSize: 10, fontFamily: 'Inter', fontWeight: FontWeight.w900, height: 1.50, letterSpacing: 1)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(l10n.active_week, textAlign: TextAlign.right, style: const TextStyle(color: Color(0xFF5B5B60), fontSize: 10, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.50, letterSpacing: 1)),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  const Text('01', style: TextStyle(color: Color(0xFF0058BB), fontSize: 30, fontFamily: 'Inter', fontWeight: FontWeight.w900, height: 1.20)),
                                  Text('/ 08', style: TextStyle(color: const Color(0xFF5B5B60).withOpacity(0.3), fontSize: 18, fontFamily: 'Inter', fontWeight: FontWeight.w900, height: 1.56)),
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
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4))]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(l10n.weekly_rhythm, style: const TextStyle(color: Color(0xFF5B5B60), fontSize: 12, fontFamily: 'Inter', fontWeight: FontWeight.w900, height: 1.33, letterSpacing: 1.20)),
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
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4))]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(l10n.stimulus_balance, style: const TextStyle(color: Color(0xFF5B5B60), fontSize: 12, fontFamily: 'Inter', fontWeight: FontWeight.w900, height: 1.33, letterSpacing: 1.20)),
                                Text(l10n.optional_flow, style: const TextStyle(color: Color(0xFF0058BB), fontSize: 10, fontFamily: 'Inter', fontWeight: FontWeight.w700)),
                              ],
                            ),
                            const SizedBox(height: 20),
                            ProgressBarItem(label: l10n.push, percent: 35, color: const Color(0xFF0058BB)),
                            const SizedBox(height: 16),
                            ProgressBarItem(label: l10n.pull, percent: 30, color: const Color(0xFF4A8CF6)),
                            const SizedBox(height: 16),
                            ProgressBarItem(label: l10n.legs, percent: 35, color: const Color(0xFF8BA6DF)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),

                      // -- رؤية المدرب --
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(color: const Color(0xFF0058BB), borderRadius: BorderRadius.circular(24)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), shape: BoxShape.circle),
                              child: const Icon(Icons.lightbulb_outline, color: Colors.white, size: 20),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(l10n.coach_insight, style: const TextStyle(color: Colors.white, fontSize: 14, fontFamily: 'Inter', fontWeight: FontWeight.w900, letterSpacing: 1.40)),
                                  const SizedBox(height: 8),
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(text: l10n.coach_insight_p1, style: const TextStyle(color: Color(0xFFF0F2FF), fontSize: 14, fontFamily: 'Inter', fontWeight: FontWeight.w500, height: 1.63)),
                                        TextSpan(text: l10n.coach_insight_p2, style: const TextStyle(color: Colors.white, fontSize: 14, fontFamily: 'Inter', fontWeight: FontWeight.w700, decoration: TextDecoration.underline)),
                                        TextSpan(text: l10n.coach_insight_p3, style: const TextStyle(color: Color(0xFFF0F2FF), fontSize: 14, fontFamily: 'Inter', fontWeight: FontWeight.w500, height: 1.63)),
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
                          Text(l10n.daily_protocols, style: const TextStyle(color: Color(0xFF2D2E33), fontSize: 20, fontFamily: 'Inter', fontWeight: FontWeight.w900, letterSpacing: -1)),
                          Row(
                            children: [
                              Container(width: 6, height: 6, decoration: const BoxDecoration(color: Color(0xFF8BA6DF), shape: BoxShape.circle)),
                              const SizedBox(width: 4),
                              Text(l10n.upcoming, style: const TextStyle(color: Color(0xFF5B5B60), fontSize: 10, fontFamily: 'Inter', fontWeight: FontWeight.w700, letterSpacing: 1)),
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
                        decoration: BoxDecoration(color: const Color(0xFFF4F4F6), borderRadius: BorderRadius.circular(24)),
                        child: Row(
                          children: [
                            Container(padding: const EdgeInsets.all(12), decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle), child: const Icon(Icons.self_improvement, color: Color(0xFF0058BB))),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(l10n.day3_wed, style: const TextStyle(color: Color(0xFF5B5B60), fontSize: 10, fontFamily: 'Inter', fontWeight: FontWeight.w700, letterSpacing: 1)),
                                  const SizedBox(height: 4),
                                  Text(l10n.active_recovery, style: const TextStyle(color: Color(0xFF2D2E33), fontSize: 18, fontFamily: 'Inter', fontWeight: FontWeight.w900, letterSpacing: -0.45)),
                                ],
                              ),
                            ),
                            Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6), decoration: BoxDecoration(border: Border.all(color: const Color(0xFFD1D1D6)), borderRadius: BorderRadius.circular(16)), child: Text(l10n.rest, style: const TextStyle(color: Color(0xFF0058BB), fontSize: 10, fontFamily: 'Inter', fontWeight: FontWeight.w900))),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      
                      // الكارت المغلق
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4))]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(l10n.day4_thu, style: const TextStyle(color: Color(0xFF5B5B60), fontSize: 10, fontFamily: 'Inter', fontWeight: FontWeight.w900, letterSpacing: 1)),
                                const SizedBox(width: 12),
                                const Icon(Icons.timer_outlined, color: Color(0xFF5B5B60), size: 12),
                                const SizedBox(width: 4),
                                const Text('60m', style: TextStyle(color: Color(0xFF5B5B60), fontSize: 11, fontFamily: 'Inter', fontWeight: FontWeight.w700)),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(l10n.legs_hypertrophy, style: const TextStyle(color: Color(0xFF2D2E33), fontSize: 20, fontFamily: 'Inter', fontWeight: FontWeight.w900, letterSpacing: -0.50)),
                            const SizedBox(height: 8),
                            Text(l10n.legs_hypertrophy_desc, style: const TextStyle(color: Color(0xFF5B5B60), fontSize: 13, fontFamily: 'Inter', fontWeight: FontWeight.w500, height: 1.38)),
                            const SizedBox(height: 16),
                            Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6), decoration: BoxDecoration(color: const Color(0xFFF4F4F6), borderRadius: BorderRadius.circular(16)), child: Row(mainAxisSize: MainAxisSize.min, children: [const Icon(Icons.lock_outline, color: Color(0xFF5B5B60), size: 12), const SizedBox(width: 4), Text(l10n.locked, style: const TextStyle(color: Color(0xFF5B5B60), fontSize: 10, fontFamily: 'Inter', fontWeight: FontWeight.w900, letterSpacing: 1))])),
                          ],
                        ),
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