import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/training_preferences/widgets/sync_widgets.dart';

class SyncScreen extends StatelessWidget {
  const SyncScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // تفعيل اللوكليزيشن
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.nearBlack),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
        ),
        title: Text(l10n.syncStatus, style: AppTextStyles.title18Dark),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined, color: AppColors.nearBlack),
            onPressed: () {}, // زر الإعدادات العلوي
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SyncHeader(l10n: l10n),
            const SizedBox(height: 32),
            
            Text(l10n.activeServices, style: AppTextStyles.label10GreyDark),
            const SizedBox(height: 16),
            ActiveServicesList(l10n: l10n),
            
            const SizedBox(height: 24),
            SyncAllButton(l10n: l10n),
            
            const SizedBox(height: 40),
            Text(l10n.recentActivity, style: AppTextStyles.label10GreyDark),
            const SizedBox(height: 16),
            RecentActivityList(l10n: l10n),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}