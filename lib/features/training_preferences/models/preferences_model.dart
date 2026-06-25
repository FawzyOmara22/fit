// preferences_model.dart
class TrainingPreferences {
  int defaultRestTimer; // بالثواني
  String weightUnit; // 'KG' أو 'LBS'
  bool soundEffects;
  bool autoStartRestTimer;
  bool autoAdvanceExercises;
  bool vibrateOnCompletion;
  int defaultBarbellWeight; // بالـ KG مثلاً
  bool fractionalsEnabled;
  bool appleHealthConnected;

  TrainingPreferences({
    required this.defaultRestTimer,
    required this.weightUnit,
    required this.soundEffects,
    required this.autoStartRestTimer,
    required this.autoAdvanceExercises,
    required this.vibrateOnCompletion,
    required this.defaultBarbellWeight,
    required this.fractionalsEnabled,
    required this.appleHealthConnected,
  });

  // استقبال البيانات من API
  factory TrainingPreferences.fromJson(Map<String, dynamic> json) {
    return TrainingPreferences(
      defaultRestTimer: json['default_rest_timer'] ?? 90,
      weightUnit: json['weight_unit'] ?? 'KG',
      soundEffects: json['sound_effects'] ?? true,
      autoStartRestTimer: json['auto_start_rest_timer'] ?? true,
      autoAdvanceExercises: json['auto_advance_exercises'] ?? false,
      vibrateOnCompletion: json['vibrate_on_completion'] ?? true,
      defaultBarbellWeight: json['default_barbell_weight'] ?? 20,
      fractionalsEnabled: json['fractionals_enabled'] ?? true,
      appleHealthConnected: json['apple_health_connected'] ?? true,
    );
  }

  // إرسال البيانات للـ API
  Map<String, dynamic> toJson() {
    return {
      'default_rest_timer': defaultRestTimer,
      'weight_unit': weightUnit,
      'sound_effects': soundEffects,
      'auto_start_rest_timer': autoStartRestTimer,
      'auto_advance_exercises': autoAdvanceExercises,
      'vibrate_on_completion': vibrateOnCompletion,
      'default_barbell_weight': defaultBarbellWeight,
      'fractionals_enabled': fractionalsEnabled,
      'apple_health_connected': appleHealthConnected,
    };
  }
}