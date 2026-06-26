enum WorkoutStatus { today, completed, overdue }

class WorkoutScheduleModel {
  final String id;
  final String title;
  final WorkoutStatus status;
  final String dayLabel; // "TODAY", "YESTERDAY", "OVERDUE"
  final Map<String, dynamic>? payload; // لتخزين التمارين، الملاحظات، أو الإحصائيات

  WorkoutScheduleModel({
    required this.id,
    required this.title,
    required this.status,
    required this.dayLabel,
    this.payload,
  });

  // 1. الاستقبال من الـ API
  factory WorkoutScheduleModel.fromJson(Map<String, dynamic> json) {
    return WorkoutScheduleModel(
      id: json['id']?.toString() ?? '',
      title: json['title'] ?? '',
      status: _parseStatus(json['status']),
      dayLabel: json['day_label'] ?? '',
      payload: json['payload'] as Map<String, dynamic>?,
    );
  }

  // 2. الإرسال للـ API
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'status': status.name,
      'day_label': dayLabel,
      if (payload != null) 'payload': payload,
    };
  }

  static WorkoutStatus _parseStatus(String? statusStr) {
    switch (statusStr?.toLowerCase()) {
      case 'completed': return WorkoutStatus.completed;
      case 'overdue': return WorkoutStatus.overdue;
      case 'today':
      default: return WorkoutStatus.today;
    }
  }
}