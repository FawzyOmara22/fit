import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _currentLocale = const Locale('en'); // اللغة الافتراضية إنجليزي

  Locale get currentLocale => _currentLocale;

  void changeLanguage(String languageCode) {
    if (_currentLocale.languageCode == languageCode) return;
    _currentLocale = Locale(languageCode);
    notifyListeners(); 
  }
}