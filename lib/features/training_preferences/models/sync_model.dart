enum SyncState { synced, syncing, pending }

class SyncServiceModel {
  final String id;
  final String titleKey;
  final String subtitleKey;
  final SyncState state;

  SyncServiceModel({
    required this.id,
    required this.titleKey,
    required this.subtitleKey,
    this.state = SyncState.synced,
  });

  SyncServiceModel copyWith({
    SyncState? state,
    String? subtitleKey,
  }) {
    return SyncServiceModel(
      id: id,
      titleKey: titleKey,
      subtitleKey: subtitleKey ?? this.subtitleKey, // ضفتها عشان تقدر تحدث النص وقت المزامنة
      state: state ?? this.state,
    );
  }

  // ==========================================
  // استقبال البيانات من الـ API (From JSON)
  // ==========================================
  factory SyncServiceModel.fromJson(Map<String, dynamic> json) {
    return SyncServiceModel(
      id: json['id']?.toString() ?? '',
      titleKey: json['titleKey'] ?? '',
      subtitleKey: json['subtitleKey'] ?? '',
      state: _syncStateFromString(json['state'] ?? ''),
    );
  }

  // ==========================================
  // إرسال البيانات إلى الـ API (To JSON)
  // ==========================================
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titleKey': titleKey,
      'subtitleKey': subtitleKey,
      'state': state.name, // هترجع 'synced' أو 'syncing' أو 'pending'
    };
  }

  // دالة مساعدة لتحويل النص الجاي من الـ API إلى Enum
  static SyncState _syncStateFromString(String state) {
    switch (state.toLowerCase()) {
      case 'syncing':
        return SyncState.syncing;
      case 'pending':
        return SyncState.pending;
      case 'synced':
      default:
        return SyncState.synced;
    }
  }
}

class ActivityModel {
  final String titleKey;
  final String subtitleKey;
  final bool isActive;

  ActivityModel({
    required this.titleKey,
    required this.subtitleKey,
    this.isActive = true,
  });

  // ==========================================
  // استقبال البيانات من الـ API (From JSON)
  // ==========================================
  factory ActivityModel.fromJson(Map<String, dynamic> json) {
    return ActivityModel(
      titleKey: json['titleKey'] ?? '',
      subtitleKey: json['subtitleKey'] ?? '',
      isActive: json['isActive'] ?? true, // افتراضي true لو مجاش قيمة
    );
  }

  // ==========================================
  // إرسال البيانات إلى الـ API (To JSON)
  // ==========================================
  Map<String, dynamic> toJson() {
    return {
      'titleKey': titleKey,
      'subtitleKey': subtitleKey,
      'isActive': isActive,
    };
  }
}