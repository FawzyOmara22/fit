class ExerciseDetailModel {
  final String id;
  final String name;
  final String imageUrl;
  final String videoUrl; // لو في فيديو
  final List<CoreCue> coreCues;
  final List<SetupStep> setupSteps;
  final List<Mistake> commonMistakes;
  final ProInsight proInsight;

  ExerciseDetailModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.videoUrl,
    required this.coreCues,
    required this.setupSteps,
    required this.commonMistakes,
    required this.proInsight,
  });

  factory ExerciseDetailModel.fromJson(Map<String, dynamic> json) {
    // بناء الموديل من الـ API (مثال توضيحي)
    return ExerciseDetailModel(
      id: json['id'],
      name: json['name'],
      imageUrl: json['image_url'],
      videoUrl: json['video_url'],
      coreCues: [], // يتم تحويل الـ JSON لـ List
      setupSteps: [],
      commonMistakes: [],
      proInsight: ProInsight(title: '', description: ''),
    );
  }
}

class CoreCue {
  final String title;
  final String description;
  final String iconPath;
  CoreCue({required this.title, required this.description, required this.iconPath});
}

class SetupStep {
  final String title;
  final String description;
  SetupStep({required this.title, required this.description});
}

class Mistake {
  final String title;
  final String description;
  final bool isCorrect; // لتحديد علامة الصح (أخضر) أو الغلط (أحمر)
  Mistake({required this.title, required this.description, required this.isCorrect});
}

class ProInsight {
  final String title;
  final String description;
  ProInsight({required this.title, required this.description});
}