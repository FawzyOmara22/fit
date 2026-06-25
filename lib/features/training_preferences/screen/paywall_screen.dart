import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/training_preferences/provider/subscription_provider.dart';
import 'package:kinetic/features/training_preferences/widgets/paywall_widgets.dart';
import 'package:provider/provider.dart';

class PaywallScreen extends StatefulWidget {
  const PaywallScreen({Key? key}) : super(key: key);

  @override
  State<PaywallScreen> createState() => _PaywallScreenState();
}

class _PaywallScreenState extends State<PaywallScreen> {
  @override
  void initState() {
    super.initState();
    // جلب بيانات خطط الاشتراك من الـ API عبر المزود
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SubscriptionProvider>().fetchPlans();
    });
  }

  @override
  Widget build(BuildContext context) {
    // تفعيل الترجمة بالصيغة المطلوبة
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // المحتوى القابل للتمرير بالكامل
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 160), // مساحة مخصصة للزر الثابت بالأسفل
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PaywallHeaderImage(l10n: l10n),
                const SizedBox(height: 24),
                
                PaywallFeatureList(l10n: l10n),
                const SizedBox(height: 16),
                
                // الميزات الإضافية المستقلة
                ExtraFeatureRow(
                  icon: Icons.all_inclusive,
                  text: l10n.unlimitedCustomRoutines,
                ),
                ExtraFeatureRow(
                  icon: Icons.insert_drive_file_outlined,
                  text: l10n.dataPortability,
                ),
                
                const SizedBox(height: 32),
                
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    l10n.selectYourPath,
                    style: AppTextStyles.label10Grey.copyWith(letterSpacing: 1.5),
                  ),
                ),
                const SizedBox(height: 16),
                
                SubscriptionPlansList(l10n: l10n),
              ],
            ),
          ),

          // الجزء السفلي الثابت المحتوي على الزر المتدرج والروابط القانونية
          FixedBottomBar(l10n: l10n),
        ],
      ),
    );
  }
}