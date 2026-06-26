enum NotificationType { workout, analysis, message, achievement, plan, unknown }

class NotificationModel {
  final String id;
  final NotificationType type;
  bool isUnread;
  final String createdAt; // الوقت اللي جاي من الـ API
  final Map<String, dynamic>? payload; // أي بيانات إضافية من الباك إند (زي اسم المدرب أو الوزن)

  NotificationModel({
    required this.id,
    required this.type,
    this.isUnread = false,
    this.createdAt = '',
    this.payload,
  });

  // 1. دالة الاستقبال من الـ API (Deserialization)
  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id']?.toString() ?? '',
      type: _parseType(json['type']),
      isUnread: json['is_unread'] ?? false,
      createdAt: json['created_at'] ?? '',
      payload: json['payload'] as Map<String, dynamic>?,
    );
  }

  // 2. دالة الإرسال للـ API (Serialization)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type.name, // هترجع النص زي ما هو (workout, message, etc.)
      'is_unread': isUnread,
      'created_at': createdAt,
      if (payload != null) 'payload': payload,
    };
  }

  // دالة مساعدة عشان تحول الـ String اللي جاي من الـ API للـ Enum بتاعنا
  static NotificationType _parseType(String? typeStr) {
    switch (typeStr?.toLowerCase()) {
      case 'workout':
        return NotificationType.workout;
      case 'analysis':
        return NotificationType.analysis;
      case 'message':
        return NotificationType.message;
      case 'achievement':
        return NotificationType.achievement;
      case 'plan':
        return NotificationType.plan;
      default:
        return NotificationType.unknown; // عشان لو الباك إند بعت نوع جديد التطبيق ميكراش
    }
  }
}