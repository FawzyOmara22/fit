import 'package:flutter/material.dart';
import 'package:kinetic/features/coaching/models/assign_workout_model.dart';
import 'package:intl/intl.dart';

class AssignWorkoutProvider extends ChangeNotifier {
  bool isLoading = false;
  bool isSubmitting = false;

  AssignedClientModel? client;
  List<WorkoutItemModel> routines = [];
  
  int selectedTabIndex = 0; // 0 = Routines, 1 = Programs
  String? selectedWorkoutId;
  DateTime selectedDate = DateTime.now();

  // جلب البيانات الأساسية من الـ API
  Future<void> fetchData() async {
    isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1)); // محاكاة

    client = AssignedClientModel(
      id: 'c1',
      name: 'Marcus Chen',
      programInfo: 'Strength Program • Week 4',
      avatarUrl: 'https://randomuser.me/api/portraits/men/32.jpg',
    );

    routines = [
      WorkoutItemModel(
        id: 'w1',
        title: 'Upper Body Power A',
        description: 'Focus on compound movements and high intensity pull/push intervals.',
        durationMin: 45,
        exerciseCount: 8,
        intensityTag: 'HIGH INTENSITY',
      ),
      WorkoutItemModel(
        id: 'w2',
        title: 'Leg Day Hypertrophy',
        description: 'High volume lower body training focusing on quad and glute development.',
        durationMin: 60,
        exerciseCount: 12,
        intensityTag: 'HYPERTROPHY',
      ),
    ];

    // تحديد أول تمرين كافتراضي (كما في الصورة)
    selectedWorkoutId = routines.length > 1 ? routines[1].id : null;

    isLoading = false;
    notifyListeners();
  }

  void setTab(int index) {
    selectedTabIndex = index;
    notifyListeners();
  }

  void selectWorkout(String id) {
    selectedWorkoutId = id;
    notifyListeners();
  }

  void setDate(DateTime date) {
    selectedDate = date;
    notifyListeners();
  }

  String getFormattedDate() {
    return DateFormat('EEEE, MMM d').format(selectedDate); // مثل Thursday, Oct 24
  }

  // دالة الإرسال للـ API عند الضغط على الزر السفلي
  Future<void> submitAssignment() async {
    if (client == null || selectedWorkoutId == null) return;

    isSubmitting = true;
    notifyListeners();

    // تجهيز الموديل للإرسال للـ API
    final request = AssignmentRequestModel(
      clientId: client!.id,
      workoutId: selectedWorkoutId!,
      scheduledDate: selectedDate.toIso8601String(),
    );

    // print(request.toJson()); // هنا ترسل البيانات للباك اند

    await Future.delayed(const Duration(seconds: 2)); // محاكاة الإرسال

    isSubmitting = false;
    notifyListeners();
  }
}