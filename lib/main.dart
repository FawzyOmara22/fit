import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/features/onboarding/provider/onboarding_provider.dart';
import 'package:kinetic/features/splash/screeens/splash_screen.dart';
import 'package:kinetic/firebase_options.dart'; 
import 'package:provider/provider.dart';
import 'core/providers/language_provider.dart'; 
import 'features/splash/provider/splash_provider.dart'; 

void main() async {
  // 1. السطر ده ضروري جداً قبل الـ Firebase
  WidgetsFlutterBinding.ensureInitialized();
  
  // 2. تهيئة فايربيز (تم تظبيط الأقواس هنا)
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ); 
  await FirebaseFirestore.instance.disableNetwork();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // تسجيل الـ SplashProvider
        ChangeNotifierProvider(create: (_) => SplashProvider()),
        
        // تسجيل الـ LanguageProvider 
        ChangeNotifierProvider(create: (_) => LanguageProvider()),

        // تسجيل الـ OnboardingProvider هنا عشان التطبيق كله يشوف الداتا بتاعت الاختيارات
        ChangeNotifierProvider(create: (_) => OnboardingProvider()),
      ],
      child: Consumer<LanguageProvider>(
        builder: (context, langProvider, child) {
          return MaterialApp(
            title: 'Kinetic',
            debugShowCheckedModeBanner: false,
            
            locale: langProvider.currentLocale,
            
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            
            supportedLocales: const [
              Locale('en'), 
              Locale('ar'), 
            ],
            
            theme: ThemeData(
              useMaterial3: true,
              scaffoldBackgroundColor: AppColors.scaffoldBackground,
              fontFamily: 'Inter',
            ),
            
            home: const SplashScreen(), // خلي الشاشة دي أول حاجة تظهر
          );
        },
      ),
    );
  }
} // 3. شيلنا القوس الزيادة من هنا
//flutter gen-l10n