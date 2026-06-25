class SubscriptionPlanModel {
  final String id;
  final String titleKey; // مفتاح الترجمة للاسم
  final String trialTextKey;
  final double price;
  final double pricePerMonth;
  final bool isBestValue;

  SubscriptionPlanModel({
    required this.id,
    required this.titleKey,
    required this.trialTextKey,
    required this.price,
    required this.pricePerMonth,
    this.isBestValue = false,
  });

  // استقبال البيانات من API
  factory SubscriptionPlanModel.fromJson(Map<String, dynamic> json) {
    return SubscriptionPlanModel(
      id: json['id'].toString(),
      titleKey: json['titleKey'] ?? '',
      trialTextKey: json['trialTextKey'] ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      pricePerMonth: (json['pricePerMonth'] as num?)?.toDouble() ?? 0.0,
      isBestValue: json['isBestValue'] ?? false,
    );
  }

  // إرسال البيانات إلى API (مثلاً عند تأكيد الشراء)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'price': price,
      // يمكن إضافة تفاصيل أخرى يحتاجها الباك اند
    };
  }
}