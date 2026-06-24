import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';

// -----------------------------------------------------------------
// 1. كارت الوقت الافتراضي (التايمر الكبير والأزرار)
// -----------------------------------------------------------------
class DefaultTimeCard extends StatelessWidget {
  final String formattedTime;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  final VoidCallback onSave;

  const DefaultTimeCard({
    Key? key,
    required this.formattedTime,
    required this.onIncrease,
    required this.onDecrease,
    required this.onSave,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 20,
            offset: const Offset(0, 10),
          )
        ],
      ),
      child: Column(
        children: [
          Text(formattedTime, style: AppTextStyles.timerHuge80),
          const SizedBox(height: 8),
          Text(
            loc.minutesSeconds,
            style: AppTextStyles.timerSub10.copyWith(fontSize: 12, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildCircleButton(Icons.remove, onDecrease),
              const SizedBox(width: 16),
              ElevatedButton.icon(
                onPressed: onSave,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                  elevation: 0,
                ),
                icon: const Icon(Icons.check_circle, color: AppColors.white, size: 20),
                label: Text(
                  loc.saveAction.toUpperCase(),
                  style: AppTextStyles.primaryButton16.copyWith(fontSize: 16, fontWeight: FontWeight.w900, letterSpacing: 1.2),
                ),
              ),
              const SizedBox(width: 16),
              _buildCircleButton(Icons.add, onIncrease),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildCircleButton(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Container(
        width: 52,
        height: 52,
        decoration: const BoxDecoration(
          color: AppColors.surfaceColor,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: AppColors.darkCharcoal, size: 28),
      ),
    );
  }
}

// -----------------------------------------------------------------
// 2. حاوية سلوك المؤقت (قائمة الـ Toggles)
// -----------------------------------------------------------------
class TimerBehaviorCard extends StatelessWidget {
  final bool autoStartTimer;
  final bool soundAlerts;
  final bool hapticFeedback;
  final ValueChanged<bool> onAutoStartChanged;
  final ValueChanged<bool> onSoundChanged;
  final ValueChanged<bool> onHapticChanged;

  const TimerBehaviorCard({
    Key? key,
    required this.autoStartTimer,
    required this.soundAlerts,
    required this.hapticFeedback,
    required this.onAutoStartChanged,
    required this.onSoundChanged,
    required this.onHapticChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          _buildToggleItem(
            icon: Icons.play_arrow,
            title: loc.autoStartTimer,
            subtitle: loc.autoStartTimerDesc,
            value: autoStartTimer,
            onChanged: onAutoStartChanged,
          ),
          const SizedBox(height: 8),
          _buildToggleItem(
            icon: Icons.volume_up_outlined,
            title: loc.soundAlerts,
            subtitle: loc.soundAlertsDesc,
            value: soundAlerts,
            onChanged: onSoundChanged,
          ),
          const SizedBox(height: 8),
          _buildToggleItem(
            icon: Icons.vibration,
            title: loc.hapticFeedback,
            subtitle: loc.hapticFeedbackDesc,
            value: hapticFeedback,
            onChanged: onHapticChanged,
          ),
        ],
      ),
    );
  }

  Widget _buildToggleItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: AppColors.surfaceColor,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppColors.primary, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.settingsItemTitle16.copyWith(fontSize: 16, fontWeight: FontWeight.w800)),
                const SizedBox(height: 4),
                Text(subtitle, style: AppTextStyles.settingsItemSubtitle12.copyWith(fontSize: 12, color: AppColors.textGrey, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          CupertinoSwitch(
            value: value,
            activeColor: AppColors.primary,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}

// -----------------------------------------------------------------
// 3. كارت النصائح والمعلومات (Why Rest Matters)
// -----------------------------------------------------------------
class RestInfoCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final String desc;

  const RestInfoCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.desc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 15,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: AppColors.primary, size: 20),
              const SizedBox(width: 8),
              Text(title, style: AppTextStyles.label10Blue.copyWith(fontSize: 12, fontWeight: FontWeight.w900)),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            desc,
            style: AppTextStyles.body14Height.copyWith(color: AppColors.darkCharcoal, fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}