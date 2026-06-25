import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:provider/provider.dart';


// =========================================
// 1. AppBar
// =========================================
class IntegrationsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const IntegrationsAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: AppColors.primary),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(l10n.integrations, style: AppTextStyles.appBarTitle),
      actions: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: CircleAvatar(
            radius: 16,
            backgroundImage: NetworkImage('https://i.pravatar.cc/100'), // صورة وهمية لليوزر
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

// =========================================
// 2. Header Section
// =========================================
class IntegrationsHeader extends StatelessWidget {
  const IntegrationsHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.sync_ecosystem, style: AppTextStyles.sectionLabel),
        const SizedBox(height: 8),
        Text(l10n.connect_sync, style: AppTextStyles.heading36Black),
        const SizedBox(height: 8),
        Text(l10n.connect_sync_desc, style: AppTextStyles.body16.copyWith(height: 1.4)),
      ],
    );
  }
}

// =========================================
// 3. Section Title
// =========================================
class IntegrationSectionTitle extends StatelessWidget {
  final String title;
  const IntegrationSectionTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title.toUpperCase(),
      style: AppTextStyles.settingsSectionTitle10.copyWith(letterSpacing: 1.5),
    );
  }
}

// =========================================
// 4. Integration Item Card (Reusable)
// =========================================
class IntegrationCard extends StatelessWidget {
  final Widget iconWidget;
  final String title;
  final bool isConnected;
  final Widget trailingWidget;

  const IntegrationCard({
    Key? key,
    required this.iconWidget,
    required this.title,
    required this.isConnected,
    required this.trailingWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: AppColors.darkCharcoal5, blurRadius: 10, offset: Offset(0, 4))],
      ),
      child: Row(
        children: [
          iconWidget,
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.settingsItemTitle16),
                const SizedBox(height: 2),
                Text(
                  isConnected ? l10n.connected : l10n.not_connected,
                  style: AppTextStyles.settingsItemSubtitle12.copyWith(
                    color: isConnected ? AppColors.primary : AppColors.textGrey,
                  ),
                ),
              ],
            ),
          ),
          trailingWidget,
        ],
      ),
    );
  }
}

// =========================================
// 5. App Icons (Custom Designed to match image)
// =========================================
class AppIconContainer extends StatelessWidget {
  final IconData icon;
  final Color bgColor;
  final Color iconColor;

  const AppIconContainer({Key? key, required this.icon, required this.bgColor, required this.iconColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(12)),
      child: Icon(icon, color: iconColor, size: 24),
    );
  }
}

// =========================================
// 6. Connect Button
// =========================================
class ConnectActionBtn extends StatelessWidget {
  final VoidCallback onTap;
  const ConnectActionBtn({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(color: AppColors.surfaceColor, borderRadius: BorderRadius.circular(20)),
        child: Text(
          l10n.connect_btn,
          style: const TextStyle(color: AppColors.darkCharcoal, fontSize: 14, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}

// =========================================
// 7. Data Privacy Card
// =========================================
class DataPrivacyCard extends StatelessWidget {
  const DataPrivacyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.shield_outlined, color: Colors.white, size: 28),
              const SizedBox(width: 12),
              Text(l10n.data_privacy, style: AppTextStyles.heading24.copyWith(color: Colors.white, fontWeight: FontWeight.w700)),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            l10n.data_privacy_desc,
            style: const TextStyle(color: Colors.white, fontSize: 14, height: 1.5, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: Colors.white.withOpacity(0.3)),
            ),
            child: Text(
              l10n.view_privacy_policy,
              style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}