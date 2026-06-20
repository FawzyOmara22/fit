import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart'; // تأكد من المسار
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/Ai/models/chat_models.dart';
import 'package:kinetic/features/Ai/widgets/chat_widgets.dart';


class CoachChatScreen extends StatefulWidget {
  const CoachChatScreen({Key? key}) : super(key: key);

  @override
  State<CoachChatScreen> createState() => _CoachChatScreenState();
}

class _CoachChatScreenState extends State<CoachChatScreen> {
  
  List<ChatMessageModel> _getMockMessages(AppLocalizations l10n) {
    return [
      ChatMessageModel(
        id: '1',
        text: l10n.mock_ai_msg_1,
        sender: MessageSender.ai,
        time: '09:41 AM',
        senderName: l10n.chat_coach_name,
      ),
      ChatMessageModel(
        id: '2',
        text: l10n.mock_user_msg_1,
        sender: MessageSender.user,
        time: '09:43 AM',
        senderName: l10n.chat_sent,
      ),
      ChatMessageModel(
        id: '3',
        text: l10n.mock_ai_msg_2_p1,
        secondaryText: l10n.mock_ai_msg_2_p2,
        
        // 👈 التعديل الأهم: باصينا بيانات الموديل عشان تبقى متوافقة مع الـ API
        embeddedStats: DeltaStatsModel(
          volume: '42.5k',
          intensityShift: '+18%',
        ),
        
        sender: MessageSender.ai,
        time: '09:44 AM',
        senderName: l10n.chat_coach_name,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final messages = _getMockMessages(l10n);

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9FB),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9F9FB),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF2D2E33)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            const CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage('https://images.unsplash.com/photo-1599566150163-29194dcaad36?auto=format&fit=crop&w=100&q=80'), 
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(l10n.chat_coach_name, style: AppTextStyles.coachName),
                Row(
                  children: [
                    Container(width: 6, height: 6, decoration: const BoxDecoration(color: Colors.green, shape: BoxShape.circle)),
                    const SizedBox(width: 4),
                    Text(l10n.chat_online, style: AppTextStyles.onlineStatus),
                  ],
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined, color: Color(0xFFADACB2)),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              children: [
                // Date Pill (TODAY)
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE5E5EA).withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(l10n.chat_today, style: AppTextStyles.datePill),
                  ),
                ),
                const SizedBox(height: 24),
                
                // رسم رسائل الشات
                ...messages.map((msg) => ChatBubble(message: msg)).toList(),
              ],
            ),
          ),
          // الـ Input Bar من تحت
          const ChatInputArea(),
        ],
      ),
    );
  }
}