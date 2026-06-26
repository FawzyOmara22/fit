class CoachingDataModel {
  final List<CoachModel> myCoaches;
  final List<ExploreCoachModel> exploreCoaches;
  final List<ProgramModel> programs;
  final List<FeatureModel> edgeFeatures;

  CoachingDataModel({
    required this.myCoaches,
    required this.exploreCoaches,
    required this.programs,
    required this.edgeFeatures,
  });

  factory CoachingDataModel.fromJson(Map<String, dynamic> json) {
    return CoachingDataModel(
      myCoaches: (json['myCoaches'] as List<dynamic>?)?.map((e) => CoachModel.fromJson(e)).toList() ?? [],
      exploreCoaches: (json['exploreCoaches'] as List<dynamic>?)?.map((e) => ExploreCoachModel.fromJson(e)).toList() ?? [],
      programs: (json['programs'] as List<dynamic>?)?.map((e) => ProgramModel.fromJson(e)).toList() ?? [],
      edgeFeatures: (json['edgeFeatures'] as List<dynamic>?)?.map((e) => FeatureModel.fromJson(e)).toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'myCoaches': myCoaches.map((e) => e.toJson()).toList(),
      'exploreCoaches': exploreCoaches.map((e) => e.toJson()).toList(),
      'programs': programs.map((e) => e.toJson()).toList(),
      'edgeFeatures': edgeFeatures.map((e) => e.toJson()).toList(),
    };
  }
}

class CoachModel {
  final String id;
  final String name;
  final String specialty;
  final String avatarUrl;

  CoachModel({required this.id, required this.name, required this.specialty, required this.avatarUrl});

  factory CoachModel.fromJson(Map<String, dynamic> json) {
    return CoachModel(
      id: json['id']?.toString() ?? '',
      name: json['name'] ?? '',
      specialty: json['specialty'] ?? '',
      avatarUrl: json['avatarUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'specialty': specialty, 'avatarUrl': avatarUrl};
}

class ExploreCoachModel {
  final String id;
  final String name;
  final String experience;
  final String tag;
  final String imageUrl;

  ExploreCoachModel({required this.id, required this.name, required this.experience, required this.tag, required this.imageUrl});

  factory ExploreCoachModel.fromJson(Map<String, dynamic> json) {
    return ExploreCoachModel(
      id: json['id']?.toString() ?? '',
      name: json['name'] ?? '',
      experience: json['experience'] ?? '',
      tag: json['tag'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'experience': experience, 'tag': tag, 'imageUrl': imageUrl};
}

class ProgramModel {
  final String id;
  final String title;
  final String subtitle; // e.g., "Level 1 • 4 Weeks" or "With Sarah Jenkins"
  final String price; // e.g., "$49"
  final bool isMain;

  ProgramModel({required this.id, required this.title, required this.subtitle, required this.price, this.isMain = false});

  factory ProgramModel.fromJson(Map<String, dynamic> json) {
    return ProgramModel(
      id: json['id']?.toString() ?? '',
      title: json['title'] ?? '',
      subtitle: json['subtitle'] ?? '',
      price: json['price'] ?? '',
      isMain: json['isMain'] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {'id': id, 'title': title, 'subtitle': subtitle, 'price': price, 'isMain': isMain};
}

class FeatureModel {
  final String titleKey;
  final String subtitleKey;

  FeatureModel({required this.titleKey, required this.subtitleKey});

  factory FeatureModel.fromJson(Map<String, dynamic> json) {
    return FeatureModel(
      titleKey: json['titleKey'] ?? '',
      subtitleKey: json['subtitleKey'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {'titleKey': titleKey, 'subtitleKey': subtitleKey};
}