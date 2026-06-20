class ExerciseModel {
  final String id;
  final String name;
  final String muscles;
  final List<String> tags;
  final bool hasAiAnalysis;
  final String imagePath;

  ExerciseModel({
    required this.id,
    required this.name,
    required this.muscles,
    required this.tags,
    this.hasAiAnalysis = false,
    required this.imagePath,
  });

  // دالة تحويل البيانات القادمة من الـ API (JSON) إلى كائن (Object)
  factory ExerciseModel.fromJson(Map<String, dynamic> json) {
    return ExerciseModel(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      muscles: json['muscles']?.toString() ?? '',
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [],
      hasAiAnalysis: json['hasAiAnalysis'] as bool? ?? false,
      imagePath: json['imagePath']?.toString() ?? '',
    );
  }

  // دالة تحويل الكائن (Object) إلى JSON لإرساله للـ API
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'muscles': muscles,
      'tags': tags,
      'hasAiAnalysis': hasAiAnalysis,
      'imagePath': imagePath,
    };
  }
}