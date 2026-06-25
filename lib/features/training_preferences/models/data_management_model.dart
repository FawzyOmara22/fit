class DataManagementSettings {
  bool isCloudSyncEnabled;
  String lastBackupDate;

  DataManagementSettings({
    required this.isCloudSyncEnabled,
    required this.lastBackupDate,
  });

  factory DataManagementSettings.fromJson(Map<String, dynamic> json) {
    return DataManagementSettings(
      isCloudSyncEnabled: json['is_cloud_sync_enabled'] ?? true,
      lastBackupDate: json['last_backup_date'] ?? 'Today, 08:42 AM',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'is_cloud_sync_enabled': isCloudSyncEnabled,
      'last_backup_date': lastBackupDate,
    };
  }
}