class FormCheckModel {
  final String? videoPath;
  final String exerciseName;
  final int intensityRpe;
  final String coachNotes;

  FormCheckModel({
    this.videoPath,
    required this.exerciseName,
    required this.intensityRpe,
    required this.coachNotes,
  });

  factory FormCheckModel.fromJson(Map<String, dynamic> json) {
    return FormCheckModel(
      videoPath: json['video_path'],
      exerciseName: json['exercise_name'] ?? '',
      intensityRpe: json['intensity_rpe'] ?? 1,
      coachNotes: json['coach_notes'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'video_path': videoPath,
      'exercise_name': exerciseName,
      'intensity_rpe': intensityRpe,
      'coach_notes': coachNotes,
    };
  }
}