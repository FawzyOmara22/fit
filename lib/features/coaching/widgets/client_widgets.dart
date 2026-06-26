import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/coaching/models/client_model.dart';


// دالة مساعدة لترجمة النصوص
String _getLocalized(String key, AppLocalizations l10n) {
  switch (key) {
    case 'thisMonth': return l10n.thisMonth;
    case 'updatesWaiting': return l10n.updatesWaiting;
    default: return key;
  }
}

// ==========================================
// 1. كروت الإحصائيات العلوية
// ==========================================
class DashboardStatsRow extends StatelessWidget {
  final ClientDashboardModel data;
  final AppLocalizations l10n;
  const DashboardStatsRow({Key? key, required this.data, required this.l10n}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(l10n.activeClients, style: AppTextStyles.label10GreyDark),
                const SizedBox(height: 12),
                Text('${data.activeClientsCount}', style: AppTextStyles.heading36Primary), // رقم أزرق
                const SizedBox(height: 4),
                Text(_getLocalized(data.activeClientsSub, l10n), style: AppTextStyles.body14Height.copyWith(fontSize: 13)),
              ],
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(l10n.pendingReviews, style: AppTextStyles.label10GreyDark),
                    const SizedBox(width: 4),
                    if (data.pendingReviewsCount > 0)
                      Container(width: 6, height: 6, decoration: const BoxDecoration(color: AppColors.errorRed, shape: BoxShape.circle)),
                  ],
                ),
                const SizedBox(height: 12),
                Text('${data.pendingReviewsCount}', style: AppTextStyles.heading36Black), // رقم أسود
                const SizedBox(height: 4),
                Text(_getLocalized(data.pendingReviewsSub, l10n), style: AppTextStyles.body14Height.copyWith(fontSize: 13)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ==========================================
// 2. شريط البحث
// ==========================================
class SearchClientBar extends StatelessWidget {
  final AppLocalizations l10n;
  const SearchClientBar({Key? key, required this.l10n}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: TextField(
        decoration: InputDecoration(
          hintText: l10n.searchClients,
          hintStyle: AppTextStyles.body14Height.copyWith(color: AppColors.iconGrey),
          border: InputBorder.none,
          icon: const Icon(Icons.search, color: AppColors.iconGrey),
        ),
      ),
    );
  }
}

// ==========================================
// 3. كارت العميل (Client Card)
// ==========================================
class ClientCard extends StatelessWidget {
  final ClientModel client;
  final AppLocalizations l10n;
  const ClientCard({Key? key, required this.client, required this.l10n}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // تحديد ألوان ونصوص الحالة
    Color badgeBgColor;
    Color badgeTextColor;
    String badgeText;
    
    if (client.status == ClientStatus.needsReview) {
      badgeBgColor = const Color(0xFFFDE9EA); // أحمر فاتح
      badgeTextColor = AppColors.errorRed;
      badgeText = l10n.needsReview;
    } else if (client.status == ClientStatus.onTrack) {
      badgeBgColor = AppColors.lightBlueWhite; // أزرق فاتح
      badgeTextColor = AppColors.primary;
      badgeText = l10n.onTrack;
    } else {
      badgeBgColor = AppColors.inputBackground; // رمادي فاتح
      badgeTextColor = AppColors.iconGrey;
      badgeText = l10n.inactive;
    }

    final bool isInactive = client.status == ClientStatus.inactive;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Column(
        children: [
          // Header (Avatar, Name, Badge, Chat Icon)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  CircleAvatar(radius: 26, backgroundImage: NetworkImage(client.avatarUrl)),
                  if (client.hasAlert)
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 14, height: 14,
                        decoration: BoxDecoration(color: AppColors.errorRed, shape: BoxShape.circle, border: Border.all(color: Colors.white, width: 2)),
                      ),
                    ),
                ],
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(client.name, style: AppTextStyles.cardTitle18.copyWith(color: isInactive ? AppColors.iconGrey : AppColors.darkCharcoal)),
                    const SizedBox(height: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(color: badgeBgColor, borderRadius: BorderRadius.circular(8)),
                      child: Text(badgeText.toUpperCase(), style: AppTextStyles.label10Blue.copyWith(color: badgeTextColor, fontSize: 9)),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(color: AppColors.background, shape: BoxShape.circle),
                child: Icon(Icons.chat_bubble_outline, color: isInactive ? AppColors.iconGrey : AppColors.primary, size: 20),
              ),
            ],
          ),
          
          if (!isInactive) ...[
            const SizedBox(height: 20),
            // Latest Activity Container
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: AppColors.background, borderRadius: BorderRadius.circular(16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(l10n.latestActivity, style: AppTextStyles.label10GreyDark),
                      Text(client.timeAgo, style: AppTextStyles.body14Height.copyWith(fontSize: 11)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(client.latestActivityTitle, style: AppTextStyles.addExCardTitle),
                  
                  if (client.progress != null) ...[
                    const SizedBox(height: 12),
                    LinearProgressIndicator(
                      value: client.progress,
                      backgroundColor: AppColors.divider,
                      valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
                      borderRadius: BorderRadius.circular(4),
                      minHeight: 4,
                    ),
                  ],
                ],
              ),
            ),
            
            const SizedBox(height: 20),
            // Footer (Consistency & View Logs)
            Row(
              children: [
                _ConsistencyChartIcon(level: client.consistency),
                const SizedBox(width: 8),
                Text(
                  '${l10n.consistency}: ${client.consistency == ConsistencyLevel.high ? l10n.consistencyHigh : l10n.consistencyStable}', 
                  style: AppTextStyles.body14Height.copyWith(fontSize: 13)
                ),
                const Spacer(),
                Text(l10n.viewLogs, style: AppTextStyles.body14BlueNoHeight),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

// رسمة بسيطة لأعمدة الاستمرارية
class _ConsistencyChartIcon extends StatelessWidget {
  final ConsistencyLevel level;
  const _ConsistencyChartIcon({required this.level});

  @override
  Widget build(BuildContext context) {
    Color activeColor = AppColors.primary;
    Color inactiveColor = AppColors.primary.withOpacity(0.3);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _Bar(height: 8, color: inactiveColor),
        const SizedBox(width: 2),
        _Bar(height: 12, color: inactiveColor),
        const SizedBox(width: 2),
        _Bar(height: 16, color: activeColor),
        const SizedBox(width: 2),
        _Bar(height: 20, color: level == ConsistencyLevel.high ? activeColor : inactiveColor),
      ],
    );
  }
}

class _Bar extends StatelessWidget {
  final double height;
  final Color color;
  const _Bar({required this.height, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 4,
      height: height,
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(2)),
    );
  }
}