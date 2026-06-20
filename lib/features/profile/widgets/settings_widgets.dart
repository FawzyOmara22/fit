import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/features/auth/screens/login_screen.dart';
import 'package:kinetic/features/profile/models/settings_model.dart';
import 'package:provider/provider.dart'; 
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

// تأكد إن مسار البروفايدر ده مطابق للي عندك
import 'package:kinetic/core/providers/language_provider.dart'; 

// ==========================================
// --- 1. Profile Card ---
// ==========================================
class ProfileSettingsCard extends StatelessWidget {
  final UserProfileModel user;

  const ProfileSettingsCard({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(radius: 30, backgroundImage: NetworkImage(user.profileImageUrl)),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
                child: const Icon(Icons.edit, color: AppColors.white, size: 12),
              ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(user.name, style: AppTextStyles.settingsName20),
                Text(user.email, style: AppTextStyles.settingsEmail16),
                const SizedBox(height: 4),
                Text(l10n.settingsEditProfile, style: AppTextStyles.settingsEditProfile14),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// ==========================================
// --- 2. Workout Settings Card ---
// ==========================================
class WorkoutSettingsCard extends StatefulWidget {
  final WorkoutSettingsModel settings;

  const WorkoutSettingsCard({Key? key, required this.settings}) : super(key: key);

  @override
  State<WorkoutSettingsCard> createState() => _WorkoutSettingsCardState();
}

class _WorkoutSettingsCardState extends State<WorkoutSettingsCard> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          SettingsListTile(
            icon: Icons.timer_outlined, 
            title: l10n.settingsRestTimer, 
            subtitle: l10n.settingsDefault90s, 
            trailing: const Icon(Icons.chevron_right, color: AppColors.iconGrey),
          ),
          const SettingsDivider(),
          SettingsListTile(
            icon: Icons.compare_arrows_rounded, 
            title: l10n.settingsWeightUnits, 
            trailing: _buildWeightToggle(),
          ),
          const SettingsDivider(),
          SettingsListTile(
            icon: Icons.calculate_outlined, 
            title: l10n.settingsPlateCalculator, 
            trailing: CustomCheckbox(
              value: widget.settings.plateCalcEnabled, 
              onChanged: (v) => setState(() => widget.settings.plateCalcEnabled = v!),
            ),
          ),
          const SettingsDivider(),
          SettingsListTile(
            icon: Icons.screen_lock_portrait_outlined, 
            title: l10n.settingsLockScreen, 
            trailing: CustomCheckbox(
              value: widget.settings.lockScreenEnabled, 
              onChanged: (v) => setState(() => widget.settings.lockScreenEnabled = v!),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeightToggle() {
    return Container(
      decoration: BoxDecoration(color: AppColors.lightGray, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () => setState(() => widget.settings.isKg = true),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                color: widget.settings.isKg ? AppColors.primary : Colors.transparent, 
                borderRadius: BorderRadius.circular(20)
              ),
              child: Text('KG', style: widget.settings.isKg ? AppTextStyles.settingsToggleSelected14 : AppTextStyles.settingsToggleUnselected14),
            ),
          ),
          GestureDetector(
            onTap: () => setState(() => widget.settings.isKg = false),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                color: !widget.settings.isKg ? AppColors.primary : Colors.transparent, 
                borderRadius: BorderRadius.circular(20)
              ),
              child: Text('LBS', style: !widget.settings.isKg ? AppTextStyles.settingsToggleSelected14 : AppTextStyles.settingsToggleUnselected14),
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// --- 3. Preferences Card ---
// ==========================================
class PreferencesSettingsCard extends StatelessWidget {
  final PreferencesModel prefs;

  const PreferencesSettingsCard({Key? key, required this.prefs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    // بنجيب كود اللغة الحالي عشان نعرضه جنب السهم
    final currentLangCode = Provider.of<LanguageProvider>(context).currentLocale.languageCode;
    final currentLangText = currentLangCode == 'ar' ? 'العربية' : 'English';

    return Container(
      decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          SettingsListTile(
            icon: Icons.tonality, 
            title: l10n.settingsAppearance, 
            trailing: TextWithArrow(text: l10n.settingsSystemDefault),
          ),
          const SettingsDivider(),
          SettingsListTile(
            icon: Icons.language, 
            title: l10n.settingsLanguage, 
            trailing: TextWithArrow(text: currentLangText),
            onTap: () => _showLanguageBottomSheet(context), 
          ),
        ],
      ),
    );
  }

  void _showLanguageBottomSheet(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final currentLangCode = Provider.of<LanguageProvider>(context, listen: false).currentLocale.languageCode;

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent, 
      builder: (bottomSheetContext) {
        return Container(
          padding: const EdgeInsets.all(24),
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(l10n.settingsLanguage, style: AppTextStyles.dialogTitle24),
              const SizedBox(height: 24),
              
              // اختيار اللغة الإنجليزية
              ListTile(
                onTap: () {
                  Provider.of<LanguageProvider>(context, listen: false).changeLanguage('en');
                  Navigator.pop(bottomSheetContext);
                },
                contentPadding: EdgeInsets.zero,
                title: const Text('English', style: AppTextStyles.settingsItemTitle16),
                trailing: currentLangCode == 'en' 
                    ? const Icon(Icons.check_circle, color: AppColors.primary) 
                    : null,
              ),
              const SettingsDivider(),
              
              // اختيار اللغة العربية
              ListTile(
                onTap: () {
                  Provider.of<LanguageProvider>(context, listen: false).changeLanguage('ar');
                  Navigator.pop(bottomSheetContext);
                },
                contentPadding: EdgeInsets.zero,
                title: const Text('العربية', style: AppTextStyles.settingsItemTitle16),
                trailing: currentLangCode == 'ar' 
                    ? const Icon(Icons.check_circle, color: AppColors.primary) 
                    : null,
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}

// ==========================================
// --- 4. Notifications Card ---
// ==========================================
class NotificationsSettingsCard extends StatefulWidget {
  final NotificationsModel notifications;

  const NotificationsSettingsCard({Key? key, required this.notifications}) : super(key: key);

  @override
  State<NotificationsSettingsCard> createState() => _NotificationsSettingsCardState();
}

class _NotificationsSettingsCardState extends State<NotificationsSettingsCard> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          SettingsListTile(
            icon: Icons.notifications_none, 
            title: l10n.settingsPushNotif, 
            trailing: CustomCheckbox(
              value: widget.notifications.pushNotifEnabled, 
              onChanged: (v) => setState(() => widget.notifications.pushNotifEnabled = v!),
            ),
          ),
          const SettingsDivider(),
          SubSettingsItem(
            title: l10n.settingsWorkoutReminders, 
            value: widget.notifications.workoutRemindersEnabled, 
            onChanged: (v) => setState(() => widget.notifications.workoutRemindersEnabled = v!),
          ),
          SubSettingsItem(
            title: l10n.settingsCoachMessages, 
            value: widget.notifications.coachMessagesEnabled, 
            onChanged: (v) => setState(() => widget.notifications.coachMessagesEnabled = v!),
          ),
          SubSettingsItem(
            title: l10n.settingsSocialActivity, 
            value: widget.notifications.socialActivityEnabled, 
            onChanged: (v) => setState(() => widget.notifications.socialActivityEnabled = v!),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

// ==========================================
// --- 5. Support Card ---
// ==========================================
class SupportSettingsCard extends StatelessWidget {
  const SupportSettingsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          SettingsListTile(icon: Icons.help_outline, title: l10n.settingsHelpCenter, trailing: const Icon(Icons.chevron_right, color: AppColors.iconGrey)),
          const SettingsDivider(),
          SettingsListTile(icon: Icons.shield_outlined, title: l10n.settingsPrivacyPolicy, trailing: const Icon(Icons.chevron_right, color: AppColors.iconGrey)),
          const SettingsDivider(),
          SettingsListTile(icon: Icons.star_border, title: l10n.settingsRateKinetic, trailing: const Icon(Icons.chevron_right, color: AppColors.iconGrey)),
        ],
      ),
    );
  }
}

// ==========================================
// --- Shared Micro-Widgets ---
// ==========================================
class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, left: 4),
      child: Text(title, style: AppTextStyles.settingsSectionTitle10),
    );
  }
}

class SettingsListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final Widget trailing;
  final VoidCallback? onTap; 

  const SettingsListTile({
    Key? key, 
    required this.icon, 
    required this.title, 
    this.subtitle, 
    required this.trailing,
    this.onTap, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap, 
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(color: AppColors.insightBg, borderRadius: BorderRadius.circular(8)),
        child: Icon(icon, color: AppColors.primary, size: 24),
      ),
      title: Text(title, style: AppTextStyles.settingsItemTitle16),
      subtitle: subtitle != null ? Text(subtitle!, style: AppTextStyles.settingsItemSubtitle12) : null,
      trailing: trailing,
    );
  }
}

class SubSettingsItem extends StatelessWidget {
  final String title;
  final bool value;
  final Function(bool?) onChanged;

  const SubSettingsItem({Key? key, required this.title, required this.value, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 64, right: 16, top: 12, bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppTextStyles.settingsSubItem14),
          CustomCheckbox(value: value, onChanged: onChanged),
        ],
      ),
    );
  }
}

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final Function(bool?) onChanged;

  const CustomCheckbox({Key? key, required this.value, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      width: 24,
      child: Checkbox(
        value: value,
        onChanged: onChanged,
        activeColor: AppColors.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
    );
  }
}

class TextWithArrow extends StatelessWidget {
  final String text;
  const TextWithArrow({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(text, style: AppTextStyles.settingsTrailingText14),
        const SizedBox(width: 4),
        const Icon(Icons.chevron_right, color: AppColors.iconGrey),
      ],
    );
  }
}

class SettingsDivider extends StatelessWidget {
  const SettingsDivider({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => const Divider(color: AppColors.divider, height: 1, indent: 64, endIndent: 16);
}

// ==========================================
// --- 6. Logout Button ---
// ==========================================
class SettingsLogoutButton extends StatelessWidget {
  const SettingsLogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return SizedBox(
      width: double.infinity,
      child: TextButton.icon(
        onPressed: () {
          showDialog(
            context: context,
            barrierColor: Colors.black.withOpacity(0.4), 
            builder: (context) => const LogoutConfirmationDialog(),
          );
        },
        style: TextButton.styleFrom(
          backgroundColor: AppColors.errorLightBg, 
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        icon: const Icon(Icons.logout, color: AppColors.errorRed), 
        label: Text(
          l10n.logOutTitle,
          style: AppTextStyles.settingsLogout16, 
        ),
      ),
    );
  }
}

// ==========================================
// --- 7. Logout Confirmation Dialog ---
// ==========================================
class LogoutConfirmationDialog extends StatelessWidget {
  const LogoutConfirmationDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0), 
      child: Dialog(
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min, 
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: AppColors.errorLightBg, 
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.logout, color: AppColors.errorRed, size: 28),
              ),
              const SizedBox(height: 24),
              
              Text(l10n.logOutTitle, style: AppTextStyles.dialogTitle24),
              const SizedBox(height: 12),
              
              Text(
                l10n.logOutConfirmation,
                textAlign: TextAlign.center,
                style: AppTextStyles.dialogBody16,
              ),
              const SizedBox(height: 32),
              
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()), 
                      (Route<dynamic> route) => false, 
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.errorRed,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
                    elevation: 0,
                  ),
                  child: Text(l10n.logOutTitle, style: AppTextStyles.dialogBtnRed16),
                ),
              ),
              const SizedBox(height: 12),
              
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context), 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.keepTrainingBg,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
                    elevation: 0,
                  ),
                  child: Text(l10n.cancel, style: AppTextStyles.dialogBtnGray16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}