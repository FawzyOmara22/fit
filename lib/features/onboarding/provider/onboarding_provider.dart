import 'package:flutter/material.dart';
import '../models/onboarding_data_model.dart';

class OnboardingProvider extends ChangeNotifier {
  final OnboardingDataModel _onboardingData = OnboardingDataModel();

  String? get primaryGoal => _onboardingData.primaryGoal;
  int? get birthYear => _onboardingData.birthYear; // 👈 قراءة سنة الميلاد

  
  // 👈 السطر الجديد عشان نقرأ النوع
  String? get gender => _onboardingData.gender; 
  // قراءة الوزن والوحدة
  double? get weight => _onboardingData.weight;
  String get weightUnit => _onboardingData.weightUnit;

  // قراءة الطول والوحدة
  int? get height => _onboardingData.height;
  String get heightUnit => _onboardingData.heightUnit;
  
  // قراءة مستوى الخبرة
  String? get experienceLevel => _onboardingData.experienceLevel;

  bool get hasNoInjuries => _onboardingData.hasNoInjuries;
  List<String> get affectedAreas => _onboardingData.affectedAreas;
  String? get injuryNotes => _onboardingData.injuryNotes;

  int? get daysPerWeek => _onboardingData.daysPerWeek;
  String get startOfWeek => _onboardingData.startOfWeek;
  String? get sessionLength => _onboardingData.sessionLength;
  // 👇 Getters جديدة للشاشة 9
  List<String> get availableEquipment => _onboardingData.availableEquipment;
  bool get addCardioFinishers => _onboardingData.addCardioFinishers;
  String get distanceUnit => _onboardingData.distanceUnit;
  // تحديث الهدف
  void setPrimaryGoal(String goal) {
    _onboardingData.primaryGoal = goal;
    notifyListeners();
  }

  // تحديث سنة الميلاد
  void setBirthYear(int year) {
    _onboardingData.birthYear = year;
    notifyListeners();
  }

  // 👈 الدالة الجديدة لتحديث النوع (دي اللي كانت عاملة الإيرور)
  void setGender(String value) {
    _onboardingData.gender = value;
    notifyListeners();
  }

  // تحديث الوزن
  void setWeight(double value) {
    _onboardingData.weight = value;
    notifyListeners();
  }

  // تحديث الوحدة (KG/LB)
  void setWeightUnit(String unit) {
    _onboardingData.weightUnit = unit;
    notifyListeners();
  }
  // تحديث الطول
  void setHeight(int value) {
    _onboardingData.height = value;
    notifyListeners();
  }

  // تحديث وحدة الطول (cm / ft/in)
  void setHeightUnit(String unit) {
    _onboardingData.heightUnit = unit;
    notifyListeners();
  }
  // تحديث مستوى الخبرة
  void setExperienceLevel(String level) {
    _onboardingData.experienceLevel = level;
    notifyListeners();
  }


   // دالة زرار "سليم تماماً"
  void toggleNoInjuries() {
    _onboardingData.hasNoInjuries = !_onboardingData.hasNoInjuries;
    // لو اختار إنه سليم، نمسح أي إصابات كان مختارها
    if (_onboardingData.hasNoInjuries) {
      _onboardingData.affectedAreas.clear();
      _onboardingData.injuryNotes = null;
    }
    notifyListeners();
  }

  // دالة اختيار الإصابات
  void toggleAffectedArea(String area) {
    if (_onboardingData.affectedAreas.contains(area)) {
      _onboardingData.affectedAreas.remove(area);
    } else {
      _onboardingData.affectedAreas.add(area);
    }
    // لو اختار أي إصابة، نلغي تلقائياً تفعيل زرار "سليم تماماً"
    if (_onboardingData.affectedAreas.isNotEmpty) {
      _onboardingData.hasNoInjuries = false;
    }
    notifyListeners();
  }

  void setInjuryNotes(String notes) {
    _onboardingData.injuryNotes = notes;
    notifyListeners();
  }

  // تحديث القيم
  void setDaysPerWeek(int days) {
    _onboardingData.daysPerWeek = days;
    notifyListeners();
  }

  void setStartOfWeek(String day) {
    _onboardingData.startOfWeek = day;
    notifyListeners();
  }

  void setSessionLength(String length) {
    _onboardingData.sessionLength = length;
    notifyListeners();
    }
    // دالة لاختيار أو إلغاء اختيار المعدات
  void toggleEquipment(String equipment) {
    if (_onboardingData.availableEquipment.contains(equipment)) {
      _onboardingData.availableEquipment.remove(equipment);
    } else {
      _onboardingData.availableEquipment.add(equipment);
    }
    notifyListeners();
  }

  // دالة لتغيير حالة زر الكارديو
  void toggleCardioFinishers(bool value) {
    _onboardingData.addCardioFinishers = value;
    notifyListeners();
  }
  void setDistanceUnit(String unit) {
    _onboardingData.distanceUnit = unit;
    notifyListeners();
  }
  
  Future<void> submitDataToApi() async {
    // API Call goes here
  }
}