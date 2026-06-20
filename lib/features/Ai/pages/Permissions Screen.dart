// lib/features/permissions/screens/permissions_screen.dart

import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/Ai/models/permissions_api.dart';
import 'package:kinetic/features/Ai/pages/ai_screen.dart';
import 'package:kinetic/features/Ai/pages/select_exercise_screen.dart';
import 'package:kinetic/features/Ai/widgets/permissions_widgets.dart';

// 👇 التعديل 1: استدعاء صفحة اختيار التمارين اللي لسه عاملينها


class PermissionsScreen extends StatefulWidget {
  const PermissionsScreen({Key? key}) : super(key: key);

  @override
  State<PermissionsScreen> createState() => _PermissionsScreenState();
}

class _PermissionsScreenState extends State<PermissionsScreen> {
  bool isLoading = false;

  void _submitPermissions() async {
    setState(() => isLoading = true);

    // تجهيز البيانات للـ API
    final data = PermissionsModel(
      cameraEnabled: true,
      healthEnabled: true,
      notificationsEnabled: true,
    );

    // إرسال البيانات
    final apiService = PermissionsApiService();
    bool success = await apiService.sendPermissions(data);

    setState(() => isLoading = false);

    // 👇 التعديل 2: الانتقال لصفحة SelectExerciseScreen بعد نجاح العملية
    if (success) {
      if (!mounted) return; // حماية إضافية عشان الـ BuildContext
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SelectExerciseScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBackground,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () {
            // الرجوع المباشر لصفحة ai_screen 
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const AIScreen()),
              (route) => false, // بيمسح الهيستوري اللي قبله لو حابب
            );
          },
        ),
        title: Text(l10n.permissions_title, style: AppTextStyles.appBarTitle),
      ),
      body: Stack(
        children: [
          // المحتوى القابل للتمرير
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 150), // مساحة للزرار اللي تحت
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                
                // الأيقونة العلوية مع التأثير المضيء (Glow)
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primary.withOpacity(0.15),
                            blurRadius: 40,
                            spreadRadius: 10,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.darkCharcoal5,
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          )
                        ],
                      ),
                      child: const Icon(Icons.health_and_safety, color: AppColors.primary, size: 36),
                    ),
                  ],
                ),
                
                const SizedBox(height: 24),

                // العنوان (جزء أسود وجزء أزرق)
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: l10n.unlock_the,
                        style: AppTextStyles.heading36Black,
                      ),
                      TextSpan(
                        text: l10n.full_experience,
                        style: AppTextStyles.heading36Primary,
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 12),
                
                // النص الفرعي
                Text(
                  l10n.permissions_subtitle,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.body16,
                ),
                
                const SizedBox(height: 40),

                // كروت الصلاحيات
                PermissionCardWidget(
                  icon: Icons.camera_alt_outlined,
                  iconColor: AppColors.primary,
                  iconBgColor: AppColors.cardSelectedBg,
                  title: l10n.perm_camera,
                  description: l10n.perm_camera_desc,
                  dotColor: AppColors.primaryLight,
                ),
                PermissionCardWidget(
                  icon: Icons.monitor_heart_outlined,
                  iconColor: const Color(0xFF6C6A9E), // لون مقارب من الديزاين
                  iconBgColor: const Color(0xFFF3F3FA),
                  title: l10n.perm_health,
                  description: l10n.perm_health_desc,
                  dotColor: const Color(0xFF9E9BDC),
                ),
                PermissionCardWidget(
                  icon: Icons.notifications_none,
                  iconColor: const Color(0xFF995E7E), // لون مقارب من الديزاين
                  iconBgColor: const Color(0xFFFAF1F5),
                  title: l10n.perm_notifications,
                  description: l10n.perm_notifications_desc,
                  dotColor: const Color(0xFFDCA7C4),
                ),

                const SizedBox(height: 16),

                // مؤشر الثقة (Trust Score)
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF1F1F1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(l10n.trust_score_label, style: AppTextStyles.label10Grey),
                        const SizedBox(height: 4),
                        Text(l10n.trust_score_value, style: AppTextStyles.heading24.copyWith(fontWeight: FontWeight.w900)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // القسم الثابت في الأسفل (زرار السماح بالوصول)
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 24, bottom: 32, left: 24, right: 24),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.darkCharcoal5,
                    blurRadius: 20,
                    offset: Offset(0, -10),
                  )
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: double.infinity,
                    height: 56,
                    decoration: BoxDecoration(
                      gradient: AppColors.primaryGradient,
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                      ),
                      onPressed: isLoading ? null : _submitPermissions,
                      child: isLoading 
                          ? const CircularProgressIndicator(color: Colors.white)
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(l10n.allow_access, style: AppTextStyles.primaryButton18),
                                const SizedBox(width: 8),
                                const Icon(Icons.bolt, color: Colors.white, size: 20),
                              ],
                            ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    l10n.change_in_settings,
                    style: AppTextStyles.label10Grey.copyWith(letterSpacing: 1.5),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}