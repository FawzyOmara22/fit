import 'package:flutter/material.dart';
import 'package:kinetic/features/coaching/models/chat_message_model.dart';


class ChatProvider extends ChangeNotifier {
  List<ChatMessageModel> _messages = [];
  bool _isLoading = false;

  List<ChatMessageModel> get messages => _messages;
  bool get isLoading => _isLoading;

  // Mock Fetch Data from API
  Future<void> fetchMessages() async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1)); // Mock API delay

    // Initial Data based on your image
    _messages = [
      ChatMessageModel(
        id: '1',
        text: 'Hey Coach, just finished the upper body session. Feeling a bit of a pinch in my left shoulder during the bench press sets.',
        sender: SenderType.athlete,
        dateLabel: 'yesterday', // JSON Key
      ),
      ChatMessageModel(
        id: '2',
        text: 'Understood, Marcus. Let\'s back off the weight by 10% for now. Can you send over a video of your last set for a form check?',
        sender: SenderType.me,
      ),
      ChatMessageModel(
        id: '3',
        text: 'Here is the footage from this morning\'s session. Tried to focus on the elbow tuck.',
        sender: SenderType.athlete,
        dateLabel: 'today', // JSON Key
      ),
      ChatMessageModel(
        id: '4',
        text: '', // Empty text because it's a card
        sender: SenderType.athlete,
        type: MessageType.formCheck,
        extraData: {
          'score': '92',
          'title': 'Barbell Bench Press',
        },
      ),
      ChatMessageModel(
        id: '5',
        text: 'Form looks solid. I think the pinch is coming from a lack of scapular retraction. I\'ve updated your routine to include a focus on this.',
        sender: SenderType.me,
      ),
      ChatMessageModel(
        id: '6',
        text: '',
        sender: SenderType.me,
        type: MessageType.routine,
        extraData: {
          'title': 'Hypertrophy Push A',
          'min': '75',
          'exercises': '8',
        },
      ),
    ];

    _isLoading = false;
    notifyListeners();
  }

  // Send message to API
  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;

    final newMessage = ChatMessageModel(
      id: DateTime.now().toString(),
      text: text,
      sender: SenderType.me,
    );

    // Add locally for instant UI update
    _messages.add(newMessage);
    notifyListeners();

    // Mock API Call here
    // await apiService.postMessage(newMessage.toJson());
  }
}