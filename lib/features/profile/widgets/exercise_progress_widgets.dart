import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/features/profile/models/exercise_progress_model.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

// ==========================================
// --- 1. Top Header Stats ---
// ==========================================
class ProgressHeaderStats extends StatelessWidget {
  final ExerciseProgressModel data;

  const ProgressHeaderStats({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.estimated_1rm, style: AppTextStyles.label10Blue),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text('${data.estimated1RM.toInt()}', style: AppTextStyles.prWeight72.copyWith(fontSize: 48)),
                const SizedBox(width: 4),
                Text(data.unit, style: AppTextStyles.trainVolumeUnit10.copyWith(fontSize: 16)),
                const SizedBox(width: 12),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(color: AppColors.lightBlueWhite, borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      const Icon(Icons.trending_up, color: AppColors.primary, size: 14),
                      const SizedBox(width: 4),
                      Text('+${data.percentageIncrease.toInt()}%', style: AppTextStyles.label10Blue),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(l10n.total_volume_3mo, style: AppTextStyles.caption12.copyWith(color: AppColors.textGrey)),
            const SizedBox(height: 4),
            Text('${data.totalVolume3Mo}${data.unit}', style: AppTextStyles.heading24.copyWith(fontWeight: FontWeight.w700)),
          ],
        ),
      ],
    );
  }
}

// ==========================================
// --- 2. Progress Line Chart ---
// ==========================================
class ProgressLineChart extends StatelessWidget {
  const ProgressLineChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.background, 
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: AppColors.darkCharcoal5,
            blurRadius: 10,
            offset: Offset(0, 4),
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: CustomPaint(
          painter: _ChartPainter(),
        ),
      ),
    );
  }
}

class _ChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final linePaint = Paint()
      ..color = AppColors.primary
      ..strokeWidth = 4 
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path();
    
    path.moveTo(0, size.height * 0.7);

    path.cubicTo(
      size.width * 0.2, size.height * 0.65, 
      size.width * 0.3, size.height * 0.8,  
      size.width * 0.45, size.height * 0.6, 
    );
    
    path.cubicTo(
      size.width * 0.6, size.height * 0.4, 
      size.width * 0.7, size.height * 0.6, 
      size.width * 0.85, size.height * 0.3, 
    );

    path.quadraticBezierTo(
      size.width * 0.95, size.height * 0.1, 
      size.width, size.height * 0.15, 
    );

    final fillPath = Path.from(path);
    fillPath.lineTo(size.width, size.height);
    fillPath.lineTo(0, size.height);
    fillPath.close();

    final fillPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          AppColors.primary.withOpacity(0.3), 
          AppColors.white.withOpacity(0.0),   
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawPath(fillPath, fillPaint);
    canvas.drawPath(path, linePaint);

    final dotPaint = Paint()
      ..color = AppColors.primary
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(size.width, size.height * 0.15), 5, dotPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ==========================================
// --- 3. Highlight Stats Row ---
// ==========================================
class HighlightsRow extends StatelessWidget {
  final ExerciseProgressModel data;

  const HighlightsRow({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Row(
      children: [
        Expanded(
          child: _buildHighlightCard(
            l10n.best_weight,
            '${data.bestWeight.value}${data.bestWeight.unit}',
            'x ${data.bestWeight.subValue} ${l10n.reps_unit}',
            true,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildHighlightCard(
            l10n.best_volume,
            '${data.bestVolume.value}${data.bestVolume.unit}',
            l10n.single_session,
            false,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildHighlightCard(
            l10n.best_sets,
            data.bestSets.value,
            '${l10n.at_weight} ${data.bestSets.subValue}${data.unit}',
            false,
          ),
        ),
      ],
    );
  }

  Widget _buildHighlightCard(String title, String value, String subtitle, bool isHighlightedText) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: AppColors.darkCharcoal5, blurRadius: 10, offset: Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.label10GreyDark),
          const SizedBox(height: 12),
          Text(value, style: AppTextStyles.heading24.copyWith(fontWeight: FontWeight.w800, fontSize: 18)),
          const SizedBox(height: 4),
          Text(
            subtitle, 
            style: AppTextStyles.caption12.copyWith(color: isHighlightedText ? AppColors.primary : AppColors.textGrey, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// --- 4. Workout History List ---
// ==========================================
class WorkoutHistorySection extends StatelessWidget {
  final List<WorkoutHistorySession> history;

  const WorkoutHistorySection({Key? key, required this.history}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(l10n.workout_history, style: AppTextStyles.sectionTitle.copyWith(fontSize: 20)),
            TextButton(
              onPressed: () {},
              child: Text(l10n.view_all, style: AppTextStyles.actionTitle.copyWith(color: AppColors.primary)),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ...history.map((session) => _WorkoutHistoryCard(session: session)).toList(),
      ],
    );
  }
}

class _WorkoutHistoryCard extends StatelessWidget {
  final WorkoutHistorySession session;

  const _WorkoutHistoryCard({required this.session});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: AppColors.darkCharcoal5, blurRadius: 10, offset: Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(session.date, style: AppTextStyles.caption12.copyWith(color: AppColors.textGrey)),
                  const SizedBox(height: 4),
                  Text(session.title, style: AppTextStyles.heading24.copyWith(fontSize: 20, fontWeight: FontWeight.w800)),
                ],
              ),
              if (session.isNewPR)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      const Icon(Icons.stars, color: AppColors.white, size: 14),
                      const SizedBox(width: 4),
                      Text(l10n.new_pr, style: AppTextStyles.label10Grey.copyWith(color: AppColors.white)),
                    ],
                  ),
                ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(flex: 1, child: Text(l10n.set_col, style: AppTextStyles.label10GreyDark)),
              Expanded(flex: 2, child: Text(l10n.weight_col, style: AppTextStyles.label10GreyDark, textAlign: TextAlign.center)),
              Expanded(flex: 2, child: Text(l10n.reps_col, style: AppTextStyles.label10GreyDark, textAlign: TextAlign.center)),
              Expanded(flex: 2, child: Text(l10n.rpe_col, style: AppTextStyles.label10GreyDark, textAlign: TextAlign.right)),
            ],
          ),
          const SizedBox(height: 8),
          const Divider(color: AppColors.dividerGrey),
          const SizedBox(height: 8),
          ...session.sets.map((setRecord) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(flex: 1, child: Text('${setRecord.setNum}', style: AppTextStyles.body16.copyWith(color: AppColors.textGrey))),
                    Expanded(flex: 2, child: Text('${setRecord.weight.toInt()}kg', style: AppTextStyles.body16.copyWith(fontWeight: FontWeight.w800), textAlign: TextAlign.center)),
                    Expanded(flex: 2, child: Text('${setRecord.reps}', style: AppTextStyles.body16.copyWith(fontWeight: FontWeight.w800), textAlign: TextAlign.center)),
                    Expanded(flex: 2, child: Text('${setRecord.rpe}', style: AppTextStyles.body16.copyWith(color: AppColors.primary, fontWeight: FontWeight.w800), textAlign: TextAlign.right)),
                  ],
                ),
              )).toList(),
        ],
      ),
    );
  }
}