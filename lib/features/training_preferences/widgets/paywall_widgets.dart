import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/training_preferences/provider/subscription_provider.dart';
import 'package:provider/provider.dart';


/// صورة الهيدر العلوية مع التدرج اللوني المدمج والنصوص المترجمة والشريط العلوي
class PaywallHeaderImage extends StatelessWidget {
  final AppLocalizations l10n;

  const PaywallHeaderImage({Key? key, required this.l10n}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 1. الشريط العلوي (Top Bar) الأبيض
        Container(
          color: Colors.white,
          child: SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (Navigator.canPop(context)) {
                        Navigator.pop(context);
                      }
                    },
                    child: const Icon(Icons.close, color: AppColors.nearBlack, size: 24),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        'KINETIC',
                        style: AppTextStyles.trainAppBar20, // خط عريض مناسب للوجو كما في الصورة
                      ),
                    ),
                  ),
                  const SizedBox(width: 24), // لموازنة المساحة ليبقى النص في المنتصف تماماً
                ],
              ),
            ),
          ),
        ),
        
        // 2. الصورة مع التدرج اللوني الداكن والنص
        Container(
          width: double.infinity,
          height: 480, // ارتفاع أكبر ليطابق نسب الصورة المرفقة
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/Hero Section.png'), 
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.1),
                  Colors.black.withOpacity(0.9), // لون داكن في الأسفل لإبراز النص
                ],
                stops: const [0.5, 0.7, 1.0],
              ),
            ),
            // Padding سفلي كبير لكي يترك مساحة للكارت المتداخل
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.kineticProExperience,
                  style: AppTextStyles.label10Blue.copyWith(
                    color: AppColors.primaryLight, // لون أزرق فاتح كما في التصميم
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  l10n.unlockPeakPerformance,
                  style: AppTextStyles.heroHeadingItalic.copyWith(
                    color: Colors.white,
                    fontSize: 42,
                    height: 1.05,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// قائمة كروت الميزات الأساسية للتطبيق
class PaywallFeatureList extends StatelessWidget {
  final AppLocalizations l10n;

  const PaywallFeatureList({Key? key, required this.l10n}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // التعديل هنا: سحب الكروت لأعلى لكي تتداخل مع الصورة الداكنة كما في التصميم
      transform: Matrix4.translationValues(0.0, -30.0, 0.0),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          _FeatureCard(
            icon: Icons.videocam_outlined,
            title: l10n.aiFormAnalysis,
            desc: l10n.aiFormAnalysisDesc,
          ),
          const SizedBox(height: 12),
          _FeatureCard(
            icon: Icons.smart_toy_outlined,
            title: l10n.personalAiCoach,
            desc: l10n.personalAiCoachDesc,
          ),
          const SizedBox(height: 12),
          _FeatureCard(
            icon: Icons.bar_chart_rounded,
            title: l10n.advancedAnalytics,
            desc: l10n.advancedAnalyticsDesc,
          ),
          const SizedBox(height: 12),
          _FeatureCard(
            icon: Icons.folder_outlined,
            title: l10n.customWorkoutFolders,
            desc: l10n.customWorkoutFoldersDesc,
          ),
        ],
      ),
    );
  }
}

/// كارت ميزة منفرد (داخلي للملف فقط)
class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String desc;

  const _FeatureCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.desc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04), // ظل خفيف جداً
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.lightBlueWhite,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: AppColors.primary, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // تم استخدام addExCardTitle لأن حجمها 16 ومناسبة جداً
                Text(title, style: AppTextStyles.addExCardTitle),
                const SizedBox(height: 4),
                Text(desc, style: AppTextStyles.body14Height),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// أسطر الميزات الإضافية البسيطة التي تعرض بالأسفل
class ExtraFeatureRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const ExtraFeatureRow({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.translationValues(0.0, -20.0, 0.0), // لتعويض المسافة المسحوبة من الكروت
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: AppTextStyles.body14NoHeight.copyWith(color: AppColors.darkCharcoal),
            ),
          ),
        ],
      ),
    );
  }
}

/// قائمة خطط الأسعار والاشتراكات المربوطة بمزود الحالة والـ API
class SubscriptionPlansList extends StatelessWidget {
  final AppLocalizations l10n;

  const SubscriptionPlansList({Key? key, required this.l10n}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SubscriptionProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading && provider.plans.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return Container(
          transform: Matrix4.translationValues(0.0, -10.0, 0.0),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: provider.plans.map((plan) {
              final isSelected = provider.selectedPlan?.id == plan.id;

              String title = plan.titleKey == 'yearlyPlan' ? l10n.yearlyPlan : plan.titleKey;
              String trialText = plan.trialTextKey == 'freeTrialIncluded' ? l10n.freeTrialIncluded : plan.trialTextKey;

              return GestureDetector(
                onTap: () => provider.selectPlan(plan),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border.all(
                      color: isSelected ? AppColors.primary : AppColors.divider,
                      width: isSelected ? 2 : 1,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Row(
                        children: [
                          Icon(
                            isSelected ? Icons.radio_button_checked : Icons.radio_button_unchecked,
                            color: isSelected ? AppColors.primary : AppColors.iconGrey,
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(title, style: AppTextStyles.cardTitle18),
                                const SizedBox(height: 4),
                                Text(
                                  trialText,
                                  style: AppTextStyles.body14BlueNoHeight.copyWith(fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("\$${plan.price}", style: AppTextStyles.heading24.copyWith(fontWeight: FontWeight.w800)),
                              Text("~\$${plan.pricePerMonth}/MO", style: AppTextStyles.smallCaption11),
                            ],
                          )
                        ],
                      ),
                      if (plan.isBestValue)
                        Positioned(
                          top: -32,
                          right: 16,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              l10n.bestValue,
                              style: AppTextStyles.label10Blue.copyWith(color: AppColors.white),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}

/// البار السفلي الثابت الذي يحتوي على زر الـ Gradient المتدرج والبنود القانونية
class FixedBottomBar extends StatelessWidget {
  final AppLocalizations l10n;

  const FixedBottomBar({Key? key, required this.l10n}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final footerStyle = AppTextStyles.navBarUnselected10.copyWith(color: AppColors.mutedGrey, fontWeight: FontWeight.w600);

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.only(top: 32, bottom: 24, left: 24, right: 24),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.background.withOpacity(0.0),
              AppColors.background.withOpacity(0.9),
              AppColors.background,
            ],
            stops: const [0.0, 0.4, 1.0],
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const _GradientButton(),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(l10n.restorePurchase, style: footerStyle),
                Text(l10n.termsOfService, style: footerStyle),
                Text(l10n.privacyPolicy, style: footerStyle),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              l10n.copyrightText,
              style: AppTextStyles.label10Grey.copyWith(fontSize: 9),
            ),
          ],
        ),
      ),
    );
  }
}

/// زر الشراء الأساسي ذو التدريج اللوني الأزرق الساطع والمؤشر اللحظي للاتصال بالـ API
class _GradientButton extends StatelessWidget {
  const _GradientButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Consumer<SubscriptionProvider>(
      builder: (context, provider, _) {
        return GestureDetector(
          onTap: () {
            if (!provider.isLoading) provider.processSubscription();
          },
          child: Container(
            width: double.infinity,
            height: 56,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF3B82F6), Color(0xFF60A5FA)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(28),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.3),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                )
              ],
            ),
            child: Center(
              child: provider.isLoading
                  ? const CircularProgressIndicator(color: AppColors.white)
                  : Text(
                      l10n.startFreeTrial,
                      style: AppTextStyles.primaryButton16.copyWith(letterSpacing: 1.2),
                    ),
            ),
          ),
        );
      },
    );
  }
}