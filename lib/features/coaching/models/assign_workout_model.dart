// الموديل الخاص بطلب الإرسال للـ API (POST Request)
class AssignmentRequestModel {
  final String clientId;
  final String workoutId;
  final String scheduledDate;

  AssignmentRequestModel({
    required this.clientId,
    required this.workoutId,
    required this.scheduledDate,
  });

  Map<String, dynamic> toJson() {
    return {
      'clientId': clientId,
      'workoutId': workoutId,
      'scheduledDate': scheduledDate,
    };
  }
}

// موديل العميل
class AssignedClientModel {
  final String id;
  final String name;
  final String programInfo;
  final String avatarUrl;

  AssignedClientModel({
    required this.id,
    required this.name,
    required this.programInfo,
    required this.avatarUrl,
  });

  factory AssignedClientModel.fromJson(Map<String, dynamic> json) {
    return AssignedClientModel(
      id: json['id']?.toString() ?? '',
      name: json['name'] ?? '',
      programInfo: json['programInfo'] ?? '',
      avatarUrl: json['avatarUrl'] ?? '',
    );
  }
}

// موديل التمرين (روتين أو برنامج)
class WorkoutItemModel {
  final String id;
  final String title;
  final String description;
  final int durationMin;
  final int exerciseCount;
  final String intensityTag;

  WorkoutItemModel({
    required this.id,
    required this.title,
    required this.description,
    required this.durationMin,
    required this.exerciseCount,
    required this.intensityTag,
  });

  factory WorkoutItemModel.fromJson(Map<String, dynamic> json) {
    return WorkoutItemModel(
      id: json['id']?.toString() ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      durationMin: json['durationMin'] ?? 0,
      exerciseCount: json['exerciseCount'] ?? 0,
      intensityTag: json['intensityTag'] ?? '',
    );
  }
}