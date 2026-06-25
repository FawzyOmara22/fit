import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/training_preferences/provider/data_management_provider.dart';
import 'package:provider/provider.dart';


// =========================================
// 1. AppBar
// =========================================
class DataManagementAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DataManagementAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: AppColors.primary),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(l10n.dataManagement, style: AppTextStyles.appBarTitle),
      actions: [
        IconButton(
          icon: const Icon(Icons.cloud_outlined, color: AppColors.primary),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

// =========================================
// 2. Header Banner Card
// =========================================
class DataManagementHeader extends StatelessWidget {
  const DataManagementHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [AppColors.white, AppColors.lightBlueWhite],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: const [BoxShadow(color: AppColors.darkCharcoal5, blurRadius: 10, offset: Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.kineticEngine, style: AppTextStyles.sectionLabel.copyWith(fontSize: 10)),
          const SizedBox(height: 8),
          Text(l10n.yourTrainingEverywhere, style: AppTextStyles.heading36Black.copyWith(fontSize: 32, height: 1.1)),
          const SizedBox(height: 12),
          Text(l10n.trainingEverywhereDesc, style: AppTextStyles.body16.copyWith(height: 1.5)),
        ],
      ),
    );
  }
}

// =========================================
// 3. Section Title Header
// =========================================
class DataSectionTitle extends StatelessWidget {
  final String title;
  final String? rightLabel;

  const DataSectionTitle({Key? key, required this.title, this.rightLabel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(title, style: AppTextStyles.title18Dark.copyWith(fontSize: 20, fontWeight: FontWeight.w900)),
        if (rightLabel != null)
          Text(
            rightLabel!,
            textAlign: TextAlign.right,
            style: AppTextStyles.settingsSectionTitle10.copyWith(height: 1.2),
          ),
      ],
    );
  }
}

// =========================================
// 4. Export Card (Reusable for CSV & JSON)
// =========================================
class ExportCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String desc;
  final String btnText;
  final bool isPrimaryBtn;
  final IconData? btnIcon;

  const ExportCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.desc,
    required this.btnText,
    this.isPrimaryBtn = true,
    this.btnIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [BoxShadow(color: AppColors.darkCharcoal5, blurRadius: 10, offset: Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: AppColors.lightBlueWhite, borderRadius: BorderRadius.circular(12)),
            child: Icon(icon, color: AppColors.primary, size: 24),
          ),
          const SizedBox(height: 16),
          Text(title, style: AppTextStyles.settingsItemTitle16.copyWith(fontWeight: FontWeight.w800)),
          const SizedBox(height: 8),
          Text(desc, style: AppTextStyles.body14Height),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 14),
            decoration: BoxDecoration(
              // استخدام التدريج اللوني لو الزرار Primary
              gradient: isPrimaryBtn ? AppColors.primaryGradient : null,
              color: isPrimaryBtn ? null : AppColors.surfaceColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  btnText,
                  style: TextStyle(
                    // لون النص أبيض في الزر الأساسي، وأزرق في زر الـ JSON
                    color: isPrimaryBtn ? AppColors.white : AppColors.primary,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                if (btnIcon != null) ...[
                  const SizedBox(width: 8),
                  Icon(
                    btnIcon, 
                    color: isPrimaryBtn ? AppColors.white : AppColors.primary, 
                    size: 16
                  ),
                ]
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// =========================================
// 5. Migration Container
// =========================================
class MigrationContainer extends StatelessWidget {
  const MigrationContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: AppColors.surfaceColor, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(16)),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(color: const Color(0xFFFDF2FF), borderRadius: BorderRadius.circular(8)),
                  // أيقونة معدلة لتناسب فكرة نقل التطبيقات
                  child: const Icon(Icons.send_to_mobile, color: Color(0xFF883C93), size: 20),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(l10n.importFromApps, style: AppTextStyles.settingsItemTitle16.copyWith(fontSize: 14, height: 1.2)),
                      const SizedBox(height: 4),
                      Text(l10n.automaticParsing, style: AppTextStyles.settingsItemSubtitle12),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right, color: AppColors.iconGrey),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.migrationQuote,
            textAlign: TextAlign.center,
            style: AppTextStyles.caption12.copyWith(color: AppColors.textGrey, fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}

// =========================================
// 6. Backup Card
// =========================================
class BackupCard extends StatelessWidget {
  const BackupCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final provider = context.watch<DataManagementProvider>();
    final settings = provider.settings!;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [BoxShadow(color: AppColors.darkCharcoal5, blurRadius: 10, offset: Offset(0, 4))],
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
                  Text(l10n.cloudSync, style: AppTextStyles.settingsItemTitle16.copyWith(fontWeight: FontWeight.w800)),
                  const SizedBox(height: 4),
                  Text(l10n.automatedStorage, style: AppTextStyles.settingsItemSubtitle12),
                ],
              ),
              CupertinoSwitch(
                value: settings.isCloudSyncEnabled,
                activeColor: AppColors.primary,
                onChanged: (val) => provider.toggleCloudSync(val),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              const Icon(Icons.history, color: AppColors.primary, size: 20),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l10n.lastBackup, style: AppTextStyles.settingsItemSubtitle12),
                  Text(settings.lastBackupDate, style: AppTextStyles.settingsItemTitle16.copyWith(fontSize: 14)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: provider.performBackup,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14),
              decoration: BoxDecoration(color: AppColors.surfaceColor, borderRadius: BorderRadius.circular(16)),
              child: Center(
                child: Text(
                  l10n.backupNow,
                  style: const TextStyle(color: AppColors.darkCharcoal, fontSize: 14, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// =========================================
// 7. Privacy Info Card
// =========================================
class PrivacyInfoCard extends StatelessWidget {
  const PrivacyInfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surfaceColor, // خلفية رمادية فاتحة
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center, // توسيط المحتوى
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(color: AppColors.white, shape: BoxShape.circle),
            // درع أزرق بداخله علامة صح كما في الصورة
            child: const Icon(Icons.verified_user, color: AppColors.primary, size: 32),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.privacyFirst, 
            style: AppTextStyles.settingsItemTitle16.copyWith(fontSize: 18, fontWeight: FontWeight.w900)
          ),
          const SizedBox(height: 12),
          Text(
            l10n.privacyDesc,
            textAlign: TextAlign.center, // توسيط النص
            style: AppTextStyles.body14Height.copyWith(color: AppColors.textGrey),
          ),
        ],
      ),
    );
  }
}