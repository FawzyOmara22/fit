class MilestoneModel {
  final String type; // 'new_pr', 'volume_pr', 'max_pr'
  final String date;
  final String valueText;
  final String percentage;
  final bool isPositive;

  MilestoneModel({
    required this.type,
    required this.date,
    required this.valueText,
    required this.percentage,
    this.isPositive = true,
  });

  // 1. الاستقبال: من JSON إلى الكائن (Object)
  factory MilestoneModel.fromJson(Map<String, dynamic> json) {
    return MilestoneModel(
      type: json['type'] ?? '',
      date: json['date'] ?? '',
      valueText: json['value_text'] ?? '',
      percentage: json['percentage'] ?? '',
      isPositive: json['is_positive'] ?? true,
    );
  }

  // 2. الإرسال: من الكائن (Object) إلى JSON للـ API
  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'date': date,
      'value_text': valueText,
      'percentage': percentage,
      'is_positive': isPositive,
    };
  }
}