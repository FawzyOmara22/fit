class IntegrationPreferences {
  bool isAppleHealthConnected;
  bool isStravaConnected;
  bool isGarminConnected;
  bool isInstagramConnected;
  bool isWhatsAppConnected;

  IntegrationPreferences({
    required this.isAppleHealthConnected,
    required this.isStravaConnected,
    required this.isGarminConnected,
    required this.isInstagramConnected,
    required this.isWhatsAppConnected,
  });

  factory IntegrationPreferences.fromJson(Map<String, dynamic> json) {
    return IntegrationPreferences(
      isAppleHealthConnected: json['apple_health'] ?? false,
      isStravaConnected: json['strava'] ?? false,
      isGarminConnected: json['garmin'] ?? false,
      isInstagramConnected: json['instagram'] ?? false,
      isWhatsAppConnected: json['whatsapp'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'apple_health': isAppleHealthConnected,
      'strava': isStravaConnected,
      'garmin': isGarminConnected,
      'instagram': isInstagramConnected,
      'whatsapp': isWhatsAppConnected,
    };
  }
}