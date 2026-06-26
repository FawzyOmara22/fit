import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/coaching/provider/notifications_provider.dart';
import 'package:kinetic/features/coaching/widgets/notification_widgets.dart';
import 'package:provider/provider.dart';



class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  void initState() {
    super.initState();
    // جلب الإشعارات من الـ API بمجرد فتح الشاشة
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<NotificationsProvider>(context, listen: false).fetchNotifications();
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBackground,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(l10n.notificationsTitle, style: AppTextStyles.appBarTitle.copyWith(fontSize: 20)),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz, color: AppColors.primary),
            onPressed: () {},
          ),
        ],
      ),
      body: Consumer<NotificationsProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator(color: AppColors.primary));
          }

          final notifications = provider.filteredNotifications;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              // فلتر الإشعارات
              FilterChipRow(
                selectedIndex: provider.selectedFilterIndex,
                onSelected: provider.setFilter,
              ),
              const SizedBox(height: 20),
              
              // قائمة الإشعارات
              Expanded(
                child: ListView.builder(
                  itemCount: notifications.length + 1, // +1 عشان كارت الـ Pro Tip في الآخر
                  itemBuilder: (context, index) {
                    if (index == notifications.length) {
                      return const ProTipCard();
                    }
                    return NotificationCard(notification: notifications[index]);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}