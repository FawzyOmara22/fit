class StatisticsModel {
  final double totalVolumeTons;
  final int volumeIncreasePercentage;
  final int totalWorkouts;
  final String totalReps; // String لسهولة العرض زي "12.4k"
  final double averagePerWeek;
  final bool isOnTrack;
  final Map<String, int> muscleSplit;

  StatisticsModel({
    required this.totalVolumeTons,
    required this.volumeIncreasePercentage,
    required this.totalWorkouts,
    required this.totalReps,
    required this.averagePerWeek,
    required this.isOnTrack,
    required this.muscleSplit,
  });

  factory StatisticsModel.fromJson(Map<String, dynamic> json) {
    return StatisticsModel(
      totalVolumeTons: (json['total_volume_tons'] ?? 0).toDouble(),
      volumeIncreasePercentage: json['volume_increase_percentage'] ?? 0,
      totalWorkouts: json['total_workouts'] ?? 0,
      totalReps: json['total_reps'] ?? '0',
      averagePerWeek: (json['average_per_week'] ?? 0).toDouble(),
      isOnTrack: json['is_on_track'] ?? true,
      muscleSplit: Map<String, int>.from(json['muscle_split'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total_volume_tons': totalVolumeTons,
      'volume_increase_percentage': volumeIncreasePercentage,
      'total_workouts': totalWorkouts,
      'total_reps': totalReps,
      'average_per_week': averagePerWeek,
      'is_on_track': isOnTrack,
      'muscle_split': muscleSplit,
    };
  }
}