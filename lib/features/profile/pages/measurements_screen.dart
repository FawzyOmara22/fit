import 'package:flutter/material.dart';
// استيراد الـ Localization المولد الخاص بمشروعك
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/profile/models/measurement_model.dart';
import 'package:kinetic/features/profile/widgets/measurement_widgets.dart';

// ==========================================
// استدعاء شاشة إضافة القياسات الجديدة
// تأكد إن المسار ده متطابق مع مكان الملف عندك
// ==========================================
import 'package:kinetic/features/profile/pages/log_measurement_screen.dart'; 

class MeasurementsScreen extends StatefulWidget {
  const MeasurementsScreen({Key? key}) : super(key: key);

  @override
  State<MeasurementsScreen> createState() => _MeasurementsScreenState();
}

class _MeasurementsScreenState extends State<MeasurementsScreen> {
  
  // بيانات الـ API القادمة من الموديل
  final List<CategoryMeasurement> categoriesData = [
    CategoryMeasurement(id: '1', titleKey: 'weight', dateString: 'Today, 08:30 AM', value: 78.4, unit: 'kg', iconDataString: 'monitor_weight'),
    CategoryMeasurement(id: '2', titleKey: 'body_fat', dateString: 'Yesterday, 07:15 AM', value: 14.2, unit: '%', iconDataString: 'percent'),
    CategoryMeasurement(id: '3', titleKey: 'waist', dateString: 'Oct 24, 2023', value: 82.5, unit: 'cm', iconDataString: 'straighten'),
    CategoryMeasurement(id: '4', titleKey: 'chest', dateString: 'Oct 12, 2023', value: 104.0, unit: 'cm', iconDataString: 'accessibility_new'),
    CategoryMeasurement(id: '5', titleKey: 'shoulders', dateString: 'Oct 12, 2023', value: 122.5, unit: 'cm', iconDataString: 'man'),
    CategoryMeasurement(id: '6', titleKey: 'arms', dateString: 'Oct 12, 2023', value: 38.2, unit: 'cm', iconDataString: 'fitness_center'),
  ];

  IconData _getIcon(String iconName) {
    switch (iconName) {
      case 'monitor_weight': return Icons.monitor_weight_outlined;
      case 'percent': return Icons.percent;
      case 'straighten': return Icons.straighten;
      case 'accessibility_new': return Icons.accessibility_new_rounded;
      case 'man': return Icons.man;
      case 'fitness_center': return Icons.fitness_center;
      default: return Icons.category;
    }
  }

  String _getLocalizedTitle(String key, AppLocalizations l10n) {
    switch (key) {
      case 'weight': return l10n.weight;
      case 'body_fat': return l10n.bodyFat;
      case 'waist': return l10n.waist;
      case 'chest': return l10n.chest;
      case 'shoulders': return l10n.shoulders;
      case 'arms': return l10n.arms;
      default: return key;
    }
  }

  @override
  Widget build(BuildContext context) {
    // استدعاء اللوكليزيشن المطلوب بالشكل المتفق عليه
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: AppColors.darkCharcoal),
          onPressed: () {},
        ),
        title: Text(l10n.measurements, style: AppTextStyles.trainAppBar20),
        centerTitle: true,
        actions: [
          // ==========================================
          // التعديل الأول: زرار الـ + اللي في الـ AppBar
          // ==========================================
          IconButton(
            icon: const Icon(Icons.add, color: AppColors.primary),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LogMeasurementScreen(),
                ),
              );
            },
          ),
        ],
      ),
      
      // ==========================================
      // التعديل التاني: الزرار الدائري اللي تحت
      // ==========================================
      floatingActionButton: GradientCircularButton(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LogMeasurementScreen(),
            ),
          );
        },
        icon: Icons.add,
      ),
      
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. كروت الملخص العلوي
            SummaryCard(
              title: l10n.currentWeight,
              value: "78.4",
              unit: "kg",
              changeValue: "1.2 kg",
              changeColor: AppColors.errorRed,
              icon: Icons.monitor_weight_outlined,
              sinceLastEntryText: l10n.sinceLastEntry,
            ),
            const SizedBox(height: 16),
            SummaryCard(
              title: l10n.bodyFat,
              value: "14.2",
              unit: "%",
              changeValue: "0.4%",
              changeColor: AppColors.primary,
              icon: Icons.percent,
              sinceLastEntryText: l10n.sinceLastEntry,
            ),
            const SizedBox(height: 24),

            // 2. كارت الرسم البياني المتكامل من ملف الويدجت
            MeasurementChartCard(
              title: l10n.weightTrend,
              subTitle: l10n.past30Days,
              actionText: l10n.viewFullChart,
              onActionTap: () {},
            ),
            const SizedBox(height: 30),

            // 3. قسم قائمة الفئات المتكامل
            CategoriesSection(
              title: l10n.categories,
              tiles: categoriesData.map((item) {
                return CategoryTile(
                  title: _getLocalizedTitle(item.titleKey, l10n),
                  date: item.dateString,
                  value: item.value.toString(),
                  unit: item.unit,
                  icon: _getIcon(item.iconDataString),
                );
              }).toList(),
            ),
            const SizedBox(height: 24),

            // 4. البانر الترويجي السفلي
            ConsistencyBanner(
              title: l10n.stayConsistent,
              message: l10n.consistencyMsg,
            ),
            const SizedBox(height: 80), // مساحة للـ FAB السفلي
          ],
        ),
      ),
    );
  }
}