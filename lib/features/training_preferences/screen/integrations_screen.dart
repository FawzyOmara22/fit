import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/features/training_preferences/provider/integration_provider.dart';
import 'package:kinetic/features/training_preferences/widgets/integrations_widgets.dart';
import 'package:provider/provider.dart';


class IntegrationsScreen extends StatelessWidget {
  const IntegrationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const IntegrationsAppBar(),
      body: Consumer<IntegrationProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator(color: AppColors.primary));
          }

          final prefs = provider.preferences!;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  const IntegrationsHeader(),
                  const SizedBox(height: 32),
                  
                  // --- Section 1: Health & Activity ---
                  IntegrationSectionTitle(title: l10n.health_activity),
                  const SizedBox(height: 16),
                  
                  // Apple Health
                  IntegrationCard(
                    title: l10n.apple_health,
                    isConnected: prefs.isAppleHealthConnected,
                    iconWidget: const AppIconContainer(
                      icon: Icons.favorite_border,
                      bgColor: Color(0xFFFDE9EA), // أحمر فاتح
                      iconColor: AppColors.errorRed,
                    ),
                    trailingWidget: CupertinoSwitch(
                      value: prefs.isAppleHealthConnected,
                      activeColor: AppColors.primary,
                      onChanged: (val) => provider.toggleAppleHealth(val),
                    ),
                  ),
                  
                  // Strava
                  IntegrationCard(
                    title: l10n.strava,
                    isConnected: prefs.isStravaConnected,
                    iconWidget: const AppIconContainer(
                      icon: Icons.directions_run,
                      bgColor: Color(0xFFFFF0E5), // برتقالي فاتح
                      iconColor: Color(0xFFFC5200), // برتقالي سترافا
                    ),
                    trailingWidget: ConnectActionBtn(onTap: provider.connectStrava),
                  ),

                  // Garmin Connect
                  IntegrationCard(
                    title: l10n.garmin_connect,
                    isConnected: prefs.isGarminConnected,
                    iconWidget: const AppIconContainer(
                      icon: Icons.watch_outlined,
                      bgColor: Color(0xFFF1F1F1), // رمادي فاتح
                      iconColor: Color(0xFF4B4B4B), // رمادي غامق
                    ),
                    trailingWidget: ConnectActionBtn(onTap: provider.connectGarmin),
                  ),

                  const SizedBox(height: 24),

                  // --- Section 2: Social & Sharing ---
                  IntegrationSectionTitle(title: l10n.social_sharing),
                  const SizedBox(height: 16),

                  // Instagram
                  IntegrationCard(
                    title: l10n.instagram,
                    isConnected: prefs.isInstagramConnected,
                    iconWidget: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFFF58529), Color(0xFFDD2A7B), Color(0xFF8134AF)],
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.camera_alt_outlined, color: Colors.white, size: 24),
                    ),
                    trailingWidget: ConnectActionBtn(onTap: provider.connectInstagram),
                  ),

                  // WhatsApp
                  IntegrationCard(
                    title: l10n.whatsapp,
                    isConnected: prefs.isWhatsAppConnected,
                    iconWidget: const AppIconContainer(
                      icon: Icons.chat_bubble_outline,
                      bgColor: Color(0xFFE8F5E9), // أخضر فاتح
                      iconColor: Color(0xFF25D366), // أخضر واتساب
                    ),
                    trailingWidget: ConnectActionBtn(onTap: provider.connectWhatsApp),
                  ),

                  const SizedBox(height: 32),
                  
                  // --- Data Privacy Card ---
                  const DataPrivacyCard(),
                  
                  const SizedBox(height: 40),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}