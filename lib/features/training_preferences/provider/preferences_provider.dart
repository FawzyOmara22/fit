// preferences_provider.dart
import 'package:flutter/material.dart';
import 'package:kinetic/features/training_preferences/models/api_service.dart';
import 'package:kinetic/features/training_preferences/models/preferences_model.dart';


class PreferencesProvider extends ChangeNotifier {
  final PreferencesApiService _apiService = PreferencesApiService();
  
  TrainingPreferences? _preferences;
  bool _isLoading = true;
  String _langCode = 'en'; // اللغة الافتراضية

  TrainingPreferences? get preferences => _preferences;
  bool get isLoading => _isLoading;
  String get langCode => _langCode;

  PreferencesProvider() {
    loadPreferences();
  }

  // 1. جلب البيانات من الـ API
  Future<void> loadPreferences() async {
    _isLoading = true;
    notifyListeners();

    try {
      _preferences = await _apiService.fetchPreferences();
    } catch (e) {
      print("خطأ في جلب البيانات: $e");
    }

    _isLoading = false;
    notifyListeners();
  }

  // 2. تحديث قيمة معينة ورفعها للـ API
  void toggleSoundEffects(bool value) {
    if (_preferences == null) return;
    _preferences!.soundEffects = value;
    notifyListeners();
    _saveToApi();
  }

  void setWeightUnit(String unit) {
    if (_preferences == null) return;
    _preferences!.weightUnit = unit;
    notifyListeners();
    _saveToApi();
  }

  void toggleAutoStartRest(bool value) {
    if (_preferences == null) return;
    _preferences!.autoStartRestTimer = value;
    notifyListeners();
    _saveToApi();
  }
  
  void toggleAutoAdvance(bool value) {
    if (_preferences == null) return;
    _preferences!.autoAdvanceExercises = value;
    notifyListeners();
    _saveToApi();
  }

  void toggleVibrate(bool value) {
    if (_preferences == null) return;
    _preferences!.vibrateOnCompletion = value;
    notifyListeners();
    _saveToApi();
  }

  void toggleFractionals(bool value) {
    if (_preferences == null) return;
    _preferences!.fractionalsEnabled = value;
    notifyListeners();
    _saveToApi();
  }

  // دالة الحفظ في السيرفر
  Future<void> _saveToApi() async {
    if (_preferences != null) {
      await _apiService.updatePreferences(_preferences!);
    }
  }

  // 3. تغيير لغة التطبيق
  void toggleLanguage() {
    _langCode = _langCode == 'en' ? 'ar' : 'en';
    notifyListeners();
  }
}