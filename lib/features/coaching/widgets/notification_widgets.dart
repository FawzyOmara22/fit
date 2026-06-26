import 'package:flutter/material.dart';
import 'package:kinetic/features/coaching/models/notification_model.dart';
import 'package:kinetic/features/coaching/provider/notifications_provider.dart';
import 'package:provider/provider.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';



class FilterChipRow extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onSelected;

  const FilterChipRow({
    Key? key,
    required this.selectedIndex,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final filters = [l10n.filterAll, l10n.filterWorkouts, l10n.filterMessages];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: List.generate(filters.length, (index) {
          final isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: () => onSelected(index),
            child: Container(
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : AppColors.surfaceColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                filters[index],
                style: TextStyle(
                  color: isSelected ? AppColors.white : AppColors.textGrey,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final NotificationModel notification;

  const NotificationCard({Key? key, required this.notification}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    String title = '';
    String time = ''; // تقدر بعدين تستخدم notification.createdAt وتعملها Format
    Widget bodyWidget = const SizedBox();
    Widget iconWidget = const SizedBox();

    // تجهيز الداتا بناءً على النوع اللي جاي من الـ API
    switch (notification.type) {
      case NotificationType.workout:
        title = l10n.newWorkoutAssigned;
        time = l10n.time2mAgo;
        iconWidget = _buildIcon(Icons.fitness_center, const Color(0xFFE0E7FF), AppColors.primary);
        bodyWidget = RichText(
          text: TextSpan(
            style: AppTextStyles.body14Height,
            children: [
              TextSpan(text: l10n.newWorkoutBody1),
              TextSpan(text: l10n.newWorkoutHighlight, style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.w700)),
              TextSpan(text: l10n.newWorkoutBody2),
            ],
          ),
        );
        break;
      case NotificationType.analysis:
        title = l10n.formAnalysisReady;
        time = l10n.time1hAgo;
        iconWidget = _buildIcon(Icons.bar_chart, const Color(0xFFF3E8FF), const Color(0xFF7E22CE));
        bodyWidget = Text(l10n.formAnalysisBody, style: AppTextStyles.body14Height);
        break;
      case NotificationType.message:
        title = l10n.messageFromCoach;
        time = l10n.time3hAgo;
        iconWidget = Stack(
          alignment: Alignment.bottomRight,
          children: [
            const CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=11'),
            ),
            Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(color: AppColors.white, shape: BoxShape.circle),
              child: const Icon(Icons.chat_bubble, color: AppColors.primary, size: 12),
            )
          ],
        );
        bodyWidget = Text(l10n.messageBody, style: AppTextStyles.body14Height.copyWith(fontStyle: FontStyle.italic));
        break;
      case NotificationType.achievement:
        title = l10n.achievementUnlocked;
        time = l10n.time6hAgo;
        iconWidget = _buildIcon(Icons.military_tech, const Color(0xFFFCE7F3), const Color(0xFFBE185D));
        
        // استخدام payload لو جاي من الـ API
        String weight = notification.payload?['weight'] ?? l10n.achievementHighlight;

        bodyWidget = RichText(
          text: TextSpan(
            style: AppTextStyles.body14Height,
            children: [
              TextSpan(text: l10n.achievementBody1),
              TextSpan(text: weight, style: const TextStyle(color: Color(0xFF883C93), fontWeight: FontWeight.w700)),
            ],
          ),
        );
        break;
      case NotificationType.plan:
        title = l10n.weeklyPlanUpdated;
        time = l10n.timeYesterday;
        iconWidget = _buildIcon(Icons.calendar_today, const Color(0xFFE0F2FE), const Color(0xFF0369A1));
        bodyWidget = Text(l10n.weeklyPlanBody, style: AppTextStyles.body14Height);
        break;
      case NotificationType.unknown:
      default:
        title = "Notification";
        time = "";
        iconWidget = _buildIcon(Icons.notifications, AppColors.divider, AppColors.textGrey);
        bodyWidget = const Text("You have a new notification");
    }

    return GestureDetector(
      onTap: () {
        // تحديث حالة الإشعار كـ مقروء وإرسالها للـ API
        if (notification.isUnread) {
          Provider.of<NotificationsProvider>(context, listen: false).markAsRead(notification.id);
        }
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12, left: 20, right: 20),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(color: AppColors.darkCharcoal5, blurRadius: 10, offset: Offset(0, 4))
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            iconWidget,
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(title, style: AppTextStyles.cardTitle16),
                      ),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          if (notification.isUnread)
                            Container(
                              margin: const EdgeInsets.only(bottom: 4, top: 4),
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
                            ),
                          Text(time, style: AppTextStyles.caption12.copyWith(color: AppColors.iconGrey)),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  bodyWidget,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(IconData icon, Color bgColor, Color iconColor) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon, color: iconColor, size: 20),
    );
  }
}

class ProTipCard extends StatelessWidget {
  const ProTipCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF2D2E33), Color(0xFF1E3A8A)],
        ),
        boxShadow: const [
          BoxShadow(color: AppColors.darkCharcoal50, blurRadius: 15, offset: Offset(0, 5))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.primaryLight,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              l10n.proTipBadge,
              style: AppTextStyles.label10Grey.copyWith(color: AppColors.white, letterSpacing: 1),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.masterRecoveryTitle,
            style: AppTextStyles.heading24.copyWith(color: AppColors.white, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 12),
          Text(
            l10n.masterRecoveryBody,
            style: AppTextStyles.body14Height.copyWith(color: AppColors.white70),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.white,
              foregroundColor: AppColors.nearBlack,
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(l10n.connectAppleHealth, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
                const SizedBox(width: 8),
                const Icon(Icons.arrow_forward, size: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}