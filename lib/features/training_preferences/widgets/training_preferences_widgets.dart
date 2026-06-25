import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/training_preferences/provider/preferences_provider.dart';
import 'package:provider/provider.dart';


// =========================================
// 1. AppBar
// =========================================
class PreferencesAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PreferencesAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final provider = context.read<PreferencesProvider>();

    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: AppColors.primary),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(l10n.training_prefs, style: AppTextStyles.appBarTitle),
      actions: [
        IconButton(
          icon: const Icon(Icons.language, color: AppColors.primary),
          onPressed: () => provider.toggleLanguage(),
        ),
        const Center(child: Text('KINETIC', style: AppTextStyles.kineticLogo)),
        const SizedBox(width: 20),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

// =========================================
// 2. Header Title & Description
// =========================================
class PreferencesHeader extends StatelessWidget {
  const PreferencesHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.customization, style: AppTextStyles.sectionLabel),
        const SizedBox(height: 8),
        Text(l10n.precision_tuning, style: AppTextStyles.heading36Black),
        const SizedBox(height: 8),
        Text(l10n.precision_desc, style: AppTextStyles.body16.copyWith(height: 1.4)),
      ],
    );
  }
}

// =========================================
// 3. Section Title (Reusable)
// =========================================
class SectionTitle extends StatelessWidget {
  final String title;
  final String rightLabel;

  const SectionTitle({Key? key, required this.title, required this.rightLabel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(title, style: AppTextStyles.title18Dark),
        Text(rightLabel, style: AppTextStyles.settingsSectionTitle10),
      ],
    );
  }
}

// =========================================
// 4. Workout Settings Card
// =========================================
class WorkoutSettingsCard extends StatelessWidget {
  const WorkoutSettingsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final provider = context.watch<PreferencesProvider>();
    final prefs = provider.preferences!;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: AppColors.darkCharcoal5, blurRadius: 10, offset: Offset(0, 4))],
      ),
      child: Column(
        children: [
          SettingsItemRow(
            icon: Icons.timer_outlined,
            title: l10n.default_rest_timer,
            subtitle: '${l10n.recommended}: 01:30',
            trailing: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(color: AppColors.lightBlueWhite, borderRadius: BorderRadius.circular(12)),
              child: const Text('01:30', style: TextStyle(color: AppColors.primary, fontSize: 14, fontWeight: FontWeight.w700)),
            ),
          ),
          const Divider(height: 1, color: AppColors.surfaceColor, indent: 60),
          SettingsItemRow(
            icon: Icons.fitness_center,
            title: l10n.weight_units,
            subtitle: l10n.metric_vs_imperial,
            trailing: const WeightUnitToggle(),
          ),
          const Divider(height: 1, color: AppColors.surfaceColor, indent: 60),
          SettingsItemRow(
            icon: Icons.volume_up_outlined,
            title: l10n.sound_effects,
            trailing: CupertinoSwitch(
              value: prefs.soundEffects,
              activeColor: AppColors.primary,
              onChanged: (val) => provider.toggleSoundEffects(val),
            ),
          ),
        ],
      ),
    );
  }
}

// =========================================
// 5. Automation Card
// =========================================
class AutomationCard extends StatelessWidget {
  const AutomationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final provider = context.watch<PreferencesProvider>();
    final prefs = provider.preferences!;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: AppColors.darkCharcoal5, blurRadius: 10, offset: Offset(0, 4))],
      ),
      child: Column(
        children: [
          SettingsItemRow(
            icon: Icons.autorenew,
            title: l10n.auto_start_rest,
            trailing: CupertinoSwitch(
              value: prefs.autoStartRestTimer,
              activeColor: AppColors.primary,
              onChanged: (val) => provider.toggleAutoStartRest(val),
            ),
          ),
          const Divider(height: 1, color: AppColors.surfaceColor, indent: 60),
          SettingsItemRow(
            icon: Icons.fast_forward,
            title: l10n.auto_advance,
            trailing: CupertinoSwitch(
              value: prefs.autoAdvanceExercises,
              activeColor: AppColors.primary,
              onChanged: (val) => provider.toggleAutoAdvance(val),
            ),
          ),
          const Divider(height: 1, color: AppColors.surfaceColor, indent: 60),
          SettingsItemRow(
            icon: Icons.vibration,
            title: l10n.vibrate_completion,
            trailing: CupertinoSwitch(
              value: prefs.vibrateOnCompletion,
              activeColor: AppColors.primary,
              onChanged: (val) => provider.toggleVibrate(val),
            ),
          ),
        ],
      ),
    );
  }
}

// =========================================
// 6. Equipment Section
// =========================================
class EquipmentSection extends StatelessWidget {
  const EquipmentSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final provider = context.watch<PreferencesProvider>();
    final prefs = provider.preferences!;

    return Row(
      children: [
        Expanded(
          child: EquipmentCard(
            icon: Icons.shopping_bag_outlined,
            tagTitle: l10n.default_barbell,
            valueText: '${prefs.defaultBarbellWeight} KG',
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [BoxShadow(color: AppColors.darkCharcoal5, blurRadius: 10, offset: Offset(0, 4))],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.bubble_chart_outlined, color: AppColors.primary),
                const SizedBox(height: 16),
                Text(l10n.fractionals, style: AppTextStyles.addExTagEquipment),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Text('${l10n.enabled}\n(0.5-1.25kg)', style: AppTextStyles.settingsItemTitle16)),
                    Transform.scale(
                      scale: 0.8,
                      child: CupertinoSwitch(
                        value: prefs.fractionalsEnabled,
                        activeColor: AppColors.primary,
                        onChanged: (val) => provider.toggleFractionals(val),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// =========================================
// 7. Apple Health Card
// =========================================
class AppleHealthCard extends StatelessWidget {
  const AppleHealthCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: AppColors.nearBlack, borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(color: AppColors.white, shape: BoxShape.circle),
                      child: const Icon(Icons.favorite, color: AppColors.errorRed, size: 16),
                    ),
                    const SizedBox(width: 12),
                    Text(l10n.apple_health, style: const TextStyle(color: AppColors.white, fontSize: 18, fontWeight: FontWeight.w700)),
                  ],
                ),
                const SizedBox(height: 12),
                Text(l10n.sync_workouts, style: const TextStyle(color: Colors.white70, fontSize: 14, height: 1.4)),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Container(width: 8, height: 8, decoration: const BoxDecoration(color: AppColors.successGreen, shape: BoxShape.circle)),
                    const SizedBox(width: 6),
                    Text(l10n.connected, style: const TextStyle(color: AppColors.successGreen, fontSize: 10, fontWeight: FontWeight.w800, letterSpacing: 1)),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(color: AppColors.darkCharcoal, borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.white24)),
            child: Text(l10n.configure, style: const TextStyle(color: AppColors.white, fontSize: 12, fontWeight: FontWeight.w700)),
          ),
        ],
      ),
    );
  }
}

// =========================================
// 8. Reset Action Component
// =========================================
class ResetPreferencesAction extends StatelessWidget {
  const ResetPreferencesAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      children: [
        GestureDetector(
          onTap: () { /* أضف لوجيك إعادة الضبط هنا */ },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(color: AppColors.surfaceColor, borderRadius: BorderRadius.circular(12)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.refresh, color: AppColors.errorRed, size: 20),
                const SizedBox(width: 8),
                Text(l10n.reset_prefs, style: AppTextStyles.settingsLogout16),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Center(
          child: Text(
            l10n.reset_note,
            textAlign: TextAlign.center,
            style: AppTextStyles.caption12.copyWith(color: AppColors.mutedGrey, height: 1.5),
          ),
        ),
      ],
    );
  }
}

// =========================================
// Micro-Widgets المساعدة (Internal Use)
// =========================================

class SettingsItemRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final Widget trailing;

  const SettingsItemRow({Key? key, required this.icon, required this.title, this.subtitle, required this.trailing}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: AppColors.lightBlueWhite, borderRadius: BorderRadius.circular(8)),
            child: Icon(icon, color: AppColors.primary, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.settingsItemTitle16),
                if (subtitle != null) ...[
                  const SizedBox(height: 2),
                  Text(subtitle!, style: AppTextStyles.settingsItemSubtitle12),
                ],
              ],
            ),
          ),
          trailing,
        ],
      ),
    );
  }
}

class WeightUnitToggle extends StatelessWidget {
  const WeightUnitToggle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PreferencesProvider>();
    final isKg = provider.preferences!.weightUnit == 'KG';

    return GestureDetector(
      onTap: () => provider.setWeightUnit(isKg ? 'LBS' : 'KG'),
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(color: AppColors.surfaceColor, borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _ToggleOption(text: 'KG', isSelected: isKg),
            _ToggleOption(text: 'LBS', isSelected: !isKg),
          ],
        ),
      ),
    );
  }
}

class _ToggleOption extends StatelessWidget {
  final String text;
  final bool isSelected;

  const _ToggleOption({required this.text, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(18),
        boxShadow: isSelected ? const [BoxShadow(color: Colors.black12, blurRadius: 2, offset: Offset(0, 1))] : [],
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? AppColors.primary : AppColors.textGrey,
          fontSize: 12,
          fontWeight: isSelected ? FontWeight.w800 : FontWeight.w700,
        ),
      ),
    );
  }
}

class EquipmentCard extends StatelessWidget {
  final IconData icon;
  final String tagTitle;
  final String valueText;

  const EquipmentCard({Key? key, required this.icon, required this.tagTitle, required this.valueText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: AppColors.darkCharcoal5, blurRadius: 10, offset: Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.primary),
          const SizedBox(height: 16),
          Text(tagTitle, style: AppTextStyles.addExTagEquipment),
          const SizedBox(height: 4),
          Text(valueText, style: AppTextStyles.trainVolumeValue24),
        ],
      ),
    );
  }
}