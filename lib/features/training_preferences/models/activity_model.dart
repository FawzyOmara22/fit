class WorkoutActivityModel {
  final String id;
  final String dateText;
  final String title;
  final String location;
  final int totalVolume;
  final String durationText;
  final int avgHeartRate;
  final List<ExerciseLogModel> exercises;
  final List<CommentModel> comments;

  WorkoutActivityModel({
    required this.id,
    required this.dateText,
    required this.title,
    required this.location,
    required this.totalVolume,
    required this.durationText,
    required this.avgHeartRate,
    required this.exercises,
    required this.comments,
  });

  factory WorkoutActivityModel.fromJson(Map<String, dynamic> json) {
    return WorkoutActivityModel(
      id: json['id']?.toString() ?? '',
      dateText: json['dateText'] ?? '',
      title: json['title'] ?? '',
      location: json['location'] ?? '',
      totalVolume: json['totalVolume'] ?? 0,
      durationText: json['durationText'] ?? '',
      avgHeartRate: json['avgHeartRate'] ?? 0,
      exercises: (json['exercises'] as List<dynamic>?)
              ?.map((e) => ExerciseLogModel.fromJson(e))
              .toList() ??
          [],
      comments: (json['comments'] as List<dynamic>?)
              ?.map((c) => CommentModel.fromJson(c))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'dateText': dateText,
      'title': title,
      'location': location,
      'totalVolume': totalVolume,
      'durationText': durationText,
      'avgHeartRate': avgHeartRate,
      'exercises': exercises.map((e) => e.toJson()).toList(),
      'comments': comments.map((c) => c.toJson()).toList(),
    };
  }
}

class ExerciseLogModel {
  final String id;
  final String name;
  final List<SetModel> sets;

  ExerciseLogModel({required this.id, required this.name, required this.sets});

  factory ExerciseLogModel.fromJson(Map<String, dynamic> json) {
    return ExerciseLogModel(
      id: json['id']?.toString() ?? '',
      name: json['name'] ?? '',
      sets: (json['sets'] as List<dynamic>?)
              ?.map((s) => SetModel.fromJson(s))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'sets': sets.map((s) => s.toJson()).toList(),
    };
  }
}

class SetModel {
  final int setNumber;
  final int weight;
  final int reps;
  final bool isCompleted;
  final bool isPR;

  SetModel({
    required this.setNumber,
    required this.weight,
    required this.reps,
    this.isCompleted = false,
    this.isPR = false,
  });

  factory SetModel.fromJson(Map<String, dynamic> json) {
    return SetModel(
      setNumber: json['setNumber'] ?? 1,
      weight: json['weight'] ?? 0,
      reps: json['reps'] ?? 0,
      isCompleted: json['isCompleted'] ?? false,
      isPR: json['isPR'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'setNumber': setNumber,
      'weight': weight,
      'reps': reps,
      'isCompleted': isCompleted,
      'isPR': isPR,
    };
  }
}

class CommentModel {
  final String id;
  final String authorName;
  final String avatarUrl;
  final String timeAgo;
  final String content;
  final int likes;

  CommentModel({
    required this.id,
    required this.authorName,
    required this.avatarUrl,
    required this.timeAgo,
    required this.content,
    required this.likes,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json['id']?.toString() ?? '',
      authorName: json['authorName'] ?? '',
      avatarUrl: json['avatarUrl'] ?? '',
      timeAgo: json['timeAgo'] ?? '',
      content: json['content'] ?? '',
      likes: json['likes'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'authorName': authorName,
      'avatarUrl': avatarUrl,
      'timeAgo': timeAgo,
      'content': content,
      'likes': likes,
    };
  }
}