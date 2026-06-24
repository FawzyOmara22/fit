import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // 👈 ضروري عشان الـ HapticFeedback (الاهتزاز)
import 'package:shared_preferences/shared_preferences.dart'; // 👈 ضروري للحفظ في الذاكرة
import 'package:audioplayers/audioplayers.dart'; // 👈 ضروري لتشغيل الصوت

class WorkoutProvider extends ChangeNotifier {
  // إعدادات الراحة الافتراضية
  int _defaultRestSeconds = 90; 
  bool _autoStartTimer = true;
  bool _soundAlerts = false;
  bool _hapticFeedback = true;

  // متغيرات التايمر الشغال حالياً
  int _currentRemainingSeconds = 90;
  Timer? _timer;
  bool _isResting = false;

  // Getters
  int get defaultRestSeconds => _defaultRestSeconds;
  bool get autoStartTimer => _autoStartTimer;
  bool get soundAlerts => _soundAlerts;
  bool get hapticFeedback => _hapticFeedback;
  int get currentRemainingSeconds => _currentRemainingSeconds;
  bool get isResting => _isResting;

  String get formattedDefaultRestTime {
    int minutes = _defaultRestSeconds ~/ 60;
    int seconds = _defaultRestSeconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')} Rest';
  }

  String get formattedRemainingTime {
    int minutes = _currentRemainingSeconds ~/ 60;
    int seconds = _currentRemainingSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  // 1. أول ما البروفايدر يشتغل، بنقرا الداتا المتسجلة في الموبايل
  WorkoutProvider() {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    _defaultRestSeconds = prefs.getInt('restSeconds') ?? 90;
    _autoStartTimer = prefs.getBool('autoStart') ?? true;
    _soundAlerts = prefs.getBool('soundAlerts') ?? false;
    _hapticFeedback = prefs.getBool('hapticFeedback') ?? true;
    _currentRemainingSeconds = _defaultRestSeconds;
    notifyListeners();
  }

  // 2. دالة حفظ الإعدادات في المتغيرات وفي ذاكرة الموبايل
  Future<void> saveRestSettings({
    required int seconds,
    required bool autoStart,
    required bool sound,
    required bool haptic,
  }) async {
    _defaultRestSeconds = seconds;
    _autoStartTimer = autoStart;
    _soundAlerts = sound;
    _hapticFeedback = haptic;
    _currentRemainingSeconds = seconds;

    notifyListeners(); // نحدث الشاشة الأول عشان اليوزر ميحسش بتأخير

    // الحفظ الفعلي في الذاكرة
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('restSeconds', seconds);
    await prefs.setBool('autoStart', autoStart);
    await prefs.setBool('soundAlerts', sound);
    await prefs.setBool('hapticFeedback', haptic);
  }

  // 3. دالة بدء عداد الراحة
  void startRestTimer() {
    _isResting = true;
    _currentRemainingSeconds = _defaultRestSeconds; 
    _timer?.cancel(); 

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_currentRemainingSeconds > 0) {
        _currentRemainingSeconds--;
        notifyListeners(); 
      } else {
        _onTimerFinished(); // 👈 لما الوقت يخلص نستدعي دالة التنبيهات
        stopRestTimer(); 
      }
    });
    notifyListeners();
  }

  // 4. دالة التنبيهات (الاهتزاز والصوت) بعد التحديث
  void _onTimerFinished() {
    // 1. الاهتزاز
    if (_hapticFeedback) {
      HapticFeedback.heavyImpact(); // اهتزاز قوي وملموس
    }

    // 2. الصوت
    if (_soundAlerts) {
      // 👈 التعديل هنا: حطينا اسم ملفك بالظبط بالصيغة بتاعته (.wav)
      final player = AudioPlayer();
      player.play(AssetSource('sounds/mixkit-bell-notification-933.wav'));
    }
  }

  void stopRestTimer() {
    _isResting = false;
    _timer?.cancel();
    _currentRemainingSeconds = _defaultRestSeconds; 
    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}