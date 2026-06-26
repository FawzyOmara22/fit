enum PostType { workout, endurance }

class FeedPostModel {
  final String id;
  final PostType type;
  final String userName;
  final String userAvatar;
  final String timeAgo;
  final String postTitle;
  final int likes;
  final int comments;

  // إحصائيات مشتركة أو مختلفة حسب النوع
  final String stat1Label; // Duration أو Time
  final String stat1Value;
  final String stat2Label; // Volume أو Dist
  final String stat2Value;
  final String stat3Label; // Sets أو Pace
  final String stat3Value;

  // خاصة بالـ Workout
  final List<String>? exercises;
  final String? personalRecordText;

  // خاصة بالـ Endurance
  final String? mapImageUrl;
  final String? locationName;

  FeedPostModel({
    required this.id,
    required this.type,
    required this.userName,
    required this.userAvatar,
    required this.timeAgo,
    required this.postTitle,
    required this.likes,
    required this.comments,
    required this.stat1Label,
    required this.stat1Value,
    required this.stat2Label,
    required this.stat2Value,
    required this.stat3Label,
    required this.stat3Value,
    this.exercises,
    this.personalRecordText,
    this.mapImageUrl,
    this.locationName,
  });

  factory FeedPostModel.fromJson(Map<String, dynamic> json) {
    return FeedPostModel(
      id: json['id']?.toString() ?? '',
      type: json['type'] == 'endurance' ? PostType.endurance : PostType.workout,
      userName: json['userName'] ?? '',
      userAvatar: json['userAvatar'] ?? '',
      timeAgo: json['timeAgo'] ?? '',
      postTitle: json['postTitle'] ?? '',
      likes: json['likes'] ?? 0,
      comments: json['comments'] ?? 0,
      stat1Label: json['stat1Label'] ?? '',
      stat1Value: json['stat1Value'] ?? '',
      stat2Label: json['stat2Label'] ?? '',
      stat2Value: json['stat2Value'] ?? '',
      stat3Label: json['stat3Label'] ?? '',
      stat3Value: json['stat3Value'] ?? '',
      exercises: (json['exercises'] as List<dynamic>?)?.map((e) => e.toString()).toList(),
      personalRecordText: json['personalRecordText'],
      mapImageUrl: json['mapImageUrl'],
      locationName: json['locationName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type == PostType.endurance ? 'endurance' : 'workout',
      'userName': userName,
      'userAvatar': userAvatar,
      'timeAgo': timeAgo,
      'postTitle': postTitle,
      'likes': likes,
      'comments': comments,
      'stat1Label': stat1Label,
      'stat1Value': stat1Value,
      'stat2Label': stat2Label,
      'stat2Value': stat2Value,
      'stat3Label': stat3Label,
      'stat3Value': stat3Value,
      'exercises': exercises,
      'personalRecordText': personalRecordText,
      'mapImageUrl': mapImageUrl,
      'locationName': locationName,
    };
  }
}