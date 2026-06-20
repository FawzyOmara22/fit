class WeeklyPulseModel {
  final List<double> chartData; // من 0 لـ 1 لتمثيل ارتفاع العمود
  final String metricValue; // التغير في الأداء، مثلا: "4.2cm"
  
  WeeklyPulseModel({required this.chartData, required this.metricValue});

  // استقبال البيانات من السيرفر
  factory WeeklyPulseModel.fromJson(Map<String, dynamic> json) {
    return WeeklyPulseModel(
      chartData: List<double>.from(json['chartData'] ?? [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]),
      metricValue: json['metricValue'] ?? '',
    );
  }

  // إرسال أو حفظ البيانات (Cache)
  Map<String, dynamic> toJson() {
    return {
      'chartData': chartData,
      'metricValue': metricValue,
    };
  }
}

class HubDataModel {
  final String intensityValue;
  final String recoveryValue;
  final int workoutMins;
  final int workoutKcal;
  final String insightValue;
  final WeeklyPulseModel pulseData;

  HubDataModel({
    required this.intensityValue,
    required this.recoveryValue,
    required this.workoutMins,
    required this.workoutKcal,
    required this.insightValue,
    required this.pulseData,
  });

  // استقبال البيانات من السيرفر
  factory HubDataModel.fromJson(Map<String, dynamic> json) {
    return HubDataModel(
      intensityValue: json['intensityValue'] ?? 'High (92%)',
      recoveryValue: json['recoveryValue'] ?? '-14% Optimal',
      workoutMins: json['workoutMins'] ?? 55,
      workoutKcal: json['workoutKcal'] ?? 480,
      insightValue: json['insightValue'] ?? '245 lbs',
      pulseData: WeeklyPulseModel.fromJson(json['pulseData'] ?? {}),
    );
  }

  // إرسال أو حفظ البيانات (Cache)
  Map<String, dynamic> toJson() {
    return {
      'intensityValue': intensityValue,
      'recoveryValue': recoveryValue,
      'workoutMins': workoutMins,
      'workoutKcal': workoutKcal,
      'insightValue': insightValue,
      'pulseData': pulseData.toJson(), // استدعاء الـ toJson للموديل الداخلي
    };
  }
}