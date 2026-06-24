import 'package:flutter/material.dart';

class TrainProvider extends ChangeNotifier {
  int _currentStreak = 0;
  int _bestStreak = 0;
  double _monthlyVolume = 0.0;
  List<bool> _last7DaysActivity = List.generate(7, (index) => false);

  int get currentStreak => _currentStreak;
  int get bestStreak => _bestStreak;
  double get monthlyVolume => _monthlyVolume;
  List<bool> get last7DaysActivity => _last7DaysActivity;

  // الدالة دي هنناديها أول ما الشاشة تفتح عشان تجيب الداتا
  void loadTrainingStats() {
    // هنا مستقبلاً هتعمل استدعاء للـ API 
    // دي داتا مؤقتة للتجربة
    _monthlyVolume = 50; 
    _currentStreak = 3; 
    _bestStreak = 1;    
    _last7DaysActivity = [true, true, true, true, true, true, true]; // 7 أيام متواصلة

    // تحديث الشاشة
    notifyListeners();
  }
}