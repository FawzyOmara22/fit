import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/features/profile/models/profile_model.dart';
import 'package:kinetic/features/profile/pages/measurements_screen.dart';
import 'package:kinetic/features/profile/pages/statistics_screen.dart';
import 'package:kinetic/features/profile/pages/workout_history_screen.dart';
// تم إضافة مسار صفحة الأرقام القياسية (تأكد من المسار لو مختلف عندك)
import 'package:kinetic/features/profile/pages/personal_record_screen.dart'; 
// مسار صفحة حصاد العام (تأكد من المسار لو مختلف عندك)
import 'package:kinetic/features/profile/pages/year_in_review_screen.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

// ==========================================
// --- 1. Profile Header Widget ---
// ==========================================
class ProfileHeader extends StatelessWidget {
  final ProfileModel profile;

  const ProfileHeader({Key? key, required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.primaryLight, width: 3),
              ),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(profile.profileImageUrl),
              ),
            ),
            if (profile.isVerified)
              Container(
                decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.white),
                child: const Icon(Icons.check_circle, color: AppColors.primary, size: 24),
              ),
          ],
        ),
        const SizedBox(height: 16),
        Text(profile.name, style: AppTextStyles.profileName30, textAlign: TextAlign.center),
        const SizedBox(height: 8),
        if (profile.isProMember)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(color: AppColors.cardSelectedBg, borderRadius: BorderRadius.circular(12)),
            child: Text(l10n.profileProMember, style: AppTextStyles.profileProMember10),
          ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildFollowStat('${profile.followers}', l10n.profileFollowers),
            const SizedBox(width: 40),
            _buildFollowStat('${profile.following}', l10n.profileFollowing),
          ],
        )
      ],
    );
  }

  Widget _buildFollowStat(String count, String label) {
    return Column(
      children: [
        Text(count, style: AppTextStyles.profileStat20),
        Text(label, style: AppTextStyles.profileStatLabel10),
      ],
    );
  }
}

// ==========================================
// --- 2. Total Volume Card ---
// ==========================================
class TotalVolumeCard extends StatelessWidget {
  final ProfileModel profile;

  const TotalVolumeCard({Key? key, required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const StatisticsScreen(), 
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(16)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(l10n.profileTotalVolume, style: AppTextStyles.profileProMember10),
                const SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text('${profile.totalVolume}', style: AppTextStyles.profileVolume36),
                    const SizedBox(width: 4),
                    Text(profile.volumeUnit, style: AppTextStyles.profileVolumeUnit18),
                  ],
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.lightGray),
              ),
              child: const Icon(Icons.show_chart, color: AppColors.primary),
            )
          ],
        ),
      ),
    );
  }
}

// ==========================================
// --- 3. Stats Cards Row ---
// ==========================================
class StatsCardsRow extends StatelessWidget {
  final ProfileModel profile;

  const StatsCardsRow({Key? key, required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Row(
      children: [
        // الكارت الأول: Workouts
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const WorkoutHistoryScreen(),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.white, 
                borderRadius: BorderRadius.circular(16)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.fitness_center, color: AppColors.primary),
                  const SizedBox(height: 16),
                  Text('${profile.totalWorkouts}', style: AppTextStyles.profileWorkouts24),
                  Text(l10n.profileWorkouts, style: AppTextStyles.profileStatLabel10),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        
        // الكارت التاني: Streak
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const WorkoutHistoryScreen(),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.local_fire_department, color: AppColors.white),
                  const SizedBox(height: 16),
                  Text('${profile.streakDays}', style: AppTextStyles.profileStreak24),
                  Text(l10n.profileDayStreak, style: AppTextStyles.profileStreakLabel10),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ==========================================
// --- 4. Training Consistency (Heatmap) ---
// ==========================================
class TrainingConsistency extends StatelessWidget {
  final ProfileModel profile;
  final VoidCallback? onTap;

  const TrainingConsistency({Key? key, required this.profile, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(l10n.profileTrainingConsistency, style: AppTextStyles.profileConsistency18),
                Text(l10n.profileLast6Months, style: AppTextStyles.profileConsistencySub12, textAlign: TextAlign.right),
              ],
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 4,
              runSpacing: 4,
              children: List.generate(profile.consistencyData.length, (index) {
                int opacityLevel = profile.consistencyData[index];
                Color boxColor = opacityLevel == 0 ? AppColors.lightGray : AppColors.primary.withOpacity(0.2 * opacityLevel);
                return Container(width: 12, height: 12, decoration: BoxDecoration(color: boxColor, borderRadius: BorderRadius.circular(2)));
              }),
            )
          ],
        ),
      ),
    );
  }
}

// ==========================================
// --- 5. Library Section ---
// ==========================================
class LibrarySection extends StatelessWidget {
  final VoidCallback? onExercisesLoggedTap;

  const LibrarySection({Key? key, this.onExercisesLoggedTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.profileLibrary, style: AppTextStyles.profileSectionTitle10),
        const SizedBox(height: 12),

        // --- الكارت الخاص بـ My year history ---
        _buildLibraryItem(
          Icons.event_repeat,
          'My year history', 
          AppColors.prBg, 
          AppColors.prText, 
          () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const YearInReviewScreen(),
              ),
            );
          },
        ),
        
        const SizedBox(height: 12),
        _buildLibraryItem(
          Icons.emoji_events_outlined, 
          l10n.profilePersonalRecords, 
          AppColors.cardSelectedBg, 
          AppColors.primary, 
          () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PersonalRecordScreen(),
              ),
            );
          }
        ),
        
        const SizedBox(height: 12),
        _buildLibraryItem(Icons.book_outlined, l10n.profileExercisesLogged, AppColors.white, AppColors.darkCharcoal, onExercisesLoggedTap),
        
        // --- الكارت الخاص بـ My Measurements ---
        const SizedBox(height: 12),
        _buildLibraryItem(
          Icons.straighten,
          'My Measurements',
          AppColors.insightBg, 
          Colors.blue,
          () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MeasurementsScreen(),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildLibraryItem(IconData icon, String title, Color bgColor, Color iconColor, VoidCallback? onTap) {
    return Material(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            leading: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(12)),
              child: Icon(icon, color: iconColor),
            ),
            title: Text(title, style: AppTextStyles.profileListText16),
            trailing: const Icon(Icons.chevron_right, color: AppColors.iconGrey),
          ),
        ),
      ),
    );
  }
}

// ==========================================
// --- 6. Recent Badges Section ---
// ==========================================
class RecentBadges extends StatelessWidget {
  const RecentBadges({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(l10n.profileRecentBadges, style: AppTextStyles.profileSectionTitle10),
            Text(l10n.profileViewAll, style: AppTextStyles.profileViewAll10),
          ],
        ),
        const SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildBadgeItem(Icons.workspace_premium, l10n.profileEarlyBird, Colors.amber),
              const SizedBox(width: 20),
              _buildBadgeItem(Icons.rocket_launch, l10n.profileCentury, AppColors.primary),
              const SizedBox(width: 20),
              _buildBadgeItem(Icons.lock_outline, l10n.profileLocked, AppColors.lightGray, isLocked: true),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildBadgeItem(IconData icon, String label, Color color, {bool isLocked = false}) {
    return Column(
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: color.withOpacity(isLocked ? 0.5 : 1),
            shape: BoxShape.circle,
            boxShadow: isLocked ? [] : [
              BoxShadow(color: color.withOpacity(0.4), blurRadius: 10, offset: const Offset(0, 4))
            ]
          ),
          child: Icon(icon, color: isLocked ? AppColors.textGrey : AppColors.white, size: 30),
        ),
        const SizedBox(height: 8),
        Text(label, style: AppTextStyles.profileBadge10),
      ],
    );
  }
}