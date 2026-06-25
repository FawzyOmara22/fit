import 'package:flutter/material.dart';
import 'package:kinetic/features/training_preferences/models/activity_model.dart';


class ActivityProvider extends ChangeNotifier {
  bool isLoading = false;
  WorkoutActivityModel? activityData;

  Future<void> fetchActivityDetails() async {
    isLoading = true;
    notifyListeners();

    // محاكاة استدعاء الـ API
    await Future.delayed(const Duration(seconds: 1));

    // الداتا الوهمية لتمثيل استجابة الـ API مع صور حقيقية للتعليقات
    activityData = WorkoutActivityModel(
      id: '1',
      dateText: 'MONDAY, OCT 24',
      title: 'MAX EFFORT DEADLIFT SESSION',
      location: 'Iron Works Performance Center',
      totalVolume: 12450,
      durationText: '1h 12m',
      avgHeartRate: 142,
      exercises: [
        ExerciseLogModel(
          id: 'e1',
          name: 'Deadlift (Conventional)',
          sets: [
            SetModel(setNumber: 1, weight: 100, reps: 8, isCompleted: true),
            SetModel(setNumber: 2, weight: 140, reps: 5, isCompleted: true),
            SetModel(setNumber: 3, weight: 180, reps: 3, isCompleted: true),
            SetModel(setNumber: 4, weight: 220, reps: 1, isCompleted: true, isPR: true),
          ],
        ),
        ExerciseLogModel(
          id: 'e2',
          name: 'Weighted Pull Up',
          sets: [
            SetModel(setNumber: 1, weight: 20, reps: 8, isCompleted: true),
            SetModel(setNumber: 2, weight: 20, reps: 8, isCompleted: true),
            SetModel(setNumber: 3, weight: 20, reps: 6, isCompleted: true),
          ],
        ),
      ],
      comments: [
        CommentModel(
          id: 'c1',
          authorName: 'Marcus Chen',
          // رابط لصورة وجه شخص حقيقي
          avatarUrl: 'https://randomuser.me/api/portraits/men/32.jpg',
          timeAgo: '2H AGO',
          content: 'That deadlift volume is absolutely insane! The 4th set looked clean on your story. Let\'s get it! 🔥',
          likes: 12,
        ),
        CommentModel(
          id: 'c2',
          authorName: 'Sarah Miller',
          // رابط لصورة وجه فتاة حقيقية
          avatarUrl: 'https://randomuser.me/api/portraits/women/44.jpg',
          timeAgo: '4H AGO',
          content: 'New PR at 220kg?! Massive achievement. How was the grip holding up towards the end?',
          likes: 8,
        ),
      ],
    );

    isLoading = false;
    notifyListeners();
  }
}