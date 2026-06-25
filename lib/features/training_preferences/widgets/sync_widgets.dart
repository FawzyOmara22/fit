import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/training_preferences/models/sync_model.dart';
import 'package:kinetic/features/training_preferences/provider/sync_provider.dart';
import 'package:provider/provider.dart';


// ==========================================
// دوال مساعدة لترجمة الـ Keys القادمة من الـ API
// ==========================================
String _getLocalizedText(String key, AppLocalizations l10n) {
  switch (key) {
    // العناوين
    case 'appleHealth': return l10n.appleHealth;
    case 'strava': return l10n.strava;
    case 'googleDriveBackup': return l10n.googleDriveBackup;
    case 'exportedWorkoutStrava': return l10n.exportedWorkoutStrava;
    case 'pulledHeartRate': return l10n.pulledHeartRate;
    case 'autoBackupCompleted': return l10n.autoBackupCompleted;
    // العناوين الفرعية (Subtitles)
    case 'syncedAgo': return l10n.syncedAgo;
    case 'syncing': return l10n.syncing;
    case 'lastBackup': return l10n.lastBackup;
    case 'morningRun': return l10n.morningRun;
    case 'backgroundSync': return l10n.backgroundSync;
    case 'cloudStorage': return l10n.cloudStorage;
    // الافتراضي لو الـ Key مش موجود
    default: return key; 
  }
}

/// 1. الهيدر (الأيقونة المشعة والنصوص)
class SyncHeader extends StatelessWidget {
  final AppLocalizations l10n;
  const SyncHeader({Key? key, required this.l10n}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primary,
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.3),
                  blurRadius: 30,
                  spreadRadius: 5,
                )
              ],
            ),
            child: const Center(
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 20,
                child: Icon(Icons.check, color: AppColors.primary, size: 28),
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        Center(
          child: Text(
            l10n.allSystemsUpToDate,
            style: AppTextStyles.heading24.copyWith(fontWeight: FontWeight.w900, fontSize: 28),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.access_time, color: AppColors.textGrey, size: 14),
            const SizedBox(width: 6),
            Text(l10n.lastFullSync, style: AppTextStyles.body14NoHeight),
          ],
        ),
      ],
    );
  }
}

/// 2. قائمة الخدمات النشطة
class ActiveServicesList extends StatelessWidget {
  final AppLocalizations l10n;
  const ActiveServicesList({Key? key, required this.l10n}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SyncProvider>(
      builder: (context, provider, child) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.02),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: provider.services.asMap().entries.map((entry) {
              int idx = entry.key;
              SyncServiceModel service = entry.value;
              
              // تحديد الأيقونات والألوان بناءً على الـ ID الخاص بالخدمة
              IconData iconData = Icons.cloud_done;
              Color iconBgColor = const Color(0xFFF3E8F6); 
              Color iconColor = const Color(0xFF883C93);

              if (service.id == '1') { // Apple Health
                iconData = Icons.favorite;
                iconBgColor = const Color(0xFFFDE9EA); 
                iconColor = const Color(0xFFDC2626);
              } else if (service.id == '2') { // Strava
                iconData = Icons.directions_run;
                iconBgColor = AppColors.lightBlueWhite;
                iconColor = AppColors.primary;
              }

              // استخدام الدالة المساعدة لترجمة النص القادم من الموديل/API
              String localizedTitle = _getLocalizedText(service.titleKey, l10n);
              String localizedSubtitle = _getLocalizedText(service.subtitleKey, l10n);

              return Column(
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    leading: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: iconBgColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(iconData, color: iconColor, size: 24),
                    ),
                    title: Text(localizedTitle, style: AppTextStyles.addExCardTitle),
                    subtitle: Text(
                      localizedSubtitle,
                      style: service.state == SyncState.syncing 
                          ? AppTextStyles.body14BlueNoHeight 
                          : AppTextStyles.body14Height.copyWith(fontSize: 13),
                    ),
                    trailing: _buildTrailingIcon(service.state),
                  ),
                  if (idx != provider.services.length - 1)
                    const Divider(height: 1, color: AppColors.divider, indent: 70),
                ],
              );
            }).toList(),
          ),
        );
      },
    );
  }

  Widget _buildTrailingIcon(SyncState state) {
    if (state == SyncState.syncing) {
      return const SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.primary),
      );
    } else if (state == SyncState.synced) {
      return const Icon(Icons.check_circle_outline, color: AppColors.primary);
    } else {
      return const Icon(Icons.cloud_outlined, color: AppColors.iconGrey);
    }
  }
}

/// 3. زر المزامنة للكل
class SyncAllButton extends StatelessWidget {
  final AppLocalizations l10n;
  const SyncAllButton({Key? key, required this.l10n}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SyncProvider>(
      builder: (context, provider, child) {
        return GestureDetector(
          onTap: () {
            if (!provider.isSyncingAll) provider.syncAllData();
          },
          child: Container(
            width: double.infinity,
            height: 56,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF3B82F6), Color(0xFF60A5FA)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(28),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.3),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                )
              ],
            ),
            child: Center(
              child: provider.isSyncingAll
                  ? const CircularProgressIndicator(color: AppColors.white)
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.sync, color: Colors.white, size: 20),
                        const SizedBox(width: 8),
                        Text(
                          l10n.syncAllData,
                          style: AppTextStyles.primaryButton16,
                        ),
                      ],
                    ),
            ),
          ),
        );
      },
    );
  }
}

/// 4. قائمة النشاطات الأخيرة (Timeline)
class RecentActivityList extends StatelessWidget {
  final AppLocalizations l10n;
  const RecentActivityList({Key? key, required this.l10n}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SyncProvider>(
      builder: (context, provider, child) {
        return Column(
          children: provider.activities.asMap().entries.map((entry) {
            int idx = entry.key;
            ActivityModel activity = entry.value;
            bool isLast = idx == provider.activities.length - 1;

            // ترجمة البيانات القادمة من الموديل
            String localizedTitle = _getLocalizedText(activity.titleKey, l10n);
            String localizedSubtitle = _getLocalizedText(activity.subtitleKey, l10n);

            return _TimelineTile(
              title: localizedTitle,
              subtitle: localizedSubtitle,
              isActive: activity.isActive,
              isLast: isLast,
            );
          }).toList(),
        );
      },
    );
  }
}

/// ويدجيت مساعد لرسم التايم لاين
class _TimelineTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isActive;
  final bool isLast;

  const _TimelineTile({
    required this.title,
    required this.subtitle,
    required this.isActive,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 6),
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isActive ? AppColors.primary : AppColors.divider,
                ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    color: AppColors.divider,
                    margin: const EdgeInsets.only(top: 4, bottom: 4),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextStyles.addExCardTitle),
                  const SizedBox(height: 4),
                  Text(subtitle, style: AppTextStyles.body14Height.copyWith(fontSize: 13)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}