import 'package:flutter/material.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';

// ==========================================
// 1. كارت ملخص القياسات (الوزن / الدهون)
// ==========================================
class SummaryCard extends StatelessWidget {
  final String title;
  final String value;
  final String unit;
  final String changeValue;
  final Color changeColor;
  final IconData icon;
  final String sinceLastEntryText;

  const SummaryCard({
    Key? key,
    required this.title,
    required this.value,
    required this.unit,
    required this.changeValue,
    required this.changeColor,
    required this.icon,
    required this.sinceLastEntryText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: AppColors.darkCharcoal5,
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: AppTextStyles.miniStatLabel.copyWith(color: AppColors.mutedGrey),
              ),
              Icon(icon, color: AppColors.primary),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                value,
                style: AppTextStyles.heading36Black,
              ),
              const SizedBox(width: 4),
              Text(
                unit,
                style: AppTextStyles.body16.copyWith(fontWeight: FontWeight.bold, color: AppColors.mutedGrey),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.arrow_downward, color: changeColor, size: 16),
              const SizedBox(width: 4),
              Text(
                changeValue,
                style: AppTextStyles.body14WithHeight.copyWith(color: changeColor, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 8),
              Text(
                sinceLastEntryText,
                style: AppTextStyles.caption12.copyWith(color: AppColors.textGrey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ==========================================
// 2. كارت الرسم البياني (Weight Trend)
// ==========================================
class MeasurementChartCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String actionText;
  final VoidCallback? onActionTap;

  const MeasurementChartCard({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.actionText,
    this.onActionTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surfaceColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextStyles.trainSectionTitle24),
                  const SizedBox(height: 4),
                  Text(subTitle, style: AppTextStyles.caption12.copyWith(color: AppColors.textGrey)),
                ],
              ),
              GestureDetector(
                onTap: onActionTap,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(actionText, style: AppTextStyles.trainSeeAll12),
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 100,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(6, (index) {
                return Container(
                  width: 40,
                  height: 40.0 + (index * 12),
                  decoration: BoxDecoration(
                    color: AppColors.primaryLight.withOpacity(0.6),
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}

// ==========================================
// 3. حاوي قائمة الفئات (Categories Section)
// ==========================================
class CategoriesSection extends StatelessWidget {
  final String title;
  final List<Widget> tiles;

  const CategoriesSection({
    Key? key,
    required this.title,
    required this.tiles,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.sectionTitle),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(color: AppColors.darkCharcoal5, blurRadius: 10, offset: Offset(0, 4)),
            ],
          ),
          child: Column(children: tiles),
        ),
      ],
    );
  }
}

// ==========================================
// 4. عنصر الفئة المفردة داخل القائمة
// ==========================================
class CategoryTile extends StatelessWidget {
  final String title;
  final String date;
  final String value;
  final String unit;
  final IconData icon;

  const CategoryTile({
    Key? key,
    required this.title,
    required this.date,
    required this.value,
    required this.unit,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: AppColors.cardSelectedBg,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppColors.primary),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.actionTitle),
                const SizedBox(height: 4),
                Text(date, style: AppTextStyles.actionDesc),
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(value, style: AppTextStyles.miniStatValue.copyWith(fontSize: 18)),
              const SizedBox(width: 4),
              Text(unit, style: AppTextStyles.miniStatLabel),
            ],
          ),
        ],
      ),
    );
  }
}

// ==========================================
// 5. البانر السفلي الترويجي للاستمرار
// ==========================================
class ConsistencyBanner extends StatelessWidget {
  final String title;
  final String message;

  const ConsistencyBanner({
    Key? key,
    required this.title,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.deepSlate,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.discoverProgramTitle24.copyWith(fontStyle: FontStyle.normal),
                ),
                const SizedBox(height: 8),
                Text(
                  message,
                  style: AppTextStyles.spotlightDesc.copyWith(fontSize: 13),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          const Icon(Icons.directions_run, color: AppColors.white20, size: 80),
        ],
      ),
    );
  }
}

// ==========================================
// 6. زر الإضافة الدائري بتدرج لوني أزرق (Gradient Circular Button)
// ==========================================
class GradientCircularButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;

  const GradientCircularButton({
    Key? key,
    required this.onTap,
    this.icon = Icons.add, // الأيقونة الافتراضية
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 65, // عرض الزرار
        height: 65, // طول الزرار عشان يبقى دائري مظبوط
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          // التدرج اللوني الأزرق من ملف الألوان بتاعك
          gradient: const LinearGradient(
            colors: [
              AppColors.gradientStart, // 0xFF4A8CF6
              AppColors.gradientEnd,   // 0xFF2361E3
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          // ضفتلك شادو أزرق خفيف بيدي شكل احترافي جداً للزرار
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.3), 
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Icon(
          icon,
          color: AppColors.white,
          size: 32,
        ),
      ),
    );
  }
}