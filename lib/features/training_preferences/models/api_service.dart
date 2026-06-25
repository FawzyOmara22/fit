// api_service.dart
import 'dart:convert';
import 'preferences_model.dart';

class PreferencesApiService {
  // محاكاة جلب البيانات من السيرفر (GET)
  Future<TrainingPreferences> fetchPreferences() async {
    await Future.delayed(const Duration(seconds: 1)); // تأخير ثانية
    
    // الداتا اللي راجعة من السيرفر
    String jsonString = '''
    {
      "default_rest_timer": 90,
      "weight_unit": "KG",
      "sound_effects": true,
      "auto_start_rest_timer": true,
      "auto_advance_exercises": false,
      "vibrate_on_completion": true,
      "default_barbell_weight": 20,
      "fractionals_enabled": true,
      "apple_health_connected": true
    }
    ''';
    
    return TrainingPreferences.fromJson(jsonDecode(jsonString));
  }

  // محاكاة إرسال تحديث للسيرفر (PUT / POST)
  Future<bool> updatePreferences(TrainingPreferences prefs) async {
    await Future.delayed(const Duration(milliseconds: 500));
    // هنا في الحقيقة بنستخدم http.post أو http.put
    print("تم إرسال التحديث للسيرفر: ${prefs.toJson()}");
    return true; // نجاح العملية
  }
}