import 'package:flutter/material.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
// مسار ملفات الـ Widgets والـ Model (تأكد منها عندك)
import 'package:kinetic/features/profile/widgets/log_measurement_widgets.dart'; 
import 'package:kinetic/features/profile/models/log_measurement_model.dart';

class LogMeasurementScreen extends StatefulWidget {
  const LogMeasurementScreen({Key? key}) : super(key: key);

  @override
  State<LogMeasurementScreen> createState() => _LogMeasurementScreenState();
}

class _LogMeasurementScreenState extends State<LogMeasurementScreen> {
  String selectedUnit = 'kg';

  void _saveMeasurement() {
    // هنا بتبني الموديل عشان تبعته للـ API بعدين
    final newLog = LogMeasurementModel(
      value: 72.5, // هتجيبها من الـ Controller بتاع التكست فيلد
      unit: selectedUnit,
      notes: "Feeling good", // هتجيبها من التكست فيلد بتاع النوتس
      date: DateTime.now().toIso8601String(),
    );
    
    // ApiCall.save(newLog);
    print("Saved: ${newLog.toJson()}");
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 80,
        // زرار Cancel
        leading: TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(l10n.cancel, style: AppTextStyles.addExCancelBtn),
        ),
        title: Text(l10n.logMeasurement, style: AppTextStyles.appBarTitle),
        centerTitle: true,
        // زرار Save
        actions: [
          TextButton(
            onPressed: _saveMeasurement,
            child: Text(l10n.save, style: AppTextStyles.addExCancelBtn),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          children: [
            const MetricHeaderWidget(),
            const SizedBox(height: 30),
            
            MainInputWidget(
              onUnitChanged: (unit) {
                setState(() {
                  selectedUnit = unit;
                });
              },
            ),
            const SizedBox(height: 24),
            
            const LogSummaryCards(),
            const SizedBox(height: 24),
            
            const RecentHistoryChart(),
            const SizedBox(height: 32),
            
            const OptionalNotesWidget(),
            const SizedBox(height: 40), // مساحة أمان تحت
          ],
        ),
      ),
    );
  }
}