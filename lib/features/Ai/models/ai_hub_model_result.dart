class AiHubDataModel {
  final String trendPercentage; // زي "+4%"
  final int globalRank;
  final List<double> chartData; // نسب العواميد في الرسم البياني
  final List<CheckItemModel> checks;

  AiHubDataModel({
    required this.trendPercentage,
    required this.globalRank,
    required this.chartData,
    required this.checks,
  });

  factory AiHubDataModel.fromJson(Map<String, dynamic> json) {
    return AiHubDataModel(
      trendPercentage: json['trendPercentage']?.toString() ?? '',
      globalRank: json['globalRank'] as int? ?? 0,
      chartData: (json['chartData'] as List<dynamic>?)?.map((e) => (e as num).toDouble()).toList() ?? [],
      checks: (json['checks'] as List<dynamic>?)?.map((e) => CheckItemModel.fromJson(e)).toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'trendPercentage': trendPercentage,
      'globalRank': globalRank,
      'chartData': chartData,
      'checks': checks.map((e) => e.toJson()).toList(),
    };
  }
}

class CheckItemModel {
  final String exerciseName;
  final String dateString;
  final int setsCount;
  final String statusKey; // 'elite', 'good', 'needs_work'
  final int score;
  final String imageUrl;

  CheckItemModel({
    required this.exerciseName,
    required this.dateString,
    required this.setsCount,
    required this.statusKey,
    required this.score,
    required this.imageUrl,
  });

  factory CheckItemModel.fromJson(Map<String, dynamic> json) {
    return CheckItemModel(
      exerciseName: json['exerciseName']?.toString() ?? '',
      dateString: json['dateString']?.toString() ?? '',
      setsCount: json['setsCount'] as int? ?? 0,
      statusKey: json['statusKey']?.toString() ?? 'good',
      score: json['score'] as int? ?? 0,
      imageUrl: json['imageUrl']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'exerciseName': exerciseName,
      'dateString': dateString,
      'setsCount': setsCount,
      'statusKey': statusKey,
      'score': score,
      'imageUrl': imageUrl,
    };
  }
}