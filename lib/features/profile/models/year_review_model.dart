class YearReviewModel {
  final int workoutsCount;
  final String kgLifted;
  final int hoursTrained;
  final int dailyStreak;
  final int topPercent;
  final List<ImprovedLift> mostImproved;
  final List<TopLift> topLifts;

  YearReviewModel({
    required this.workoutsCount,
    required this.kgLifted,
    required this.hoursTrained,
    required this.dailyStreak,
    required this.topPercent,
    required this.mostImproved,
    required this.topLifts,
  });

  factory YearReviewModel.fromJson(Map<String, dynamic> json) {
    return YearReviewModel(
      workoutsCount: json['workouts_count'] ?? 0,
      kgLifted: json['kg_lifted'] ?? '0',
      hoursTrained: json['hours_trained'] ?? 0,
      dailyStreak: json['daily_streak'] ?? 0,
      topPercent: json['top_percent'] ?? 100,
      mostImproved: (json['most_improved'] as List?)
              ?.map((e) => ImprovedLift.fromJson(e))
              .toList() ?? [],
      topLifts: (json['top_lifts'] as List?)
              ?.map((e) => TopLift.fromJson(e))
              .toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'workouts_count': workoutsCount,
      'kg_lifted': kgLifted,
      'hours_trained': hoursTrained,
      'daily_streak': dailyStreak,
      'top_percent': topPercent,
      'most_improved': mostImproved.map((e) => e.toJson()).toList(),
      'top_lifts': topLifts.map((e) => e.toJson()).toList(),
    };
  }
}

class ImprovedLift {
  final String name;
  final String increase;

  ImprovedLift({required this.name, required this.increase});

  factory ImprovedLift.fromJson(Map<String, dynamic> json) {
    return ImprovedLift(
      name: json['name'] ?? '',
      increase: json['increase'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {'name': name, 'increase': increase};
}

class TopLift {
  final String name;
  final int reps;
  final double progress; // from 0.0 to 1.0

  TopLift({required this.name, required this.reps, required this.progress});

  factory TopLift.fromJson(Map<String, dynamic> json) {
    return TopLift(
      name: json['name'] ?? '',
      reps: json['reps'] ?? 0,
      progress: (json['progress'] ?? 0.0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {'name': name, 'reps': reps, 'progress': progress};
}