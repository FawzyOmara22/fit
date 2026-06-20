class LogMeasurementModel {
  final double value;
  final String unit; // 'kg' or 'lbs'
  final String? notes;
  final String date;

  LogMeasurementModel({
    required this.value,
    required this.unit,
    this.notes,
    required this.date,
  });

  // من الـ API للتطبيق
  factory LogMeasurementModel.fromJson(Map<String, dynamic> json) {
    return LogMeasurementModel(
      value: (json['value'] ?? 0.0).toDouble(),
      unit: json['unit'] ?? 'kg',
      notes: json['notes'],
      date: json['date'] ?? DateTime.now().toIso8601String(),
    );
  }

  // من التطبيق للـ API
  Map<String, dynamic> toJson() {
    return {
      'value': value,
      'unit': unit,
      'notes': notes,
      'date': date,
    };
  }
}