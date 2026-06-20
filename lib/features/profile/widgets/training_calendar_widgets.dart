import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/profile/models/training_calendar_model.dart';

class StreakAndStatusRow extends StatelessWidget {
  final int streak;
  final String status;

  const StreakAndStatusRow({Key? key, required this.streak, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    // فلترة بسيطة لو الحالة جاية من الـ API بالانجليزي نعرضها بالترجمة
    String displayStatus = status;
    if (status.toUpperCase() == 'ELITE STATUS') displayStatus = l10n.status_elite;

    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(color: AppColors.darkCharcoal5, blurRadius: 10, offset: const Offset(0, 4)),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(l10n.current_streak, style: AppTextStyles.trainVolumeLabel10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text('$streak', style: AppTextStyles.trainStreakValue60),
                    const SizedBox(width: 4),
                    Text(l10n.days, style: AppTextStyles.trainStreakUnit20.copyWith(color: AppColors.textGrey)),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 30),
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.workspace_premium, color: AppColors.white, size: 32),
                const SizedBox(height: 8),
                Text(
                  displayStatus, 
                  textAlign: TextAlign.center,
                  style: AppTextStyles.btnWhiteText.copyWith(fontSize: 14),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CalendarWidget extends StatelessWidget {
  final String monthYear;
  const CalendarWidget({Key? key, required this.monthYear}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(monthYear, style: AppTextStyles.dialogTitle24), 
              Row(
                children: [
                  _buildNavButton(Icons.chevron_left),
                  const SizedBox(width: 8),
                  _buildNavButton(Icons.chevron_right),
                ],
              )
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              l10n.mon, l10n.tue, l10n.wed, l10n.thu, l10n.fri, l10n.sat, l10n.sun
            ].map((day) => Text(day, style: AppTextStyles.label10GreyDark)).toList(),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildDateCell('25', isFaded: true), _buildDateCell('26', isFaded: true),
              _buildDateCell('27', isFaded: true), _buildDateCell('28', isFaded: true),
              _buildDateCell('29', isFaded: true), _buildDateCell('30', isFaded: true),
              _buildDateCell('1', hasDot: true),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildDateCell('2'), _buildDateCell('3', hasDot: true),
              _buildDateCell('4'), _buildDateCell('5', hasDot: true),
              _buildDateCell('6', isSelected: true), _buildDateCell('7'),
              _buildDateCell('8'),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 14), _buildDateCell('9', hasDot: true),
              const SizedBox(width: 28), _buildDateCell('10'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNavButton(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: const BoxDecoration(color: AppColors.lightGray, shape: BoxShape.circle),
      child: Icon(icon, size: 16, color: AppColors.textGrey),
    );
  }

  Widget _buildDateCell(String date, {bool isSelected = false, bool isFaded = false, bool hasDot = false}) {
    return Column(
      children: [
        Container(
          width: 36,
          height: 36,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            date,
            style: AppTextStyles.body16.copyWith(
              color: isSelected ? AppColors.white : (isFaded ? AppColors.borderGrey : AppColors.darkCharcoal),
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 4),
        if (hasDot) Container(width: 4, height: 4, decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle))
        else const SizedBox(height: 4),
      ],
    );
  }
}

class TodaySessionCard extends StatelessWidget {
  final TodaySessionModel session;

  const TodaySessionCard({Key? key, required this.session}) : super(key: key);

  String getLocalizedTag(BuildContext context, String tag) {
    final l10n = AppLocalizations.of(context)!;
    if (tag.toUpperCase() == 'HYPERTROPHY') return l10n.tag_hypertrophy;
    if (tag.toUpperCase() == 'LOWER BODY') return l10n.tag_lower_body;
    return tag;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(16)),
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
                  Text(session.title, style: AppTextStyles.heading36Black),
                  const SizedBox(height: 8),
                  Row(
                    children: session.tags.map((tag) => Container(
                      margin: const EdgeInsets.only(right: 8),
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(color: AppColors.keepTrainingBg, borderRadius: BorderRadius.circular(6)),
                      child: Text(getLocalizedTag(context, tag), style: AppTextStyles.label10GreyDark),
                    )).toList(),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(session.startTime, style: AppTextStyles.trainRoutineTitle20.copyWith(color: AppColors.primary)),
                  Text(l10n.start_time, style: AppTextStyles.trainVolumeLabel10),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Divider(color: AppColors.dividerGrey),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStatItem(Icons.timer_outlined, '${session.durationMin}', l10n.min, l10n.duration),
              _buildStatItem(Icons.fitness_center, '${session.volumeTons}', l10n.tons, l10n.volume),
              _buildStatItem(Icons.favorite_border, '${session.avgHr}', l10n.bpm, l10n.avg_hr),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildStatItem(IconData icon, String value, String unit, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: AppColors.primary, size: 20),
        const SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(value, style: AppTextStyles.heading24.copyWith(fontWeight: FontWeight.w900)),
            const SizedBox(width: 4),
            Text(unit, style: AppTextStyles.caption12),
          ],
        ),
        Text(label, style: AppTextStyles.trainVolumeLabel10),
      ],
    );
  }
}

class MonthlyPerformanceSection extends StatelessWidget {
  final MonthlyPerformanceModel performance;

  const MonthlyPerformanceSection({Key? key, required this.performance}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      children: [
        Row(
          children: [
            Expanded(child: _buildMiniCard(l10n.total_workouts, '${performance.totalWorkouts}', '')),
            const SizedBox(width: 16),
            Expanded(child: _buildMiniCard(l10n.total_time, '${performance.totalTimeHours}', l10n.hours_unit)),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(color: AppColors.lightGray.withOpacity(0.5), borderRadius: BorderRadius.circular(16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(l10n.cumulative_volume, style: AppTextStyles.trainVolumeLabel10),
              const SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text('${performance.cumulativeVolumeTons}', style: AppTextStyles.heading36Black),
                  const SizedBox(width: 6),
                  Text(l10n.tons, style: AppTextStyles.title18Dark.copyWith(color: AppColors.textGrey)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMiniCard(String title, String value, String unit) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: AppColors.background, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.trainVolumeLabel10),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(value, style: AppTextStyles.heading36Black),
              if (unit.isNotEmpty) ...[const SizedBox(width: 4), Text(unit, style: AppTextStyles.title18Dark.copyWith(color: AppColors.textGrey))]
            ],
          )
        ],
      ),
    );
  }
}