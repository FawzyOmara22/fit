import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/features/training_preferences/provider/data_management_provider.dart';
import 'package:kinetic/features/training_preferences/widgets/data_management_widgets.dart';
import 'package:provider/provider.dart';


class DataManagementScreen extends StatelessWidget {
  const DataManagementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const DataManagementAppBar(),
      body: Consumer<DataManagementProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator(color: AppColors.primary));
          }

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  const DataManagementHeader(),
                  const SizedBox(height: 40),
                  
                  // --- Section 1: Data Portability ---
                  DataSectionTitle(
                    title: l10n.dataPortability,
                    rightLabel: l10n.availableFormats.replaceAll(' ', '\n'), // لعمل سطرين زي الصورة
                  ),
                  const SizedBox(height: 16),
                  
                ExportCard(
  icon: Icons.table_chart_outlined,
  title: l10n.exportToCsv,
  desc: l10n.exportCsvDesc,
  btnText: l10n.downloadSpreadsheet,
  isPrimaryBtn: true,
  btnIcon: Icons.download, // أيقونة التحميل
),
                  const SizedBox(height: 16),
                  
                 ExportCard(
  icon: Icons.data_object, // أيقونة { }
  title: l10n.exportToJson,
  desc: l10n.exportJsonDesc,
  btnText: l10n.generateSchema,
  isPrimaryBtn: false, // زر بلون فاتح
  btnIcon: Icons.code, // أيقونة < >
),
                  const SizedBox(height: 40),

                  // --- Section 2: Migration ---
                  DataSectionTitle(title: l10n.migration),
                  const SizedBox(height: 16),
                  const MigrationContainer(),
                  const SizedBox(height: 40),

                  // --- Section 3: Backup ---
                  DataSectionTitle(title: l10n.backup),
                  const SizedBox(height: 16),
                  const BackupCard(),
                  const SizedBox(height: 40),

                  // --- Section 4: Privacy ---
                  const PrivacyInfoCard(),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}