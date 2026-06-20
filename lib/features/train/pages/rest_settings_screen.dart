import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart'; 
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';

class RestSettingsScreen extends StatefulWidget {
  const RestSettingsScreen({Key? key}) : super(key: key);

  @override
  State<RestSettingsScreen> createState() => _RestSettingsScreenState();
}

class _RestSettingsScreenState extends State<RestSettingsScreen> {
  int _restSeconds = 90; // 90 ثانية = 01:30
  bool _autoStartTimer = true;
  bool _soundAlerts = false;
  bool _hapticFeedback = true;

  String get formattedTime {
    int minutes = _restSeconds ~/ 60;
    int seconds = _restSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  void _increaseTime() {
    setState(() => _restSeconds += 10); 
  }

  void _decreaseTime() {
    if (_restSeconds > 10) {
      setState(() => _restSeconds -= 10); 
    }
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
          // تكبير عنوان الصفحة
          style: AppTextStyles.appBarTitle.copyWith(fontSize: 20, fontWeight: FontWeight.w900),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. قسم وقت الراحة الافتراضي
            _buildDefaultTimeSection(loc),
            const SizedBox(height: 32),

            // 2. قسم سلوك المؤقت
            Text(
              loc.timerBehavior, 
              // تكبير وتوضيح عنوان القسم
              style: AppTextStyles.body16.copyWith(color: AppColors.darkCharcoal, fontSize: 18, fontWeight: FontWeight.w900)
            ),
            const SizedBox(height: 16),
            _buildTimerBehaviorSection(loc),
            
            const SizedBox(height: 32),
            Container(width: 32, height: 2, color: AppColors.lightBlueWhite), 
            const SizedBox(height: 32),

            // 3. قسم لماذا الراحة مهمة
            Text(
              loc.whyRestMatters, 
              // تكبير وتوضيح عنوان لماذا الراحة مهمة
              style: AppTextStyles.heading24.copyWith(fontSize: 22, fontWeight: FontWeight.w900)
            ),
            const SizedBox(height: 16),
            _buildInfoCard(
              title: loc.hypertrophyFocusTitle,
              icon: Icons.trending_up,
              desc: loc.hypertrophyFocusDesc,
            ),
            const SizedBox(height: 16),
            _buildInfoCard(
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

  // ==========================================
  // قسم الوقت الافتراضي والكارت الرئيسي
  // ==========================================
  Widget _buildDefaultTimeSection(AppLocalizations loc) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              loc.defaultRestTime, 
              // توضيح عنوان الكارت الرئيسي
              style: AppTextStyles.title18Dark.copyWith(fontSize: 18, fontWeight: FontWeight.w800)
            ),
            Text(
              loc.activeTag.toUpperCase(), 
              // تكبير كلمة ACTIVE
              style: AppTextStyles.label10Blue.copyWith(fontSize: 12, fontWeight: FontWeight.w900)
            ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
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
                // تكبير وتوضيح دقائق : ثواني
                style: AppTextStyles.timerSub10.copyWith(fontSize: 12, fontWeight: FontWeight.w800)
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildCircleButton(Icons.remove, _decreaseTime),
                  const SizedBox(width: 16),
                  ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                      elevation: 0,
                    ),
                    icon: const Icon(Icons.check_circle, color: AppColors.white, size: 20),
                    label: Text(
                      loc.saveAction.toUpperCase(),
                      // توضيح زر الحفظ
                      style: AppTextStyles.primaryButton16.copyWith(fontSize: 16, fontWeight: FontWeight.w900, letterSpacing: 1.2),
                    ),
                  ),
                  const SizedBox(width: 16),
                  _buildCircleButton(Icons.add, _increaseTime),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCircleButton(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Container(
        width: 52, // تكبير الزراير الدائرية قليلاً لتناسب الحجم الجديد
        height: 52,
        decoration: const BoxDecoration(
          color: AppColors.surfaceColor,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: AppColors.darkCharcoal, size: 28), // تغميق وتكبير الأيقونات (+ و -)
      ),
    );
  }

  // ==========================================
  // قسم إعدادات سلوك المؤقت (Toggles)
  // ==========================================
  Widget _buildTimerBehaviorSection(AppLocalizations loc) {
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
            value: _autoStartTimer,
            onChanged: (val) => setState(() => _autoStartTimer = val),
          ),
          const SizedBox(height: 8),
          _buildToggleItem(
            icon: Icons.volume_up_outlined,
            title: loc.soundAlerts,
            subtitle: loc.soundAlertsDesc,
            value: _soundAlerts,
            onChanged: (val) => setState(() => _soundAlerts = val),
          ),
          const SizedBox(height: 8),
          _buildToggleItem(
            icon: Icons.vibration,
            title: loc.hapticFeedback,
            subtitle: loc.hapticFeedbackDesc,
            value: _hapticFeedback,
            onChanged: (val) => setState(() => _hapticFeedback = val),
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
            padding: const EdgeInsets.all(12), // تكبير مساحة الأيقونة
            decoration: const BoxDecoration(
              color: AppColors.surfaceColor,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppColors.primary, size: 24), // تكبير الأيقونة
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // تكبير العناوين الفرعية وجعلها بولد
                Text(title, style: AppTextStyles.settingsItemTitle16.copyWith(fontSize: 16, fontWeight: FontWeight.w800)),
                const SizedBox(height: 4),
                // تكبير الوصف ليكون مقروء بشكل مريح
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

  // ==========================================
  // قسم الكروت المعلوماتية (Why Rest Matters)
  // ==========================================
  Widget _buildInfoCard({required String title, required IconData icon, required String desc}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24), // تزويد الـ Padding لراحة العين
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20), // زوايا أدائرية أكثر
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
              // تكبير وتوضيح عناوين الكروت
              Text(title, style: AppTextStyles.label10Blue.copyWith(fontSize: 12, fontWeight: FontWeight.w900)),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            desc,
            // تكبير وصف الكروت ورفع درجة الوزن
            style: AppTextStyles.body14Height.copyWith(color: AppColors.darkCharcoal, fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}