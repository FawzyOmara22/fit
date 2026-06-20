import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart'; // تأكد من المسار
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/Ai/models/chat_models.dart';


// ==========================================
// 1. Chat Bubble Widget
// ==========================================
class ChatBubble extends StatelessWidget {
  final ChatMessageModel message;

  const ChatBubble({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isUser = message.sender == MessageSender.user;

    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.85),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isUser ? const Color(0xFF0058BB) : Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(20),
                topRight: const Radius.circular(20),
                bottomLeft: Radius.circular(isUser ? 20 : 4), 
                bottomRight: Radius.circular(isUser ? 4 : 20),
              ),
              boxShadow: isUser ? [] : [
                BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4))
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(message.text, style: isUser ? AppTextStyles.userMessage : AppTextStyles.aiMessage),
                
                // 👈 لو فيه بيانات كارت (Stats) جاية من الـ API، نرسم الويدجت ونديها البيانات
                if (message.embeddedStats != null) ...[
                  const SizedBox(height: 16),
                  DeltaStatsCard(stats: message.embeddedStats!), // باصينا الداتا هنا
                  const SizedBox(height: 16),
                ],
                
                // النص التكميلي بعد الكارت
                if (message.secondaryText != null)
                  Text(message.secondaryText!, style: AppTextStyles.aiMessage),
              ],
            ),
          ),
          const SizedBox(height: 6),
          Text(
            '${message.senderName} • ${message.time}',
            style: AppTextStyles.timestamp,
          ),
        ],
      ),
    );
  }
}

// ==========================================
// 2. Delta Stats Card (الكارت المدمج جوا رسالة الـ AI)
// ==========================================
class DeltaStatsCard extends StatelessWidget {
  final DeltaStatsModel stats; // 👈 استقبال البيانات هنا

  const DeltaStatsCard({Key? key, required this.stats}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Row(
      children: [
        // Volume Card
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F7FA),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(l10n.chat_weekly_volume, style: AppTextStyles.cardLabel),
                const SizedBox(height: 4),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(stats.volume, style: AppTextStyles.cardValueVolume), // 👈 استخدام البيانات من الموديل
                    const SizedBox(width: 4),
                    Text(l10n.chat_kg, style: AppTextStyles.cardUnit),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        // Intensity Shift Card
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F7FA),
              borderRadius: BorderRadius.circular(12),
              border: const Border(left: BorderSide(color: Color(0xFF0058BB), width: 3)), 
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(l10n.chat_intensity_shift, style: AppTextStyles.cardLabel),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.trending_up, color: Color(0xFF0058BB), size: 16),
                    const SizedBox(width: 4),
                    Text(stats.intensityShift, style: AppTextStyles.cardValueShift), // 👈 استخدام البيانات من الموديل
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ==========================================
// 3. Bottom Chat Input & Suggestions
// ==========================================
class ChatInputArea extends StatelessWidget {
  const ChatInputArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final suggestions = [l10n.chat_sugg_1, l10n.chat_sugg_2, l10n.chat_sugg_3];

    return Container(
      padding: const EdgeInsets.only(top: 12, bottom: 32, left: 20, right: 20),
      decoration: const BoxDecoration(
        color: Color(0xFFF9F9FB),
        border: Border(top: BorderSide(color: Color(0xFFE5E5EA), width: 1)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Suggestions Row
          SizedBox(
            height: 36,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: suggestions.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                return ActionChip(
                  label: Text(suggestions[index], style: AppTextStyles.suggestionChip),
                  backgroundColor: Colors.white,
                  side: const BorderSide(color: Color(0xFFE5E5EA)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  onPressed: () {},
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          // Input Field
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: const Color(0xFFE5E5EA)),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.add_circle_outline, color: Color(0xFF5B5B60)),
                  onPressed: () {},
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: l10n.chat_hint,
                      hintStyle: AppTextStyles.inputHint,
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(color: Color(0xFF3B82F6), shape: BoxShape.circle),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_upward, color: Colors.white, size: 20),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}