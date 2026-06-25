import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/features/training_preferences/provider/preferences_provider.dart';
import 'package:kinetic/features/training_preferences/widgets/training_preferences_widgets.dart';
import 'package:provider/provider.dart';


class TrainingPreferencesScreen extends StatelessWidget {
  const TrainingPreferencesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // إحضار الترجمة (l10n)
    final l10n = AppLocalizations.of(context)!;

    return Consumer<PreferencesProvider>(
      builder: (context, provider, child) {
        // تحديد اتجاه الشاشة بناءً على اللغة الحالية المحددة في الـ Provider
        final isArabic = provider.langCode == 'ar';

        return Directionality(
          textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
          child: Scaffold(
            backgroundColor: AppColors.background,
            appBar: const PreferencesAppBar(), // مفصولة
            body: provider.isLoading
                ? const Center(child: CircularProgressIndicator(color: AppColors.primary))
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 16),
                          const PreferencesHeader(), // مفصولة
                          const SizedBox(height: 32),
                          
                          SectionTitle(title: l10n.workout_settings, rightLabel: l10n.general),
                          const SizedBox(height: 12),
                          const WorkoutSettingsCard(), // مفصولة
                          const SizedBox(height: 32),
                          
                          SectionTitle(title: l10n.automation, rightLabel: l10n.workflow),
                          const SizedBox(height: 12),
                          const AutomationCard(), // مفصولة
                          const SizedBox(height: 32),
                          
                          SectionTitle(title: l10n.equipment, rightLabel: l10n.hardware),
                          const SizedBox(height: 12),
                          const EquipmentSection(), // مفصولة
                          const SizedBox(height: 24),
                          
                          const AppleHealthCard(), // مفصولة
                          const SizedBox(height: 32),
                          
                          const ResetPreferencesAction(), // مفصولة
                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ),
          ),
        );
      },
    );
  }
}