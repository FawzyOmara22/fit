class WorkoutHistoryModel {
  final int streakDays;
  final int workoutsThisMonth;
  final int totalTimeHours;
  final List<WorkoutSession> thisWeekSessions;
  final List<WorkoutSession> lastWeekSessions;

  WorkoutHistoryModel({
    required this.streakDays,
    required this.workoutsThisMonth,
    required this.totalTimeHours,
    required this.thisWeekSessions,
    required this.lastWeekSessions,
  });

  factory WorkoutHistoryModel.fromJson(Map<String, dynamic> json) {
    return WorkoutHistoryModel(
      streakDays: json['streak_days'] ?? 0,
      workoutsThisMonth: json['workouts_this_month'] ?? 0,
      totalTimeHours: json['total_time_hours'] ?? 0,
      thisWeekSessions: (json['this_week_sessions'] as List?)
              ?.map((e) => WorkoutSession.fromJson(e))
              .toList() ??
          [],
      lastWeekSessions: (json['last_week_sessions'] as List?)
              ?.map((e) => WorkoutSession.fromJson(e))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'streak_days': streakDays,
      'workouts_this_month': workoutsThisMonth,
      'total_time_hours': totalTimeHours,
      'this_week_sessions': thisWeekSessions.map((e) => e.toJson()).toList(),
      'last_week_sessions': lastWeekSessions.map((e) => e.toJson()).toList(),
    };
  }
}

class WorkoutSession {
  final String title;
  final bool isPro;
  final String date;
  final int? duration;
  final int volume;
  final int? sets;
  final List<String> tags;

  WorkoutSession({
    required this.title,
    required this.isPro,
    required this.date,
    this.duration,
    required this.volume,
    this.sets,
    required this.tags,
  });

  factory WorkoutSession.fromJson(Map<String, dynamic> json) {
    return WorkoutSession(
      title: json['title'] ?? '',
      isPro: json['is_pro'] ?? false,
      date: json['date'] ?? '',
      duration: json['duration'],
      volume: json['volume'] ?? 0,
      sets: json['sets'],
      tags: List<String>.from(json['tags'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'is_pro': isPro,
      'date': date,
      'duration': duration,
      'volume': volume,
      'sets': sets,
      'tags': tags,
    };
  }
}