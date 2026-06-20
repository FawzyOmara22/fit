/*import 'package:flutter/material.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/features/dashboard/presentation/pages/main_layout_screen.dart';
import 'package:kinetic/features/splash/provider/splash_provider.dart';
import 'package:provider/provider.dart';
import '../widgets/splash_logo_widget.dart';
import '../widgets/splash_text_widget.dart';
import '../widgets/splash_bottom_widget.dart';

// 👇 ضيفنا الاستدعاء بتاع شاشة التابات هنا


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // تشغيل اللوجيك بمجرد فتح الشاشة
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // 💡 ملحوظة: يفضل تعمل السطر اللي تحت ده كومنت (//) وقت التست عشان ميعملش تعارض مع الانتقال بتاعنا
      // context.read<SplashProvider>().initSplash(context); 

      // 👇 الكود اللي ضفناه للانتقال المباشر للتست بعد ثانيتين
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MainLayoutScreen()),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 48.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // بتوزع العناصر بشكل مثالي
            children: [
              SizedBox(), // فراغ علوي لضبط المسافات
              Column(
                children: [
                  SplashLogoWidget(),
                  SizedBox(height: 40),
                  SplashTextWidget(),
                ],
              ),
              SplashBottomWidget(),
            ],
          ),
        ),
      ),
    );
  }
}*/

import 'package:flutter/material.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/features/splash/provider/splash_provider.dart';
import 'package:provider/provider.dart';
import '../widgets/splash_logo_widget.dart';
import '../widgets/splash_text_widget.dart';
import '../widgets/splash_bottom_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // تشغيل اللوجيك بمجرد فتح الشاشة
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SplashProvider>().initSplash(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 48.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // بتوزع العناصر بشكل مثالي
            children: [
              SizedBox(), // فراغ علوي لضبط المسافات
              Column(
                children: [
                  SplashLogoWidget(),
                  SizedBox(height: 40),
                  SplashTextWidget(),
                ],
              ),
              SplashBottomWidget(),
            ],
          ),
        ),
      ),
    );
  }
}