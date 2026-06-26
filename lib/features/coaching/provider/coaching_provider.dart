import 'package:flutter/material.dart';
import 'package:kinetic/features/coaching/models/coaching_model.dart';


class CoachingProvider extends ChangeNotifier {
  bool isLoading = false;
  CoachingDataModel? coachingData;

  Future<void> fetchCoachingData() async {
    isLoading = true;
    notifyListeners();

    // محاكاة استدعاء الـ API واستقبال البيانات
    await Future.delayed(const Duration(seconds: 1));

    coachingData = CoachingDataModel(
      myCoaches: [
        CoachModel(id: '1', name: 'Sarah Jenkins', specialty: 'Hypertrophy Masterclass', avatarUrl: 'https://randomuser.me/api/portraits/women/44.jpg'),
        CoachModel(id: '2', name: 'Marcus Thorne', specialty: 'Mobility & Flow', avatarUrl: 'https://randomuser.me/api/portraits/men/32.jpg'),
      ],
      exploreCoaches: [
        ExploreCoachModel(id: '3', name: 'Elena Rostova', experience: '5+ Years Experience • Pro Athlete', tag: 'POWERLIFTING', imageUrl: 'https://images.unsplash.com/photo-1594381898411-846e7d193883?q=80&w=400&auto=format&fit=crop'),
        ExploreCoachModel(id: '4', name: 'David Chen', experience: 'Precision Nutrition Coach', tag: 'FAT LOSS', imageUrl: 'https://images.unsplash.com/photo-1581009146145-b5ef050c2e1e?q=80&w=400&auto=format&fit=crop'),
      ],
      programs: [
        ProgramModel(id: 'p1', title: '12-Week\nStrength\nMaster', subtitle: 'Sarah Jenkins', price: '', isMain: true),
        ProgramModel(id: 'p2', title: 'Yoga Flow\nFoundations', subtitle: 'Level 1 • 4 Weeks', price: '\$49'),
        ProgramModel(id: 'p3', title: 'Kettlebell\nShred 2.0', subtitle: 'Level 3 • 8 Weeks', price: '\$75'),
      ],
      edgeFeatures: [
        FeatureModel(titleKey: 'personalizedPlans', subtitleKey: 'tailoredToYourBody'),
        FeatureModel(titleKey: 'formChecks', subtitleKey: 'aiAssistedVideo'),
        FeatureModel(titleKey: 'weeklyCheckIns', subtitleKey: 'stayConsistent'),
      ],
    );

    isLoading = false;
    notifyListeners();
  }
}