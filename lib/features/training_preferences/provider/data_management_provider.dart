import 'package:flutter/material.dart';
import 'package:kinetic/features/training_preferences/models/data_management_model.dart';


class DataManagementProvider extends ChangeNotifier {
  DataManagementSettings? _settings;
  bool _isLoading = true;

  DataManagementSettings? get settings => _settings;
  bool get isLoading => _isLoading;

  DataManagementProvider() {
    loadSettings();
  }

  Future<void> loadSettings() async {
    _isLoading = true;
    notifyListeners();

    // محاكاة جلب البيانات من السيرفر
    await Future.delayed(const Duration(seconds: 1));
    
    _settings = DataManagementSettings(
      isCloudSyncEnabled: true,
      lastBackupDate: 'Today, 08:42 AM',
    );

    _isLoading = false;
    notifyListeners();
  }

  void toggleCloudSync(bool value) {
    if (_settings == null) return;
    _settings!.isCloudSyncEnabled = value;
    notifyListeners();
  }

  void performBackup() async {
    // محاكاة عملية النسخ الاحتياطي
    final now = DateTime.now();
    _settings?.lastBackupDate = 'Today, ${now.hour}:${now.minute.toString().padLeft(2, '0')}';
    notifyListeners();
  }
}