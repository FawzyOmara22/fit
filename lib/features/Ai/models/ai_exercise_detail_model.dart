class AiExerciseDetailModel {
  final String id;
  final String name;
  final String imageUrl;
  final List<InstructionItem> coreCues;
  final List<InstructionItem> setupSteps;
  final List<MistakeItem> commonMistakes;
  final ProInsight insight;

  AiExerciseDetailModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.coreCues,
    required this.setupSteps,
    required this.commonMistakes,
    required this.insight,
  });

  factory AiExerciseDetailModel.fromJson(Map<String, dynamic> json) {
    return AiExerciseDetailModel(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      imageUrl: json['imageUrl']?.toString() ?? '',
      coreCues: (json['coreCues'] as List<dynamic>?)
              ?.map((e) => InstructionItem.fromJson(e))
              .toList() ?? [],
      setupSteps: (json['setupSteps'] as List<dynamic>?)
              ?.map((e) => InstructionItem.fromJson(e))
              .toList() ?? [],
      commonMistakes: (json['commonMistakes'] as List<dynamic>?)
              ?.map((e) => MistakeItem.fromJson(e))
              .toList() ?? [],
      insight: ProInsight.fromJson(json['insight'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'coreCues': coreCues.map((e) => e.toJson()).toList(),
      'setupSteps': setupSteps.map((e) => e.toJson()).toList(),
      'commonMistakes': commonMistakes.map((e) => e.toJson()).toList(),
      'insight': insight.toJson(),
    };
  }
}

class InstructionItem {
  final String title;
  final String description;
  final String? icon;

  InstructionItem({required this.title, required this.description, this.icon});

  factory InstructionItem.fromJson(Map<String, dynamic> json) => InstructionItem(
        title: json['title']?.toString() ?? '',
        description: json['description']?.toString() ?? '',
        icon: json['icon']?.toString(),
      );

  Map<String, dynamic> toJson() => {'title': title, 'description': description, 'icon': icon};
}

class MistakeItem {
  final String title;
  final String description;
  final bool isCorrectWay; // True = Green Check, False = Red X

  MistakeItem({required this.title, required this.description, this.isCorrectWay = false});

  factory MistakeItem.fromJson(Map<String, dynamic> json) => MistakeItem(
        title: json['title']?.toString() ?? '',
        description: json['description']?.toString() ?? '',
        isCorrectWay: json['isCorrectWay'] as bool? ?? false,
      );

  Map<String, dynamic> toJson() => {'title': title, 'description': description, 'isCorrectWay': isCorrectWay};
}

class ProInsight {
  final String title;
  final String description;

  ProInsight({required this.title, required this.description});

  factory ProInsight.fromJson(Map<String, dynamic> json) => ProInsight(
        title: json['title']?.toString() ?? '',
        description: json['description']?.toString() ?? '',
      );

  Map<String, dynamic> toJson() => {'title': title, 'description': description};
}