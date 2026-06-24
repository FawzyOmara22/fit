import 'package:flutter/material.dart';
import 'package:kinetic/features/train/logic/workout_provider.dart';
import 'package:kinetic/features/train/widgets/rest_settings_widgets.dart';
import 'package:provider/provider.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';

class RestSettingsScreen extends StatefulWidget {
  const RestSettingsScreen({Key? key}) : super(key: key);

  @override
  State<RestSettingsScreen> createState() => _RestSettingsScreenState();
}

class _RestSettingsScreenState extends State<RestSettingsScreen> {
  late int _restSeconds;
  late bool _autoStartTimer;
  late bool _soundAlerts;
  late bool _hapticFeedback;

  @override
  void initState() {
    super.initState();
    final workoutProvider = context.read<WorkoutProvider>();
    _restSeconds = workoutProvider.defaultRestSeconds;
    _autoStartTimer = workoutProvider.autoStartTimer;
    _soundAlerts = workoutProvider.soundAlerts;
    _hapticFeedback = workoutProvider.hapticFeedback;
  }

  String get formattedTime {
    int minutes = _restSeconds ~/ 60;
    int seconds = _restSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  void _increaseTime() => setState(() => _restSeconds += 10);

  void _decreaseTime() {
    if (_restSeconds > 10) setState(() => _restSeconds -= 10);
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          loc.restSettingsTitle,
          style: AppTextStyles.appBarTitle.copyWith(fontSize: 20, fontWeight: FontWeight.w900),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(loc.defaultRestTime, style: AppTextStyles.title18Dark.copyWith(fontSize: 18, fontWeight: FontWeight.w800)),
                Text(loc.activeTag.toUpperCase(), style: AppTextStyles.label10Blue.copyWith(fontSize: 12, fontWeight: FontWeight.w900)),
              ],
            ),
            const SizedBox(height: 16),
            DefaultTimeCard(
              formattedTime: formattedTime,
              onIncrease: _increaseTime,
              onDecrease: _decreaseTime,
              onSave: () async {
                // 👇 حفظ البيانات كلها لايف في البروفايدر والذاكرة
                await context.read<WorkoutProvider>().saveRestSettings(
                  seconds: _restSeconds,
                  autoStart: _autoStartTimer,
                  sound: _soundAlerts,
                  haptic: _hapticFeedback,
                );
                if (mounted) {
                  Navigator.of(context).pop();
                }
              },
            ),
            const SizedBox(height: 32),
            Text(
              loc.timerBehavior,
              style: AppTextStyles.body16.copyWith(color: AppColors.darkCharcoal, fontSize: 18, fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 16),
            TimerBehaviorCard(
              autoStartTimer: _autoStartTimer,
              soundAlerts: _soundAlerts,
              hapticFeedback: _hapticFeedback,
              onAutoStartChanged: (val) => setState(() => _autoStartTimer = val),
              onSoundChanged: (val) => setState(() => _soundAlerts = val),
              onHapticChanged: (val) => setState(() => _hapticFeedback = val),
            ),
            const SizedBox(height: 32),
            Container(width: 32, height: 2, color: AppColors.lightBlueWhite),
            const SizedBox(height: 32),
            Text(
              loc.whyRestMatters,
              style: AppTextStyles.heading24.copyWith(fontSize: 22, fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 16),
            RestInfoCard(
              title: loc.hypertrophyFocusTitle,
              icon: Icons.trending_up,
              desc: loc.hypertrophyFocusDesc,
            ),
            const SizedBox(height: 16),
            RestInfoCard(
              title: loc.strengthFocusTitle,
              icon: Icons.open_in_full,
              desc: loc.strengthFocusDesc,
            ),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }
}