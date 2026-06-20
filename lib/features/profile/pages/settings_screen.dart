import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/features/profile/models/settings_model.dart';
import 'package:kinetic/features/profile/widgets/settings_widgets.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // إنشاء نسخة مبدئية من الإعدادات. في المستقبل ممكن تجيبها من API أو SharedPrefs
  late SettingsModel settingsData;

  @override
  void initState() {
    super.initState();
    settingsData = SettingsModel.defaultSettings();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(l10n.settingsTitle, style: AppTextStyles.profileAppBar18),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileSettingsCard(user: settingsData.userProfile),
            const SizedBox(height: 24),
            
            SectionTitle(title: l10n.settingsWorkoutSettings),
            WorkoutSettingsCard(settings: settingsData.workoutSettings),
            const SizedBox(height: 24),

            SectionTitle(title: l10n.settingsPreferences),
            PreferencesSettingsCard(prefs: settingsData.preferences),
            const SizedBox(height: 24),

            SectionTitle(title: l10n.settingsNotifications),
            NotificationsSettingsCard(notifications: settingsData.notifications),
            const SizedBox(height: 24),

            SectionTitle(title: l10n.settingsSupportLegal),
            const SupportSettingsCard(),
            const SizedBox(height: 30),

            // تم استبدال الدالة القديمة بالويدجت الجديدة اللي بتفتح البوب أب
            const SettingsLogoutButton(),
            const SizedBox(height: 24),

            Center(child: Text(l10n.settingsAppVersion, style: AppTextStyles.settingsVersion10)),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}