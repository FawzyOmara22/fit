class BodyProgressModel {
  final String beforeImageUrl;
  final String beforeDate;
  final int beforeWeight;
  final String afterImageUrl;
  final String afterDate;
  final int afterWeight;
  final int totalWeightLoss;
  final double bodyFatChange;
  final int consistencyScorePercentage;
  final String consistencyLevel;

  BodyProgressModel({
    required this.beforeImageUrl,
    required this.beforeDate,
    required this.beforeWeight,
    required this.afterImageUrl,
    required this.afterDate,
    required this.afterWeight,
    required this.totalWeightLoss,
    required this.bodyFatChange,
    required this.consistencyScorePercentage,
    required this.consistencyLevel,
  });

  factory BodyProgressModel.fromJson(Map<String, dynamic> json) {
    return BodyProgressModel(
      beforeImageUrl: json['before_image_url'] ?? '',
      beforeDate: json['before_date'] ?? '',
      beforeWeight: json['before_weight'] ?? 0,
      afterImageUrl: json['after_image_url'] ?? '',
      afterDate: json['after_date'] ?? '',
      afterWeight: json['after_weight'] ?? 0,
      totalWeightLoss: json['total_weight_loss'] ?? 0,
      bodyFatChange: (json['body_fat_change'] ?? 0).toDouble(),
      consistencyScorePercentage: json['consistency_score_percentage'] ?? 0,
      consistencyLevel: json['consistency_level'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'before_image_url': beforeImageUrl,
      'before_date': beforeDate,
      'before_weight': beforeWeight,
      'after_image_url': afterImageUrl,
      'after_date': afterDate,
      'after_weight': afterWeight,
      'total_weight_loss': totalWeightLoss,
      'body_fat_change': bodyFatChange,
      'consistency_score_percentage': consistencyScorePercentage,
      'consistency_level': consistencyLevel,
    };
  }
}