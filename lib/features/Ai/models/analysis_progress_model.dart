class AnalysisProgressModel {
  final int uploadPercentage;
  final String fileName;
  final String insightTitle;
  final String insightDescription;
  final String coachName;
  final String coachTitle;
  final String coachAvatarUrl;
  final int estimatedWaitSeconds;

  AnalysisProgressModel({
    required this.uploadPercentage,
    required this.fileName,
    required this.insightTitle,
    required this.insightDescription,
    required this.coachName,
    required this.coachTitle,
    required this.coachAvatarUrl,
    required this.estimatedWaitSeconds,
  });

  // استقبال الداتا من الـ API
  factory AnalysisProgressModel.fromJson(Map<String, dynamic> json) {
    return AnalysisProgressModel(
      uploadPercentage: json['uploadPercentage'] as int? ?? 0,
      fileName: json['fileName']?.toString() ?? '',
      insightTitle: json['insightTitle']?.toString() ?? '',
      insightDescription: json['insightDescription']?.toString() ?? '',
      coachName: json['coachName']?.toString() ?? '',
      coachTitle: json['coachTitle']?.toString() ?? '',
      coachAvatarUrl: json['coachAvatarUrl']?.toString() ?? '',
      estimatedWaitSeconds: json['estimatedWaitSeconds'] as int? ?? 45,
    );
  }

  // إرسال الداتا للـ API
  Map<String, dynamic> toJson() {
    return {
      'uploadPercentage': uploadPercentage,
      'fileName': fileName,
      'insightTitle': insightTitle,
      'insightDescription': insightDescription,
      'coachName': coachName,
      'coachTitle': coachTitle,
      'coachAvatarUrl': coachAvatarUrl,
      'estimatedWaitSeconds': estimatedWaitSeconds,
    };
  }
}