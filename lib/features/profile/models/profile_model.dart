class ProfileModel {
  final String name;
  final String profileImageUrl;
  final bool isProMember;
  final bool isVerified;
  final int followers;
  final int following;
  final double totalVolume;
  final String volumeUnit;
  final int totalWorkouts;
  final int streakDays;
  final List<int> consistencyData; // أرقام من 0 لـ 4 عشان الـ Heatmap

  ProfileModel({
    required this.name,
    required this.profileImageUrl,
    required this.isProMember,
    required this.isVerified,
    required this.followers,
    required this.following,
    required this.totalVolume,
    required this.volumeUnit,
    required this.totalWorkouts,
    required this.streakDays,
    required this.consistencyData,
  });

  // دالة افتراضية لحد ما تربط الـ API
  factory ProfileModel.defaultProfile() {
    return ProfileModel(
      name: 'Abdelrhman Hossam Mohamed',
      profileImageUrl: 'https://i.pravatar.cc/150?img=11',
      isProMember: true,
      isVerified: true,
      followers: 1284,
      following: 492,
      totalVolume: 1.2,
      volumeUnit: 'M kg',
      totalWorkouts: 248,
      streakDays: 12,
      consistencyData: List.generate(100, (index) => index % 5),
    );
  }

  // الاستقبال من الـ API
  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      name: json['name'] ?? '',
      profileImageUrl: json['profile_image_url'] ?? '',
      isProMember: json['is_pro_member'] ?? false,
      isVerified: json['is_verified'] ?? false,
      followers: json['followers'] ?? 0,
      following: json['following'] ?? 0,
      totalVolume: (json['total_volume'] ?? 0).toDouble(),
      volumeUnit: json['volume_unit'] ?? '',
      totalWorkouts: json['total_workouts'] ?? 0,
      streakDays: json['streak_days'] ?? 0,
      consistencyData: List<int>.from(json['consistency_data'] ?? []),
    );
  }
}