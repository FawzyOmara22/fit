import 'exercise_model.dart';
import 'workout_set_model.dart';

class SessionExerciseModel {
  final String id;
  final ExerciseModel exercise;
  final List<WorkoutSetModel> sets;
  final String restTime; // تم تعديلها لتكون String لتطابق الشاشة

  SessionExerciseModel({
    required this.id,
    required this.exercise,
    required this.sets,
    required this.restTime,
  });
}