class TrainingCalendarModel {
  final int currentStreak;
  final String statusTitle;
  final String currentMonthYear;
  final TodaySessionModel todaySession;
  final MonthlyPerformanceModel monthlyPerformance;

  TrainingCalendarModel({
    required this.currentStreak,
    required this.statusTitle,
    required this.currentMonthYear,
    required this.todaySession,
    required this.monthlyPerformance,
  });

  // 👇 دي الدالة الجديدة اللي ضفناها عشان تحل الإيرور وتولد بيانات وهمية
  factory TrainingCalendarModel.defaultCalendar() {
    return TrainingCalendarModel(
      currentStreak: 14,
      statusTitle: 'ELITE STATUS',
      currentMonthYear: 'OCTOBER 2023',
      todaySession: TodaySessionModel(
        title: 'LEG DAY A',
        startTime: '07:45',
        tags: ['HYPERTROPHY', 'LOWER BODY'],
        durationMin: 72,
        volumeTons: 12.4,
        avgHr: 142,
        dateString: 'FRIDAY, OCT 6',
      ),
      monthlyPerformance: MonthlyPerformanceModel(
        totalWorkouts: 18,
        totalTimeHours: 24.5,
        cumulativeVolumeTons: 148.2,
      ),
    );
  }

  // الاستقبال من الـ API
  factory TrainingCalendarModel.fromJson(Map<String, dynamic> json) {
    return TrainingCalendarModel(
      currentStreak: json['current_streak'] ?? 0,
      statusTitle: json['status_title'] ?? '',
      currentMonthYear: json['current_month_year'] ?? '',
      todaySession: TodaySessionModel.fromJson(json['today_session'] ?? {}),
      monthlyPerformance: MonthlyPerformanceModel.fromJson(json['monthly_performance'] ?? {}),
    );
  }

  // الإرسال للـ API
  Map<String, dynamic> toJson() {
    return {
      'current_streak': currentStreak,
      'status_title': statusTitle,
      'current_month_year': currentMonthYear,
      'today_session': todaySession.toJson(),
      'monthly_performance': monthlyPerformance.toJson(),
    };
  }
}

class TodaySessionModel {
  final String title;
  final String startTime;
  final List<String> tags;
  final int durationMin;
  final double volumeTons;
  final int avgHr;
  final String dateString;

  TodaySessionModel({
    required this.title,
    required this.startTime,
    required this.tags,
    required this.durationMin,
    required this.volumeTons,
    required this.avgHr,
    required this.dateString,
  });

  factory TodaySessionModel.fromJson(Map<String, dynamic> json) {
    return TodaySessionModel(
      title: json['title'] ?? '',
      startTime: json['start_time'] ?? '',
      tags: List<String>.from(json['tags'] ?? []),
      durationMin: json['duration_min'] ?? 0,
      volumeTons: (json['volume_tons'] ?? 0).toDouble(),
      avgHr: json['avg_hr'] ?? 0,
      dateString: json['date_string'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'start_time': startTime,
      'tags': tags,
      'duration_min': durationMin,
      'volume_tons': volumeTons,
      'avg_hr': avgHr,
      'date_string': dateString,
    };
  }
}

class MonthlyPerformanceModel {
  final int totalWorkouts;
  final double totalTimeHours;
  final double cumulativeVolumeTons;

  MonthlyPerformanceModel({
    required this.totalWorkouts,
    required this.totalTimeHours,
    required this.cumulativeVolumeTons,
  });

  factory MonthlyPerformanceModel.fromJson(Map<String, dynamic> json) {
    return MonthlyPerformanceModel(
      totalWorkouts: json['total_workouts'] ?? 0,
      totalTimeHours: (json['total_time_hours'] ?? 0).toDouble(),
      cumulativeVolumeTons: (json['cumulative_volume_tons'] ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total_workouts': totalWorkouts,
      'total_time_hours': totalTimeHours,
      'cumulative_volume_tons': cumulativeVolumeTons,
    };
  }
}