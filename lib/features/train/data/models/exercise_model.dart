class ExerciseModel {
  final String id;
  final String title;
  final String muscle;
  final String equipment;
  final String imageUrl;
  final String? videoUrl;

  ExerciseModel({
    required this.id,
    required this.title,
    required this.muscle,
    required this.equipment,
    required this.imageUrl,
    this.videoUrl,
  });

  // دوال للتعامل مع الـ API مستقبلاً
  factory ExerciseModel.fromJson(Map<String, dynamic> json) {
    return ExerciseModel(
      id: json['id'],
      title: json['title'],
      muscle: json['muscle'],
      equipment: json['equipment'],
      imageUrl: json['imageUrl'],
      videoUrl: json['videoUrl'],
    );
  }
}
//(يمثل التمرين نفسه في قاعدة البيانات)