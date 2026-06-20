// lib/features/permissions/data/permissions_api.dart

import 'dart:convert';
import 'package:http/http.dart' as http;

// =====================================
// 1. الـ Model
// =====================================
class PermissionsModel {
  final bool cameraEnabled;
  final bool healthEnabled;
  final bool notificationsEnabled;

  PermissionsModel({
    required this.cameraEnabled,
    required this.healthEnabled,
    required this.notificationsEnabled,
  });

  // استقبال البيانات من الـ API (تمت إضافتها لتطابق أسلوبك)
  factory PermissionsModel.fromJson(Map<String, dynamic> json) {
    return PermissionsModel(
      cameraEnabled: json['camera'] ?? false,
      healthEnabled: json['health_data'] ?? false,
      notificationsEnabled: json['notifications'] ?? false,
    );
  }

  // إرسال البيانات للـ API
  Map<String, dynamic> toJson() {
    return {
      'camera': cameraEnabled,
      'health_data': healthEnabled,
      'notifications': notificationsEnabled,
    };
  }
}

// =====================================
// 2. الـ API Service
// =====================================
class PermissionsApiService {
  static const String apiUrl = "https://your-api-url.com/api/permissions";

  // دالة إرسال الصلاحيات للـ API
  Future<bool> sendPermissions(PermissionsModel data) async {
    try {
      // محاكاة إرسال البيانات للـ API (تقدر تفعل الكود ده لما الـ API يكون جاهز)
      /*
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data.toJson()),
      );
      return response.statusCode == 200 || response.statusCode == 201;
      */
      
      // تأخير وهمي للتجربة
      await Future.delayed(const Duration(seconds: 2));
      print("Data Sent: ${data.toJson()}");
      return true; // نجاح العملية
    } catch (e) {
      print("Error sending permissions: $e");
      return false;
    }
  }

  // دالة اختيارية: لو حبيت تجيب حالة الصلاحيات من الـ API في المستقبل
  Future<PermissionsModel?> fetchPermissions() async {
    try {
      /*
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        return PermissionsModel.fromJson(data);
      }
      return null;
      */
      
      // محاكاة استرجاع البيانات
      await Future.delayed(const Duration(seconds: 1));
      return PermissionsModel(
        cameraEnabled: true,
        healthEnabled: false,
        notificationsEnabled: true,
      );
    } catch (e) {
      print("Error fetching permissions: $e");
      return null;
    }
  }
}