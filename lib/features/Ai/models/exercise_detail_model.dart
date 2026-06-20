// lib/features/exercises/models/exercise_detail_model.dart

class CoreCue {
  final String title;
  final String description;
  final String iconCode;

  CoreCue({required this.title, required this.description, required this.iconCode});

  factory CoreCue.fromJson(Map<String, dynamic> json) {
    return CoreCue(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      iconCode: json['icon_code'] ?? '',
    );
  }
}

class SetupStep {
  final String title;
  final String description;

  SetupStep({required this.title, required this.description});

  factory SetupStep.fromJson(Map<String, dynamic> json) {
    return SetupStep(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
    );
  }
}

class CommonMistake {
  final bool isCorrect;
  final String title;
  final String description;

  CommonMistake({required this.isCorrect, required this.title, required this.description});

  factory CommonMistake.fromJson(Map<String, dynamic> json) {
    return CommonMistake(
      isCorrect: json['is_correct'] ?? false,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
    );
  }
}

class ExerciseDetailModel {
  final String id;
  final String title;
  final String videoUrl;
  final List<CoreCue> coreCues;
  final List<SetupStep> setupSteps;
  final List<CommonMistake> mistakes;
  final String proInsightTitle;
  final String proInsightDesc;

  ExerciseDetailModel({
    required this.id,
    required this.title,
    required this.videoUrl,
    required this.coreCues,
    required this.setupSteps,
    required this.mistakes,
    required this.proInsightTitle,
    required this.proInsightDesc,
  });

  factory ExerciseDetailModel.fromJson(Map<String, dynamic> json) {
    return ExerciseDetailModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      videoUrl: json['video_url'] ?? '',
      coreCues: (json['core_cues'] as List?)?.map((e) => CoreCue.fromJson(e)).toList() ?? [],
      setupSteps: (json['setup_steps'] as List?)?.map((e) => SetupStep.fromJson(e)).toList() ?? [],
      mistakes: (json['mistakes'] as List?)?.map((e) => CommonMistake.fromJson(e)).toList() ?? [],
      proInsightTitle: json['pro_insight_title'] ?? '',
      proInsightDesc: json['pro_insight_desc'] ?? '',
    );
  }
}