import 'package:flutter/material.dart';
import 'package:kinetic/features/coaching/models/notification_model.dart';


class NotificationsProvider extends ChangeNotifier {
  int _selectedFilterIndex = 0; 
  List<NotificationModel> _notifications = [];
  bool _isLoading = false;

  int get selectedFilterIndex => _selectedFilterIndex;
  bool get isLoading => _isLoading;

  // جلب الإشعارات المفروضة حسب الفلتر
  List<NotificationModel> get filteredNotifications {
    if (_selectedFilterIndex == 1) {
      return _notifications.where((n) => n.type == NotificationType.workout || n.type == NotificationType.plan).toList();
    } else if (_selectedFilterIndex == 2) {
      return _notifications.where((n) => n.type == NotificationType.message || n.type == NotificationType.analysis).toList();
    }
    return _notifications;
  }

  // دالة لجلب الإشعارات من الـ API
  Future<void> fetchNotifications() async {
    _isLoading = true;
    notifyListeners();

    try {
      // هنا هتحط الـ HTTP Request الفعلي بتاعك
      // final response = await apiService.get('/notifications');
      // final List dynamicData = response.data;
      // _notifications = dynamicData.map((json) => NotificationModel.fromJson(json)).toList();

      // محاكاة استجابة الـ API (Mock Data)
      await Future.delayed(const Duration(seconds: 1)); // وقت التحميل
      
      final mockApiResponse = [
        {"id": "1", "type": "workout", "is_unread": true, "created_at": "2026-06-26T14:15:22Z"},
        {"id": "2", "type": "analysis", "is_unread": false, "created_at": "2026-06-26T13:20:00Z"},
        {"id": "3", "type": "message", "is_unread": true, "created_at": "2026-06-26T11:00:00Z"},
        {"id": "4", "type": "achievement", "is_unread": false, "created_at": "2026-06-26T08:00:00Z", "payload": {"weight": "5kg"}},
        {"id": "5", "type": "plan", "is_unread": false, "created_at": "2026-06-25T10:00:00Z"}
      ];

      _notifications = mockApiResponse.map((json) => NotificationModel.fromJson(json)).toList();

    } catch (e) {
      print('Error fetching notifications: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // دالة لتحديث حالة الإشعار (مقروء) وإرسالها للـ API
  Future<void> markAsRead(String id) async {
    final index = _notifications.indexWhere((n) => n.id == id);
    if (index != -1 && _notifications[index].isUnread) {
      // تحديث محلي عشان الـ UI يستجيب بسرعة
      _notifications[index].isUnread = false;
      notifyListeners();

      try {
        // إرسال التحديث للـ API
        // await apiService.put('/notifications/$id/read');
        print('Notification $id marked as read in API');
      } catch (e) {
        // لو حصل مشكلة نرجعها زي ما كانت
        _notifications[index].isUnread = true;
        notifyListeners();
        print('Failed to mark as read: $e');
      }
    }
  }

  void setFilter(int index) {
    _selectedFilterIndex = index;
    notifyListeners();
  }
}