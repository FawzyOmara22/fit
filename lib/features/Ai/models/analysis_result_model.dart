class AnalysisResultModel {
  final String exerciseName;
  final String videoThumbnailUrl;
  final int overallScore;
  final String performanceTitle;
  final String performanceSubtitle;
  final List<MetricModel> metrics;
  final List<String> aiCues;
  final String coachName;
  final String coachTip;
  final String coachAvatarUrl;

  AnalysisResultModel({
    required this.exerciseName,
    required this.videoThumbnailUrl,
    required this.overallScore,
    required this.performanceTitle,
    required this.performanceSubtitle,
    required this.metrics,
    required this.aiCues,
    required this.coachName,
    required this.coachTip,
    required this.coachAvatarUrl,
  });

  factory AnalysisResultModel.fromJson(Map<String, dynamic> json) {
    return AnalysisResultModel(
      exerciseName: json['exerciseName']?.toString() ?? '',
      videoThumbnailUrl: json['videoThumbnailUrl']?.toString() ?? '',
      overallScore: json['overallScore'] as int? ?? 0,
      performanceTitle: json['performanceTitle']?.toString() ?? '',
      performanceSubtitle: json['performanceSubtitle']?.toString() ?? '',
      metrics: (json['metrics'] as List<dynamic>?)
              ?.map((e) => MetricModel.fromJson(e))
              .toList() ?? [],
      aiCues: (json['aiCues'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ?? [],
      coachName: json['coachName']?.toString() ?? '',
      coachTip: json['coachTip']?.toString() ?? '',
      coachAvatarUrl: json['coachAvatarUrl']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'exerciseName': exerciseName,
      'videoThumbnailUrl': videoThumbnailUrl,
      'overallScore': overallScore,
      'performanceTitle': performanceTitle,
      'performanceSubtitle': performanceSubtitle,
      'metrics': metrics.map((e) => e.toJson()).toList(),
      'aiCues': aiCues,
      'coachName': coachName,
      'coachTip': coachTip,
      'coachAvatarUrl': coachAvatarUrl,
    };
  }
}

class MetricModel {
  final String labelKey; // مفتاح الترجمة زي metric_depth
  final String value;
  final String status; // 'success' أو 'warning'

  MetricModel({required this.labelKey, required this.value, required this.status});

  factory MetricModel.fromJson(Map<String, dynamic> json) => MetricModel(
        labelKey: json['labelKey']?.toString() ?? '',
        value: json['value']?.toString() ?? '',
        status: json['status']?.toString() ?? 'success',
      );

  Map<String, dynamic> toJson() => {'labelKey': labelKey, 'value': value, 'status': status};
}