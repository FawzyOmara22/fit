import 'package:flutter/material.dart';
import 'package:kinetic/features/coaching/models/workout_schedule_model.dart';


class WorkoutScheduleProvider extends ChangeNotifier {
  List<WorkoutScheduleModel> _schedule = [];
  bool _isLoading = false;

  List<WorkoutScheduleModel> get schedule => _schedule;
  bool get isLoading => _isLoading;

  Future<void> fetchScheduleFromApi() async {
    _isLoading = true;
    notifyListeners();

    try {
      // هنا تضع كود الـ HTTP Request الفعلي
      // final response = await apiService.get('/schedule');
      
      await Future.delayed(const Duration(seconds: 1)); // محاكاة تحميل
      
      // داتا وهمية (Mock) تحاكي رد الـ API
      final mockData = [
        {
          "id": "1",
          "title": "mondayWorkout", // بنبعت Key الترجمة من الباك اند أو الاسم
          "status": "today",
          "day_label": "todayBadge",
          "payload": {
            "exercises": [
              {"name": "benchPress", "details": "setsReps1"},
              {"name": "pullUps", "details": "setsReps2"},
              {"name": "overheadPress", "details": "setsReps3"}
            ],
            "coach_note": "coachNoteText"
          }
        },
        {
          "id": "2",
          "title": "sundayWorkout",
          "status": "completed",
          "day_label": "yesterdayBadge",
          "payload": {"time": "time45m", "bpm": "bpm112"}
        },
        {
          "id": "3",
          "title": "saturdayWorkout",
          "status": "overdue",
          "day_label": "overdueBadge"
        }
      ];

      _schedule = mockData.map((e) => WorkoutScheduleModel.fromJson(e)).toList();

    } catch (e) {
      print('Error: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // دالة تحديث حالة تمرين للـ API
  Future<void> rescheduleWorkout(String id) async {
    print('Rescheduling workout $id to API...');
    // await apiService.post('/reschedule', data: {'id': id});
  }
}