import 'package:flutter/material.dart';
import 'package:kinetic/features/coaching/models/invite_model.dart';

class InviteProvider extends ChangeNotifier {
  // 0: Hypertrophy, 1: Pure Strength, 2: Empty
  int _selectedProgramIndex = 0; 
  final TextEditingController emailController = TextEditingController();
  bool _isLoading = false;

  int get selectedProgramIndex => _selectedProgramIndex;
  bool get isLoading => _isLoading;

  void selectProgram(int index) {
    _selectedProgramIndex = index;
    notifyListeners();
  }

  // دالة مساعدة لتحويل الـ Index لـ Program ID للباك إند
  String _getProgramId(int index) {
    switch (index) {
      case 0:
        return 'hypertrophy_101';
      case 1:
        return 'pure_strength';
      case 2:
        return 'empty_template';
      default:
        return 'hypertrophy_101';
    }
  }

  // دالة إرسال الدعوة للـ API
  Future<void> sendInvitationToApi() async {
    final contactInfo = emailController.text.trim();
    
    if (contactInfo.isEmpty) {
      // هنا ممكن تضيف Logic لإظهار رسالة خطأ للمستخدم
      return;
    }

    _isLoading = true;
    notifyListeners();

    // 1. تجهيز الموديل
    final requestModel = InviteRequestModel(
      contactInfo: contactInfo,
      programId: _getProgramId(_selectedProgramIndex),
    );

    try {
      // 2. محاكاة إرسال البيانات للـ API
      print('Sending Data to API: ${requestModel.toJson()}');
      await Future.delayed(const Duration(seconds: 2)); // محاكاة وقت التحميل
      
      // هنا هتحط كود الـ HTTP Request الفعلي بتاعك
      // await apiService.post('/invite', data: requestModel.toJson());

      // نجاح الإرسال (ممكن تفضي الحقل بعدها)
      emailController.clear();
      
    } catch (e) {
      print('Error sending invitation: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}