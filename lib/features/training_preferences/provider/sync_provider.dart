import 'package:flutter/material.dart';
import 'package:kinetic/features/training_preferences/models/sync_model.dart';


class SyncProvider extends ChangeNotifier {
  bool isSyncingAll = false;

  // محاكاة للخدمات القادمة من الـ API
  List<SyncServiceModel> services = [
    SyncServiceModel(id: '1', titleKey: 'appleHealth', subtitleKey: 'syncedAgo', state: SyncState.synced),
    SyncServiceModel(id: '2', titleKey: 'strava', subtitleKey: 'syncing', state: SyncState.syncing),
    SyncServiceModel(id: '3', titleKey: 'googleDriveBackup', subtitleKey: 'lastBackup', state: SyncState.pending),
  ];

  // محاكاة للنشاطات الأخيرة
  List<ActivityModel> activities = [
    ActivityModel(titleKey: 'exportedWorkoutStrava', subtitleKey: 'morningRun', isActive: true),
    ActivityModel(titleKey: 'pulledHeartRate', subtitleKey: 'backgroundSync', isActive: true),
    ActivityModel(titleKey: 'autoBackupCompleted', subtitleKey: 'cloudStorage', isActive: false),
  ];

  // دالة زر المزامنة الرئيسي
  Future<void> syncAllData() async {
    isSyncingAll = true;
    
    // تحويل كل الخدمات إلى حالة المزامنة
    services = services.map((s) => s.copyWith(state: SyncState.syncing)).toList();
    notifyListeners();

    // محاكاة الاتصال بالـ API
    await Future.delayed(const Duration(seconds: 3));

    // إرجاعها لحالة الاكتمال
    services = services.map((s) {
      if (s.id == '2') return s.copyWith(state: SyncState.synced, subtitleKey: 'syncedAgo'); // تعديل سترافا
      return s.copyWith(state: SyncState.synced);
    }).toList();
    
    isSyncingAll = false;
    notifyListeners();
  }
}