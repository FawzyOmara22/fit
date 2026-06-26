enum SenderType { me, athlete }
enum MessageType { text, formCheck, routine }

class ChatMessageModel {
  final String id;
  final String text;
  final SenderType sender;
  final MessageType type;
  final String? dateLabel; // To show "YESTERDAY" or "TODAY"
  final Map<String, dynamic>? extraData; // For Routine or Form Check data

  ChatMessageModel({
    required this.id,
    required this.text,
    required this.sender,
    this.type = MessageType.text,
    this.dateLabel,
    this.extraData,
  });

  // Factory to parse from API JSON
  factory ChatMessageModel.fromJson(Map<String, dynamic> json) {
    return ChatMessageModel(
      id: json['id'],
      text: json['text'] ?? '',
      sender: json['sender_id'] == 'my_id' ? SenderType.me : SenderType.athlete,
      type: MessageType.values.firstWhere(
        (e) => e.toString().split('.').last == json['type'],
        orElse: () => MessageType.text,
      ),
      dateLabel: json['date_label'],
      extraData: json['extra_data'],
    );
  }

  // Convert to JSON to send to API
  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'sender_id': sender == SenderType.me ? 'my_id' : 'athlete_id',
      'type': type.toString().split('.').last,
      if (extraData != null) 'extra_data': extraData,
    };
  }
}