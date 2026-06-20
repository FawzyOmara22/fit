import 'package:flutter/material.dart';
import 'package:kinetic/features/onboarding/screens/onboarding_screen.dart';

class SplashProvider extends ChangeNotifier {
  double _progress = 0.0;
  double get progress => _progress;

  // دالة تشغيل شاشة البداية
  Future<void> initSplash(BuildContext context) async {
    // محاكاة تحميل البيانات أو تهيئة التطبيق (شريط التحميل)
    for (int i = 1; i <= 10; i++) {
      await Future.delayed(const Duration(milliseconds: 250));
      _progress = i / 10.0; // زيادة المؤشر
      notifyListeners(); // تحديث الـ UI
    }
    
    // سطر الأمان عشان الـ context بعد الـ await
    if (!context.mounted) return;

    // بعد انتهاء التحميل، هنا بننتقل للشاشة القادمة
    Navigator.pushReplacement(
      context, 
      MaterialPageRoute(builder: (_) => const OnboardingScreen()),
    );
  }
}