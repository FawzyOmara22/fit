class CategoryMeasurement {
  final String id;
  final String titleKey; // L10n Key (e.g., 'weight', 'waist')
  final String dateString;
  final double value;
  final String unit;
  final String iconDataString; // To map icons from API if needed

  CategoryMeasurement({
    required this.id,
    required this.titleKey,
    required this.dateString,
    required this.value,
    required this.unit,
    required this.iconDataString,
  });

  // From API (JSON to Object)
  factory CategoryMeasurement.fromJson(Map<String, dynamic> json) {
    return CategoryMeasurement(
      id: json['id'] ?? '',
      titleKey: json['titleKey'] ?? '',
      dateString: json['dateString'] ?? '',
      value: (json['value'] ?? 0.0).toDouble(),
      unit: json['unit'] ?? '',
      iconDataString: json['iconData'] ?? '',
    );
  }

  // To API (Object to JSON)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titleKey': titleKey,
      'dateString': dateString,
      'value': value,
      'unit': unit,
      'iconData': iconDataString,
    };
  }
}