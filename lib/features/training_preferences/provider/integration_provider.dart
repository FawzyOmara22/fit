import 'package:flutter/material.dart';
import 'package:kinetic/features/training_preferences/models/integration_model.dart';


class IntegrationProvider extends ChangeNotifier {
  IntegrationPreferences? _preferences;
  bool _isLoading = true;

  IntegrationPreferences? get preferences => _preferences;
  bool get isLoading => _isLoading;

  IntegrationProvider() {
    loadIntegrations();
  }

  Future<void> loadIntegrations() async {
    _isLoading = true;
    notifyListeners();

    // محاكاة الاتصال بالسيرفر
    await Future.delayed(const Duration(seconds: 1));
    
    _preferences = IntegrationPreferences(
      isAppleHealthConnected: true,
      isStravaConnected: false,
      isGarminConnected: false,
      isInstagramConnected: false,
      isWhatsAppConnected: false,
    );

    _isLoading = false;
    notifyListeners();
  }

  // دوال للتحكم في الربط
  void toggleAppleHealth(bool value) {
    if (_preferences == null) return;
    _preferences!.isAppleHealthConnected = value;
    notifyListeners();
  }

  void connectStrava() {
    if (_preferences == null) return;
    _preferences!.isStravaConnected = !_preferences!.isStravaConnected;
    notifyListeners();
  }

  void connectGarmin() {
    if (_preferences == null) return;
    _preferences!.isGarminConnected = !_preferences!.isGarminConnected;
    notifyListeners();
  }

  void connectInstagram() {
    if (_preferences == null) return;
    _preferences!.isInstagramConnected = !_preferences!.isInstagramConnected;
    notifyListeners();
  }

  void connectWhatsApp() {
    if (_preferences == null) return;
    _preferences!.isWhatsAppConnected = !_preferences!.isWhatsAppConnected;
    notifyListeners();
  }
}