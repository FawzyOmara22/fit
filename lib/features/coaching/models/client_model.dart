enum ClientStatus { needsReview, onTrack, inactive }

enum ConsistencyLevel { high, stable, low }

class ClientDashboardModel {
  final int activeClientsCount;
  final String activeClientsSub;
  final int pendingReviewsCount;
  final String pendingReviewsSub;
  final List<ClientModel> clients;

  ClientDashboardModel({
    required this.activeClientsCount,
    required this.activeClientsSub,
    required this.pendingReviewsCount,
    required this.pendingReviewsSub,
    required this.clients,
  });

  factory ClientDashboardModel.fromJson(Map<String, dynamic> json) {
    return ClientDashboardModel(
      activeClientsCount: json['activeClientsCount'] ?? 0,
      activeClientsSub: json['activeClientsSub'] ?? '',
      pendingReviewsCount: json['pendingReviewsCount'] ?? 0,
      pendingReviewsSub: json['pendingReviewsSub'] ?? '',
      clients:
          (json['clients'] as List<dynamic>?)
              ?.map((e) => ClientModel.fromJson(e))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'activeClientsCount': activeClientsCount,
      'activeClientsSub': activeClientsSub,
      'pendingReviewsCount': pendingReviewsCount,
      'pendingReviewsSub': pendingReviewsSub,
      'clients': clients.map((e) => e.toJson()).toList(),
    };
  }
}

class ClientModel {
  final String id;
  final String name;
  final String avatarUrl;
  final ClientStatus status;
  final bool hasAlert; // النقطة الحمراء على الصورة
  final String latestActivityTitle;
  final String timeAgo;
  final double? progress; // شريط التقدم (من 0.0 لـ 1.0) لو null مش هيظهر
  final ConsistencyLevel consistency;

  ClientModel({
    required this.id,
    required this.name,
    required this.avatarUrl,
    required this.status,
    this.hasAlert = false,
    required this.latestActivityTitle,
    required this.timeAgo,
    this.progress,
    required this.consistency,
  });

  factory ClientModel.fromJson(Map<String, dynamic> json) {
    return ClientModel(
      id: json['id']?.toString() ?? '',
      name: json['name'] ?? '',
      avatarUrl: json['avatarUrl'] ?? '',
      status: _statusFromString(json['status']),
      hasAlert: json['hasAlert'] ?? false,
      latestActivityTitle: json['latestActivityTitle'] ?? '',
      timeAgo: json['timeAgo'] ?? '',
      progress: (json['progress'] as num?)?.toDouble(),
      consistency: _consistencyFromString(json['consistency']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'avatarUrl': avatarUrl,
      'status': status.name,
      'hasAlert': hasAlert,
      'latestActivityTitle': latestActivityTitle,
      'timeAgo': timeAgo,
      'progress': progress,
      'consistency': consistency.name,
    };
  }

  static ClientStatus _statusFromString(String? val) {
    switch (val?.toLowerCase()) {
      case 'on_track':
        return ClientStatus.onTrack;
      case 'inactive':
        return ClientStatus.inactive;
      case 'needs_review':
      default:
        return ClientStatus.needsReview;
    }
  }

  static ConsistencyLevel _consistencyFromString(String? val) {
    switch (val?.toLowerCase()) {
      case 'stable':
        return ConsistencyLevel.stable;
      case 'low':
        return ConsistencyLevel.low;
      case 'high':
      default:
        return ConsistencyLevel.high;
    }
  }
}
