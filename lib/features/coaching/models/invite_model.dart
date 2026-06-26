class InviteRequestModel {
  final String contactInfo; // Email or Phone
  final String programId;   // e.g., 'hypertrophy_101', 'pure_strength', 'empty_template'

  InviteRequestModel({
    required this.contactInfo,
    required this.programId,
  });

  // تحويل البيانات من JSON (لو هتستقبل داتا من الباك إند)
  factory InviteRequestModel.fromJson(Map<String, dynamic> json) {
    return InviteRequestModel(
      contactInfo: json['contact_info'] ?? '',
      programId: json['program_id'] ?? '',
    );
  }

  // تحويل البيانات إلى JSON عشان تتبعت للـ API
  Map<String, dynamic> toJson() {
    return {
      'contact_info': contactInfo,
      'program_id': programId,
    };
  }
}