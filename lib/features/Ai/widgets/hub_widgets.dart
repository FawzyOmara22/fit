import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
// 👇 استدعاء صفحة الشات عشان زرار Start AI Session يشتغل
import 'package:kinetic/features/Ai/pages/coach_chat_screen.dart';

// ==========================================
// 1. Hero Card Widget
// ==========================================
class HubHeroCard extends StatelessWidget {
  const HubHeroCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        // 👇 التعديل 1: الصورة الخلفية للكارت (مكان الـ Gradient)
        image: const DecorationImage(
          // ⚠️ ملحوظة: لو الصورة معاك في المشروع، امسح سطر NetworkImage واستخدم السطر ده:
          // image: AssetImage('assets/images/your_image_name.png'),
          image: NetworkImage('https://images.unsplash.com/photo-1618005182384-a83a8bd57fbe?auto=format&fit=crop&w=800&q=80'), // صورة شبيهة مؤقتاً
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(color: const Color(0xFF1D4ED8).withOpacity(0.3), blurRadius: 20, offset: const Offset(0, 10)),
        ],
      ),
      child: Container(
        // طبقة لون شفافة عشان الكلام يفضل مقري فوق الصورة
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.blue.shade900.withOpacity(0.4), 
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), borderRadius: BorderRadius.circular(4)),
              child: Text(l10n.hub_neural_link, style: AppTextStyles.neuralLink),
            ),
            const SizedBox(height: 16),
            Text(l10n.hub_meet_coach, style: AppTextStyles.meetCoach),
            const SizedBox(height: 12),
            Text(l10n.hub_coach_desc, style: AppTextStyles.coachDesc),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                // 👇 التعديل 2: الانتقال لصفحة الشات
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CoachChatScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                  elevation: 0,
                ),
                child: Text(l10n.hub_start_session, style: AppTextStyles.startSessionBtn),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 2. Mini Stat Pill
// ==========================================
class MiniStatPill extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color iconColor;

  const MiniStatPill({Key? key, required this.label, required this.value, required this.icon, required this.iconColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4))
        ]),
        child: Row(
          children: [
            Icon(icon, color: iconColor, size: 20),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: AppTextStyles.miniStatLabel),
                const SizedBox(height: 4),
                Text(value, style: AppTextStyles.miniStatValue),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 3. Weekly Pulse Chart Widget
// ==========================================
class WeeklyPulseChart extends StatelessWidget {
  final List<double> chartData;

  const WeeklyPulseChart({Key? key, required this.chartData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white, 
        borderRadius: BorderRadius.circular(24), 
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4))
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.hub_weekly_pulse, style: AppTextStyles.pulseTitle),
          const SizedBox(height: 24),
          // الـ Bar Chart 
          SizedBox(
            height: 90, // زودنا الارتفاع سنة بسيطة
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: List.generate(7, (index) {
                final isToday = index == 1; 
                return Expanded( // 👈 التعديل الأول: استخدام Expanded
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 12,
                        height: 60 * chartData[index], 
                        decoration: BoxDecoration(
                          color: isToday ? const Color(0xFF1D4ED8) : (chartData[index] > 0.5 ? const Color(0xFF60A5FA) : const Color(0xFFE2E8F0)),
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      const SizedBox(height: 8),
                      FittedBox( // 👈 التعديل الثاني: عشان الخط ميعملش Overflow
                        fit: BoxFit.scaleDown,
                        child: Text(days[index], style: AppTextStyles.pulseDay),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: 24),
          // Summary Box
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC), 
              borderRadius: BorderRadius.circular(12), 
              border: const Border(left: BorderSide(color: Color(0xFF1D4ED8), width: 3))
            ),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: l10n.hub_summary_label, style: AppTextStyles.summaryLabel),
                  TextSpan(text: l10n.hub_summary_text, style: AppTextStyles.summaryText),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}