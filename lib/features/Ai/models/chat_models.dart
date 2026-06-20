enum MessageSender { ai, user }

// ==========================================
// 1. Data Model for the embedded stats card
// ==========================================
class DeltaStatsModel {
  final String volume; // مثال: "42.5k"
  final String intensityShift; // مثال: "+18%"

  DeltaStatsModel({
    required this.volume,
    required this.intensityShift,
  });

  factory DeltaStatsModel.fromJson(Map<String, dynamic> json) {
    return DeltaStatsModel(
      volume: json['volume']?.toString() ?? '',
      intensityShift: json['intensityShift']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'volume': volume,
      'intensityShift': intensityShift,
    };
  }
}

// ==========================================
// 2. Chat Message Model ready for API
// ==========================================
class ChatMessageModel {
  final String id;
  final String text;
  final MessageSender sender;
  final String time;
  final String senderName;
  final DeltaStatsModel? embeddedStats; // 👈 استبدلنا الويدجت ببيانات الموديل
  final String? secondaryText;

  ChatMessageModel({
    required this.id,
    required this.text,
    required this.sender,
    required this.time,
    required this.senderName,
    this.embeddedStats,
    this.secondaryText,
  });

  // استقبال البيانات من الـ API
  factory ChatMessageModel.fromJson(Map<String, dynamic> json) {
    return ChatMessageModel(
      id: json['id']?.toString() ?? '',
      text: json['text'] ?? '',
      sender: _getSenderFromString(json['sender'] ?? ''),
      time: json['time'] ?? '',
      senderName: json['senderName'] ?? '',
      // لو الـ API باعت بيانات للكارت، هنحولها، لو مفيش هتبقى null
      embeddedStats: json['embeddedStats'] != null
          ? DeltaStatsModel.fromJson(json['embeddedStats'])
          : null,
      secondaryText: json['secondaryText'],
    );
  }

  // إرسال البيانات للـ API
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'sender': sender.name, // بيحول הـ Enum لـ String ('ai' أو 'user')
      'time': time,
      'senderName': senderName,
      'embeddedStats': embeddedStats?.toJson(),
      'secondaryText': secondaryText,
    };
  }

  // Helper Method لتحويل النص لـ Enum
  static MessageSender _getSenderFromString(String senderStr) {
    if (senderStr.toLowerCase() == 'user') {
      return MessageSender.user;
    }
    return MessageSender.ai;
  }
}