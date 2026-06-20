// lib/features/library/models/library_model.dart

class WorkoutProgram {
  final String id;
  final String title;
  final String? subtitle;
  final String? metaData; // e.g., "4 WEEKS • ADVANCED"
  final String duration;
  final String? daysPerWeek;
  final String? level;
  final String imageUrl;
  final bool isPremium;
  final bool isEditorsChoice;

  WorkoutProgram({
    required this.id,
    required this.title,
    this.subtitle,
    this.metaData,
    required this.duration,
    this.daysPerWeek,
    this.level,
    required this.imageUrl,
    this.isPremium = false,
    this.isEditorsChoice = false,
  });

  // استقبال البيانات من الـ API
  factory WorkoutProgram.fromJson(Map<String, dynamic> json) {
    return WorkoutProgram(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      subtitle: json['subtitle'],
      metaData: json['meta_data'],
      duration: json['duration'] ?? '',
      daysPerWeek: json['days_per_week'],
      level: json['level'],
      imageUrl: json['image_url'] ?? '',
      isPremium: json['is_premium'] ?? false,
      isEditorsChoice: json['is_editors_choice'] ?? false,
    );
  }

  // إرسال البيانات للـ API
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'meta_data': metaData,
      'duration': duration,
      'days_per_week': daysPerWeek,
      'level': level,
      'image_url': imageUrl,
      'is_premium': isPremium,
      'is_editors_choice': isEditorsChoice,
    };
  }
}