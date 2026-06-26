import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/features/coaching/provider/assign_workout_provider.dart';
import 'package:kinetic/features/coaching/provider/assignment_detail_provider.dart';
import 'package:kinetic/features/coaching/provider/chat_provider.dart';
import 'package:kinetic/features/coaching/provider/client_provider.dart';
import 'package:kinetic/features/coaching/provider/coaching_provider.dart';
import 'package:kinetic/features/coaching/provider/feed_provider.dart';
import 'package:kinetic/features/coaching/provider/invite_provider.dart';
import 'package:kinetic/features/coaching/provider/notifications_provider.dart';
import 'package:kinetic/features/coaching/provider/session_review_provider.dart';
import 'package:kinetic/features/coaching/provider/workout_schedule_provider.dart';
import 'package:kinetic/features/coaching/screen/assign_workout_screen.dart';
import 'package:kinetic/features/coaching/screen/assignment_detail_screen.dart';
import 'package:kinetic/features/coaching/screen/chat_screen.dart';
import 'package:kinetic/features/coaching/screen/client_activity_screen.dart';
import 'package:kinetic/features/coaching/screen/clients_screen.dart';
import 'package:kinetic/features/coaching/screen/coaching_screen.dart';
import 'package:kinetic/features/coaching/screen/invite_screen.dart';
import 'package:kinetic/features/coaching/screen/notifications_screen.dart';
import 'package:kinetic/features/coaching/screen/session_review_screen.dart';
import 'package:kinetic/features/coaching/screen/workout_schedule_screen.dart';
import 'package:kinetic/features/onboarding/provider/onboarding_provider.dart';
import 'package:kinetic/features/splash/screeens/splash_screen.dart';
import 'package:kinetic/features/train/logic/train_provider.dart';
import 'package:kinetic/features/train/logic/workout_provider.dart';
import 'package:kinetic/features/training_preferences/provider/activity_provider.dart';
import 'package:kinetic/features/training_preferences/provider/data_management_provider.dart';
import 'package:kinetic/features/training_preferences/provider/integration_provider.dart';
import 'package:kinetic/features/training_preferences/provider/preferences_provider.dart';
import 'package:kinetic/features/training_preferences/provider/subscription_provider.dart';
import 'package:kinetic/features/training_preferences/provider/sync_provider.dart';
import 'package:kinetic/features/training_preferences/screen/activity_screen.dart';
import 'package:kinetic/features/training_preferences/screen/data_management_screen.dart';
import 'package:kinetic/features/training_preferences/screen/integrations_screen.dart';
import 'package:kinetic/features/training_preferences/screen/paywall_screen.dart';
import 'package:kinetic/features/training_preferences/screen/sync_screen.dart';
import 'package:kinetic/features/training_preferences/screen/training_preferences_screen.dart';
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
        ChangeNotifierProvider(create: (_) => PreferencesProvider()),
        ChangeNotifierProvider(create: (_) => IntegrationProvider()),
        ChangeNotifierProvider(create: (_) => DataManagementProvider()),
        ChangeNotifierProvider(create: (_) => SubscriptionProvider()),
        ChangeNotifierProvider(create: (_) => SyncProvider()),
        ChangeNotifierProvider(create: (_) => ActivityProvider()),
        ChangeNotifierProvider(create: (_) => CoachingProvider()),
        ChangeNotifierProvider(create: (_) => FeedProvider()),
        ChangeNotifierProvider(create: (_) => ClientProvider()),
        ChangeNotifierProvider(create: (_) => AssignWorkoutProvider()),
        ChangeNotifierProvider(create: (_) => AssignmentDetailProvider()),
        ChangeNotifierProvider(create: (_) => SessionReviewProvider()),
        ChangeNotifierProvider(create: (_) => ChatProvider()),
        ChangeNotifierProvider(create: (_) => InviteProvider()),
        ChangeNotifierProvider(create: (_) => NotificationsProvider()),
        ChangeNotifierProvider(create: (_) => WorkoutScheduleProvider()),
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
            home: const WorkoutScheduleScreen(),
          );
        },
      ),
    );
  }
}
//flutter gen-l10n