import 'package:flutter/material.dart';

class AppColors {
  // =========================================
  // 1. الألوان الأساسية وخلفيات التطبيق
  // =========================================
  static const Color background = Color(0xFFF8F9FB);
  static const Color scaffoldBackground = Color(0xFFF8F9FB); 
  static const Color surfaceColor = Color(0xFFF1F0F6);
  static const Color white = Colors.white; 
  
  // =========================================
  // 2. درجات اللون الأساسي (Primary)
  // =========================================
  static const Color primary = Color(0xFF0058BB);
  static const Color primaryDark = Color(0xFF004D99);
  static const Color primaryLight = Color(0xFF6C9FFF);
  static const Color primary10 = Color(0x1A0058BB); 

  // =========================================
  // 3. درجات النصوص والعناصر
  // =========================================
  static const Color nearBlack = Color(0xFF1A1A1A);
  static const Color darkCharcoal = Color(0xFF2D2E33);
  static const Color deepSlate = Color(0xFF0F172A);
  static const Color textGrey = Color(0xFF5B5B60);
  static const Color grayText = Color(0xFF5B5B60); 
  static const Color mutedGrey = Color(0xFF76767B);
  static const Color iconGrey = Color(0xFFA1A1AA);
  static const Color hintColor = Color(0x7F76767B);

  // =========================================
  // 4. الفواصل والحدود (Borders & Dividers)
  // =========================================
  static const Color divider = Color(0xFFE2E8F0);
  static const Color borderGrey = Color(0xFFADACB2);
  static const Color lightGray = Color(0xFFE5E8EB); // رمادي فاتح للحدود
  static const Color borderDark = Color(0xFFD1D5DB);

  // =========================================
  // 5. الخلفيات الفاتحة وحالات الكروت
  // =========================================
  static const Color inputBackground = Color(0xFFF1F4F8);
  static const Color cardSelectedBg = Color(0xFFF4F8FF);
  
  static const Color insightBg = Color(0xFFF4F6FF);
  static const Color insightIconBg = Color(0xFF3853B7);
  static const Color insightTextDark = Color(0xFF203EA2);

  // =========================================
  // 6. التدرجات اللونية (Gradients)
  // =========================================
  static const Color gradientStart = Color(0xFF4A8CF6);
  static const Color gradientEnd = Color(0xFF2361E3);
  
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [
      Color(0xFF0058BB),
      Color(0xFF6C9FFF),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient lightGradient = LinearGradient(
    colors: [
      Color(0xFFF7F6FB),
      Color(0xFFF7F6FB),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // =========================================
  // 7. الألوان مع الشفافية المدمجة (Alpha Hex)
  // =========================================
  static const Color darkCharcoal5 = Color(0x0D2D2E33);
  static const Color darkCharcoal50 = Color(0x7F2D2E33); // تم إضافته للـ Navigation Bar
  static const Color grayText60 = Color(0x995B5B60);
  static const Color grayText40 = Color(0x665B5B60);
  static const Color background90 = Color(0xE6F7F6FB);
  static const Color background0 = Color(0x00F7F6FB);
  static const Color white70 = Color(0xB3FFFFFF);
  static const Color white50 = Color(0x80FFFFFF);
  static const Color white20 = Color(0x33FFFFFF);
  
  static const Color lightBlueTransparent = Color(0x99F0F2FF); // تم إضافته لنص DAY STREAK
  // =========================================
  // 8. ألوان صفحة الإعدادات وحالات الخطأ (Settings & Errors)
  // =========================================
  static const Color errorRed = Color(0xFFB31B25);
  static const Color errorLightBg = Color(0xFFFDE9EA); // خلفية زرار تسجيل الخروج
  static const Color lightBlueWhite = Color(0xFFF0F2FF);
  static const Color lightBlueWhite80 = Color(0xCCF0F2FF); // شفافية 80%
  // --- ألوان شاشة الـ Active Session ---
  static const Color focusBlue = Color(0xFF5191FF); // لون كلمة Focus
  static const Color successGreen = Color(0xFF22C55E); // لون علامة الصح
  static const Color successLightBg = Color(0xFFF0FDF4); // خلفية المجموعة المكتملة
  static const Color warningYellow = Color(0xFFFACC15); // لون النجمة والخط الأصفر
  static const Color restPurple = Color(0xFFC084FC); // أيقونة وقت الراحة
  static const Color sessionBg = Colors.white; // خلفية الشاشة دي بيضاء صريحة
  // =========================================
  // 9. ألوان الـ Dialogs والتنبيهات
  // =========================================
  static const Color discardBtnRed = Color(0xFFDC2626); // اللون الأحمر للزرار
  static const Color discardIconBg = Color(0xFFFEE2E2); // اللون الأحمر الفاتح لخلفية الأيقونة
  static const Color keepTrainingBg = Color(0xFFE5E7EB); // اللون الرمادي لزر المتابعة
  static const Color prBg = Color(0xFFFDF2FF); // خلفية كارت الـ PR
  static const Color prText = Color(0xFF60136D); // لون نص الـ PR
  
 static const Color dividerGrey = Color(0xFFE5E5E5);
}