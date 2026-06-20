class ActiveSetModel {
  final String exerciseNameKey;
  final int currentReps;
  final int targetReps;
  final int currentSet;
  final double weight;
  final String restTime;

  ActiveSetModel({
    required this.exerciseNameKey,
    required this.currentReps,
    required this.targetReps,
    required this.currentSet,
    required this.weight,
    required this.restTime,
  });

  factory ActiveSetModel.fromJson(Map<String, dynamic> json) {
    return ActiveSetModel(
      exerciseNameKey: json['exercise_name_key'] ?? '',
      currentReps: json['current_reps'] ?? 0,
      targetReps: json['target_reps'] ?? 0,
      currentSet: json['current_set'] ?? 0,
      weight: (json['weight'] ?? 0.0).toDouble(),
      restTime: json['rest_time'] ?? ':00',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'exercise_name_key': exerciseNameKey,
      'current_reps': currentReps,
      'target_reps': targetReps,
      'current_set': currentSet,
      'weight': weight,
      'rest_time': restTime,
    };
  }
}