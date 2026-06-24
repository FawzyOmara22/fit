import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/features/onboarding/provider/onboarding_provider.dart';
import 'package:kinetic/features/splash/screeens/splash_screen.dart';
import 'package:kinetic/features/train/logic/train_provider.dart';
import 'package:kinetic/features/train/logic/workout_provider.dart';
import 'package:kinetic/firebase_options.dart'; 
import 'package:provider/provider.dart';
import 'core/providers/language_provider.dart'; 
import 'features/splash/provider/splash_provider.dart'; 


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ); 
  
  // ملاحظة: السطر ده بيخلي فايربيز يشتغل أوفلاين بس
  await FirebaseFirestore.instance.disableNetwork();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashProvider()),
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
        ChangeNotifierProvider(create: (_) => OnboardingProvider()),
        
        // 👇 ده السطر الجديد اللي ضفناه عشان شاشة الـ Train تشتغل
        ChangeNotifierProvider(create: (_) => TrainProvider()),
        ChangeNotifierProvider(create: (_) => WorkoutProvider()),
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
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
//flutter gen-l10n