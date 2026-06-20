import 'package:flutter/material.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';

// ==========================================
// 1. Header (Metric Type & Title)
// ==========================================
class MetricHeaderWidget extends StatelessWidget {
  const MetricHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      children: [
        Text(l10n.metricType, style: AppTextStyles.label10GreyDark),
        const SizedBox(height: 4),
        Text(l10n.bodyWeight, style: AppTextStyles.heading36Black),
      ],
    );
  }
}

// ==========================================
// 2. Main Input Area (Value & Toggle)
// ==========================================
class MainInputWidget extends StatefulWidget {
  final Function(String) onUnitChanged;
  const MainInputWidget({Key? key, required this.onUnitChanged}) : super(key: key);

  @override
  State<MainInputWidget> createState() => _MainInputWidgetState();
}

class _MainInputWidgetState extends State<MainInputWidget> {
  bool isKg = true;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40),
      decoration: BoxDecoration(
        color: AppColors.surfaceColor, // الرصاصي الفاتح اللي في الديزاين
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          // حقل الإدخال
          TextField(
            textAlign: TextAlign.center,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            style: AppTextStyles.timerHuge80.copyWith(color: AppColors.divider), // لون فاتح للـ placeholder
            decoration: InputDecoration(
              hintText: "00.0",
              hintStyle: AppTextStyles.timerHuge80.copyWith(color: AppColors.divider),
              border: InputBorder.none,
              isDense: true,
              contentPadding: EdgeInsets.zero,
            ),
          ),
          const SizedBox(height: 20),
          // الـ Toggle (kg / lbs)
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: AppColors.lightGray,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildToggleBtn(l10n.kg, isKg, () {
                  setState(() => isKg = true);
                  widget.onUnitChanged('kg');
                }),
                _buildToggleBtn(l10n.lbs, !isKg, () {
                  setState(() => isKg = false);
                  widget.onUnitChanged('lbs');
                }),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildToggleBtn(String text, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          text,
          style: isSelected ? AppTextStyles.settingsToggleSelected14 : AppTextStyles.settingsToggleUnselected14,
        ),
      ),
    );
  }
}

// ==========================================
// 3. Summary Cards Row
// ==========================================
class LogSummaryCards extends StatelessWidget {
  const LogSummaryCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Row(
      children: [
        Expanded(
          child: _buildCard(
            title: l10n.lastLog,
            mainWidget: Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                const Text("72.5", style: AppTextStyles.trainSectionTitleLight24),
                const SizedBox(width: 4),
                Text(l10n.kg, style: AppTextStyles.caption12),
              ],
            ),
            subText: "Oct 12, 2023",
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildCard(
            title: l10n.sevenDayTrend,
            mainWidget: Row(
              children: [
                const Icon(Icons.trending_down, color: AppColors.errorRed, size: 20),
                const SizedBox(width: 4),
                const Text("-0.4kg", style: AppTextStyles.trainSectionTitleLight24),
              ],
            ),
            subText: l10n.steadyProgress,
          ),
        ),
      ],
    );
  }

  Widget _buildCard({required String title, required Widget mainWidget, required String subText}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.surfaceColor),
        boxShadow: const [BoxShadow(color: AppColors.darkCharcoal5, blurRadius: 10, offset: Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.cardLabel),
          const SizedBox(height: 12),
          mainWidget,
          const SizedBox(height: 8),
          Text(subText, style: AppTextStyles.caption12),
        ],
      ),
    );
  }
}

// ==========================================
// 4. Custom Chart Widget (المعدل)
// ==========================================
class RecentHistoryChart extends StatelessWidget {
  const RecentHistoryChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    // داتا وهمية للرسم البياني
    final List<Map<String, dynamic>> chartData = [
      {'label': 'OCT\n8', 'height': 50.0, 'isToday': false},
      {'label': 'OCT\n9', 'height': 48.0, 'isToday': false},
      {'label': 'OCT\n10', 'height': 55.0, 'isToday': false},
      {'label': 'OCT\n11', 'height': 46.0, 'isToday': false},
      {'label': l10n.today.toUpperCase(), 'height': 45.0, 'isToday': true},
    ];

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surfaceColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(l10n.recentHistory, style: AppTextStyles.cardTitle14),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(color: AppColors.lightBlueWhite, borderRadius: BorderRadius.circular(6)),
                child: Text(l10n.contextBtn, style: AppTextStyles.suggestionChip.copyWith(fontSize: 10)),
              )
            ],
          ),
          const SizedBox(height: 24),
          // زودنا الارتفاع الكلي لـ 120 عشان يستوعب البارات براحتها
          SizedBox(
            height: 120,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: chartData.map((data) {
                return _buildBar(data['label'], data['height'], data['isToday']);
              }).toList(),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBar(String label, double height, bool isToday) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 45,
          height: height,
          decoration: BoxDecoration(
            color: isToday ? AppColors.primary : AppColors.primaryLight.withOpacity(0.5),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(6)),
          ),
        ),
        const SizedBox(height: 8),
        // التعديل هنا: حطينا النص جوه SizedBox بارتفاع ثابت (32)
        // عشان يخلي كل البارات تقف على نفس الخط بالظبط
        SizedBox(
          height: 32, 
          child: Align(
            alignment: Alignment.topCenter, // عشان النص يبدأ من فوق لتحت
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: isToday ? AppTextStyles.label10Blue : AppTextStyles.label10GreyDark,
            ),
          ),
        ),
      ],
    );
  }
}

// ==========================================
// 5. Optional Notes Widget
// ==========================================
class OptionalNotesWidget extends StatelessWidget {
  const OptionalNotesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.optionalNotes, style: AppTextStyles.sectionLabelDark),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: AppColors.surfaceColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: TextField(
            maxLines: 3,
            decoration: InputDecoration(
              hintText: l10n.notesHint,
              hintStyle: AppTextStyles.inputHint,
              border: InputBorder.none,
            ),
          ),
        )
      ],
    );
  }
}