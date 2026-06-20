import 'package:flutter/material.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/features/profile/models/pr_model.dart'; // مسار الموديل

// ==========================================
// 1. Header Widget (Title & 1RM Est)
// ==========================================
class PRHeaderWidget extends StatelessWidget {
  const PRHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.chestAndTriceps, style: AppTextStyles.label10Blue),
            const SizedBox(height: 4),
            Text(l10n.benchPress, style: AppTextStyles.heading36Black.copyWith(height: 1)),
            const SizedBox(height: 8),
            Container(width: 40, height: 4, color: AppColors.primary), // الخط الأزرق
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(l10n.est1RM, style: AppTextStyles.label10GreyDark),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text("245", style: AppTextStyles.heading36Primary),
                const SizedBox(width: 4),
                Text(l10n.lbs, style: AppTextStyles.body16.copyWith(color: AppColors.primary, fontWeight: FontWeight.bold)),
              ],
            )
          ],
        ),
      ],
    );
  }
}

// ==========================================
// 2. Current Peak Performance Card (مع رسمة الدمبل)
// ==========================================
class CurrentPeakCard extends StatelessWidget {
  const CurrentPeakCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [BoxShadow(color: AppColors.darkCharcoal5, blurRadius: 10, offset: Offset(0, 4))],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // ووتر مارك الدمبل في الخلفية
          Positioned(
            right: -10,
            top: -20,
            child: Transform.rotate(
              angle: -0.4,
              child: const Icon(Icons.fitness_center, size: 140, color: AppColors.surfaceColor),
            ),
          ),
          // المحتوى الأساسي
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(l10n.currentPeakPerformance, style: AppTextStyles.cardLabel),
              const SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  const Text("225", style: AppTextStyles.prWeight72),
                  const SizedBox(width: 8),
                  Text("${l10n.lbs} × 5 ${l10n.reps}", style: AppTextStyles.cardSubtitle13.copyWith(fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.trending_up, color: AppColors.primary, size: 18),
                  const SizedBox(width: 4),
                  Text(l10n.top5Percent, style: AppTextStyles.prImproved14),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

// ==========================================
// 3. Sub-Stats (Max Weight & Best Volume)
// ==========================================
class PRSubStatsRow extends StatelessWidget {
  const PRSubStatsRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Row(
      children: [
        Expanded(
          child: _buildSubCard(
            title: l10n.maxWeight,
            value: "235",
            unit: l10n.lbs,
            bottomWidget: Container(
              margin: const EdgeInsets.only(top: 12),
              height: 4,
              width: double.infinity,
              decoration: BoxDecoration(color: AppColors.surfaceColor, borderRadius: BorderRadius.circular(2)),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(width: 80, decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(2))),
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildSubCard(
            title: l10n.bestVolume,
            value: "4,500",
            unit: l10n.lbs,
            bottomWidget: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text("${l10n.setOn} Oct 12", style: AppTextStyles.caption12.copyWith(fontStyle: FontStyle.italic)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSubCard({required String title, required String value, required String unit, required Widget bottomWidget}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.cardLabel),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(value, style: AppTextStyles.gridCardValue),
              const SizedBox(width: 4),
              Text(unit, style: AppTextStyles.caption12.copyWith(fontWeight: FontWeight.bold)),
            ],
          ),
          bottomWidget,
        ],
      ),
    );
  }
}

// ==========================================
// 4. Progression Chart Widget (رسم بياني منحني حقيقي)
// ==========================================
class PRProgressionChart extends StatelessWidget {
  const PRProgressionChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(l10n.oneRMProgression, style: AppTextStyles.trainRoutineTitle20),
            Row(
              children: [
                _buildToggle(l10n.sixMonths, true),
                const SizedBox(width: 8),
                _buildToggle(l10n.oneYear, false),
              ],
            )
          ],
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(24)),
          child: Column(
            children: [
              SizedBox(
                height: 120,
                width: double.infinity,
                child: CustomPaint(painter: SmoothChartPainter()), // رسم الكيرف
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: ['MAY', 'JUN', 'JUL', 'AUG', 'SEP', 'OCT']
                    .map((m) => Text(m, style: AppTextStyles.label10GreyDark))
                    .toList(),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _buildToggle(String text, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary : AppColors.surfaceColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(text, style: isSelected ? AppTextStyles.navBarSelected10 : AppTextStyles.navBarUnselected10),
    );
  }
}

// كلاس رسم الـ Curve Chart
class SmoothChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint linePaint = Paint()
      ..color = AppColors.primary
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Path path = Path();
    path.moveTo(0, size.height * 0.8);
    path.cubicTo(size.width * 0.2, size.height * 0.9, size.width * 0.3, size.height * 0.5, size.width * 0.5, size.height * 0.7);
    path.cubicTo(size.width * 0.7, size.height * 0.9, size.width * 0.8, size.height * 0.1, size.width, size.height * 0.3);

    canvas.drawPath(path, linePaint);

    // النقطة في آخر الرسمة
    Paint circlePaintWhite = Paint()..color = Colors.white ..style = PaintingStyle.fill;
    Paint circlePaintBlue = Paint()..color = AppColors.primary ..style = PaintingStyle.stroke ..strokeWidth = 3;
    canvas.drawCircle(Offset(size.width, size.height * 0.3), 6, circlePaintWhite);
    canvas.drawCircle(Offset(size.width, size.height * 0.3), 6, circlePaintBlue);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ==========================================
// 5. Milestone History List
// ==========================================
class MilestoneHistorySection extends StatelessWidget {
  final List<MilestoneModel> milestones;
  const MilestoneHistorySection({Key? key, required this.milestones}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(l10n.milestoneHistory, style: AppTextStyles.trainRoutineTitle20),
            Text(l10n.seeAll, style: AppTextStyles.discoverViewAll14),
          ],
        ),
        const SizedBox(height: 16),
        ...milestones.map((m) => _buildMilestoneCard(m, l10n)).toList(),
      ],
    );
  }

  Widget _buildMilestoneCard(MilestoneModel milestone, AppLocalizations l10n) {
    bool isNewPR = milestone.type == 'new_pr';
    String label = isNewPR ? l10n.newPR : (milestone.type == 'volume_pr' ? l10n.volumePR : l10n.maxPR);
    Color labelColor = isNewPR ? AppColors.primary : AppColors.textGrey;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(16)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            border: Border(left: BorderSide(color: isNewPR ? AppColors.primary : Colors.transparent, width: 4)),
          ),
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(label, style: AppTextStyles.label10GreyDark.copyWith(color: labelColor)),
                      const SizedBox(width: 8),
                      Text(milestone.date, style: AppTextStyles.label10Grey),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(milestone.valueText, style: AppTextStyles.actionTitle),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(milestone.percentage, style: AppTextStyles.prImproved14),
                  Text(l10n.vsPrevious, style: AppTextStyles.caption12),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}