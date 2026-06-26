class SessionReviewModel {
  final String clientName;
  final String programName;
  final String avatarUrl;
  final int durationMins;
  final double volumeK;
  final double avgRpe;
  final double volumeTrendPercentage;
  final List<ExerciseModel> exercises;
  final List<InsightModel> insights;
  final String defaultFeedback;

  SessionReviewModel({
    required this.clientName,
    required this.programName,
    required this.avatarUrl,
    required this.durationMins,
    required this.volumeK,
    required this.avgRpe,
    required this.volumeTrendPercentage,
    required this.exercises,
    required this.insights,
    required this.defaultFeedback,
  });

  factory SessionReviewModel.fromJson(Map<String, dynamic> json) {
    return SessionReviewModel(
      clientName: json['clientName'] ?? '',
      programName: json['programName'] ?? '',
      avatarUrl: json['avatarUrl'] ?? '',
      durationMins: json['durationMins'] ?? 0,
      volumeK: (json['volumeK'] ?? 0).toDouble(),
      avgRpe: (json['avgRpe'] ?? 0).toDouble(),
      volumeTrendPercentage: (json['volumeTrendPercentage'] ?? 0).toDouble(),
      defaultFeedback: json['defaultFeedback'] ?? '',
      exercises: (json['exercises'] as List?)
              ?.map((e) => ExerciseModel.fromJson(e))
              .toList() ?? [],
      insights: (json['insights'] as List?)
              ?.map((e) => InsightModel.fromJson(e))
              .toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'clientName': clientName,
      'programName': programName,
      'durationMins': durationMins,
      'volumeK': volumeK,
      'avgRpe': avgRpe,
      'defaultFeedback': defaultFeedback,
      // You can add more mapping here based on backend needs
    };
  }
}

class ExerciseModel {
  final String name;
  final bool isPrAchieved;
  final List<SetModel> sets;

  ExerciseModel({
    required this.name,
    this.isPrAchieved = false,
    required this.sets,
  });

  factory ExerciseModel.fromJson(Map<String, dynamic> json) {
    return ExerciseModel(
      name: json['name'] ?? '',
      isPrAchieved: json['isPrAchieved'] ?? false,
      sets: (json['sets'] as List?)?.map((e) => SetModel.fromJson(e)).toList() ?? [],
    );
  }
}

class SetModel {
  final int setNumber;
  final double weight;
  final int reps;
  final double rpe;
  final bool isPr;

  SetModel({
    required this.setNumber,
    required this.weight,
    required this.reps,
    required this.rpe,
    this.isPr = false,
  });

  factory SetModel.fromJson(Map<String, dynamic> json) {
    return SetModel(
      setNumber: json['setNumber'] ?? 0,
      weight: (json['weight'] ?? 0).toDouble(),
      reps: json['reps'] ?? 0,
      rpe: (json['rpe'] ?? 0).toDouble(),
      isPr: json['isPr'] ?? false,
    );
  }
}

class InsightModel {
  final String type; // 'trend' or 'time'
  final String text;

  InsightModel({required this.type, required this.text});

  factory InsightModel.fromJson(Map<String, dynamic> json) {
    return InsightModel(
      type: json['type'] ?? 'trend',
      text: json['text'] ?? '',
    );
  }
}