class WorkoutSetModel {
  final String id;
  final String num;   // رقم المجموعة
  final String prev;  // الرقم السابق
  String kg;          // الوزن (شيلنا final عشان نقدر نعدل الرقم)
  String reps;        // التكرارات (شيلنا final عشان نقدر نعدل الرقم)
  bool isCompleted;   // (شيلنا final عشان نقدر نعلم صح)
  final bool isCurrent;

  WorkoutSetModel({
    required this.id,
    required this.num,
    required this.prev,
    required this.kg,
    required this.reps,
    this.isCompleted = false,
    this.isCurrent = false,
  });

  // دالة لتحديث حالة الـ Set بسهولة في الـ UI
  WorkoutSetModel copyWith({
    String? id,
    String? num,
    String? prev,
    String? kg,
    String? reps,
    bool? isCompleted,
    bool? isCurrent,
  }) {
    return WorkoutSetModel(
      id: id ?? this.id,
      num: num ?? this.num,
      prev: prev ?? this.prev,
      kg: kg ?? this.kg,
      reps: reps ?? this.reps,
      isCompleted: isCompleted ?? this.isCompleted,
      isCurrent: isCurrent ?? this.isCurrent,
    );
  }
}