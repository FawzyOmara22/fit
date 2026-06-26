import 'package:flutter/material.dart';
import 'package:kinetic/features/coaching/models/assignment_detail_model.dart';


class AssignmentDetailProvider extends ChangeNotifier {
  bool isLoading = false;
  AssignmentDetailModel? detailData;

  Future<void> fetchAssignmentDetails() async {
    isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1)); // محاكاة الـ API

    detailData = AssignmentDetailModel(
      id: 'a1',
      clientName: 'Marcus Chen',
      clientAvatar: 'https://randomuser.me/api/portraits/men/32.jpg',
      clientTag: 'Pro Performance',
      statusText: 'IN PROGRESS', // قادمة كـ Key للترجمة أو نص مباشر
      instructions: '"Focus on tempo during the bench press. Ensure a controlled 3-second eccentric phase to maximize muscle fiber recruitment."',
      routineName: 'Hypertrophy Push A',
      durationMin: 65,
      totalExercises: 8,
      visibleExercises: 3,
      exercises: [
        ExerciseBreakdownModel(id: 'e1', name: 'Barbell Bench Press', sets: 3, reps: 8, weightText: '@ 185 lbs'),
        ExerciseBreakdownModel(id: 'e2', name: 'Overhead Press', sets: 3, reps: 10, weightText: '@ 115 lbs'),
        ExerciseBreakdownModel(id: 'e3', name: 'Tricep Extensions', sets: 3, reps: 12, weightText: '@ 60 lbs'),
      ],
    );

    isLoading = false;
    notifyListeners();
  }
}