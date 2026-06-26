class AssignmentDetailModel {
  final String id;
  final String clientName;
  final String clientAvatar;
  final String clientTag;
  final String statusText;
  final String instructions;
  final String routineName;
  final int durationMin;
  final int totalExercises;
  final int visibleExercises;
  final List<ExerciseBreakdownModel> exercises;

  AssignmentDetailModel({
    required this.id,
    required this.clientName,
    required this.clientAvatar,
    required this.clientTag,
    required this.statusText,
    required this.instructions,
    required this.routineName,
    required this.durationMin,
    required this.totalExercises,
    required this.visibleExercises,
    required this.exercises,
  });

  factory AssignmentDetailModel.fromJson(Map<String, dynamic> json) {
    return AssignmentDetailModel(
      id: json['id']?.toString() ?? '',
      clientName: json['clientName'] ?? '',
      clientAvatar: json['clientAvatar'] ?? '',
      clientTag: json['clientTag'] ?? '',
      statusText: json['statusText'] ?? '',
      instructions: json['instructions'] ?? '',
      routineName: json['routineName'] ?? '',
      durationMin: json['durationMin'] ?? 0,
      totalExercises: json['totalExercises'] ?? 0,
      visibleExercises: json['visibleExercises'] ?? 0,
      exercises: (json['exercises'] as List<dynamic>?)
              ?.map((e) => ExerciseBreakdownModel.fromJson(e))
              .toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'clientName': clientName,
      'clientAvatar': clientAvatar,
      'clientTag': clientTag,
      'statusText': statusText,
      'instructions': instructions,
      'routineName': routineName,
      'durationMin': durationMin,
      'totalExercises': totalExercises,
      'visibleExercises': visibleExercises,
      'exercises': exercises.map((e) => e.toJson()).toList(),
    };
  }
}

class ExerciseBreakdownModel {
  final String id;
  final String name;
  final int sets;
  final int reps;
  final String weightText;

  ExerciseBreakdownModel({
    required this.id,
    required this.name,
    required this.sets,
    required this.reps,
    required this.weightText,
  });

  factory ExerciseBreakdownModel.fromJson(Map<String, dynamic> json) {
    return ExerciseBreakdownModel(
      id: json['id']?.toString() ?? '',
      name: json['name'] ?? '',
      sets: json['sets'] ?? 0,
      reps: json['reps'] ?? 0,
      weightText: json['weightText'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'sets': sets,
      'reps': reps,
      'weightText': weightText,
    };
  }
}