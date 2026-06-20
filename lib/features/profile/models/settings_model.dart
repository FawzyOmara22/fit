class SettingsModel {
  final UserProfileModel userProfile;
  final WorkoutSettingsModel workoutSettings;
  final PreferencesModel preferences;
  final NotificationsModel notifications;

  SettingsModel({
    required this.userProfile,
    required this.workoutSettings,
    required this.preferences,
    required this.notifications,
  });

  // مثال لبيانات مبدئية لو لسه الـ API مجهزتوش
  factory SettingsModel.defaultSettings() {
    return SettingsModel(
      userProfile: UserProfileModel(
        name: 'Alex Grayson',
        email: 'alex.grayson@kinetic.app',
        profileImageUrl: 'https://i.pravatar.cc/150?img=11',
      ),
      workoutSettings: WorkoutSettingsModel(
        isKg: true,
        plateCalcEnabled: true,
        lockScreenEnabled: false,
      ),
      preferences: PreferencesModel(
        appearance: 'System Default', // الأفضل يكون enum بعدين
        language: 'English (US)',
      ),
      notifications: NotificationsModel(
        pushNotifEnabled: true,
        workoutRemindersEnabled: true,
        coachMessagesEnabled: true,
        socialActivityEnabled: false,
      ),
    );
  }
}

class UserProfileModel {
  final String name;
  final String email;
  final String profileImageUrl;

  UserProfileModel({required this.name, required this.email, required this.profileImageUrl});
}

class WorkoutSettingsModel {
  bool isKg;
  bool plateCalcEnabled;
  bool lockScreenEnabled;

  WorkoutSettingsModel({required this.isKg, required this.plateCalcEnabled, required this.lockScreenEnabled});
}

class PreferencesModel {
  final String appearance;
  final String language;

  PreferencesModel({required this.appearance, required this.language});
}

class NotificationsModel {
  bool pushNotifEnabled;
  bool workoutRemindersEnabled;
  bool coachMessagesEnabled;
  bool socialActivityEnabled;

  NotificationsModel({
    required this.pushNotifEnabled,
    required this.workoutRemindersEnabled,
    required this.coachMessagesEnabled,
    required this.socialActivityEnabled,
  });
}