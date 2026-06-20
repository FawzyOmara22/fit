import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/features/profile/models/profile_model.dart';
import 'package:kinetic/features/profile/models/training_calendar_model.dart'; // تم إضافة مسار الموديل هنا
import 'package:kinetic/features/profile/pages/exercise_progress_screen.dart';
import 'package:kinetic/features/profile/pages/settings_screen.dart';
import 'package:kinetic/features/profile/pages/training_calendar_screen.dart';
import 'package:kinetic/features/profile/widgets/profile_widgets.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ProfileModel profileData;

  @override
  void initState() {
    super.initState();
    // تحميل البيانات (ممكن بعدين تغيرها لتستقبل من API)
    profileData = ProfileModel.defaultProfile();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: AppColors.darkCharcoal),
        title: Text(l10n.profileTitle, style: AppTextStyles.profileAppBar18),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined, color: AppColors.textGrey),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            ProfileHeader(profile: profileData),
            const SizedBox(height: 30),
            
            TotalVolumeCard(profile: profileData),
            const SizedBox(height: 16),
            
            StatsCardsRow(profile: profileData),
            const SizedBox(height: 24),
            
            TrainingConsistency(
              profile: profileData,
              onTap: () {
                // كود الانتقال الفعلي لصفحة التمرين مع تمرير البيانات
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TrainingCalendarScreen(
                      data: TrainingCalendarModel.defaultCalendar(), // تم تمرير البيانات هنا
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 24),
            
           LibrarySection(
              onExercisesLoggedTap: () {
                // كود الانتقال لصفحة تطور التمرين
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ExerciseProgressScreen(), // اسم الصفحة اللي عملناها
                  ),
                );
              },
            ),
            const SizedBox(height: 24),
            
            const RecentBadges(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}