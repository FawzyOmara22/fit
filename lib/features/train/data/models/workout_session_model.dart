import 'session_exercise_model.dart';

class WorkoutSessionModel {
  final String id;
  final String title;
  final String focus;
  final DateTime startTime;
  final DateTime? endTime;
  final List<SessionExerciseModel> exercises;
  final int totalKcal;

  WorkoutSessionModel({
    required this.id,
    required this.title,
    required this.focus,
    required this.startTime,
    this.endTime,
    required this.exercises,
    this.totalKcal = 0,
  });
}
//(يمثل الجلسة بالكامل)