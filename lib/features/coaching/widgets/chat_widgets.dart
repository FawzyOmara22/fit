import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/coaching/models/chat_message_model.dart';
import 'package:kinetic/features/coaching/provider/chat_provider.dart';

class ChatBubbleWidget extends StatelessWidget {
  final ChatMessageModel message;

  const ChatBubbleWidget({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isMe = message.sender == SenderType.me;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          if (message.dateLabel != null)
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 16),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.divider,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  _getDateLabelText(message.dateLabel!, l10n).toUpperCase(),
                  style: AppTextStyles.datePill,
                ),
              ),
            ),
            
          if (message.type == MessageType.text)
            Container(
              constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isMe ? null : AppColors.white,
                gradient: isMe ? AppColors.primaryGradient : null,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(16),
                  topRight: const Radius.circular(16),
                  bottomLeft: Radius.circular(isMe ? 16 : 0),
                  bottomRight: Radius.circular(isMe ? 0 : 16),
                ),
                boxShadow: [
                  if (!isMe)
                    const BoxShadow(
                      color: AppColors.darkCharcoal5,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    )
                ],
              ),
              child: Text(
                message.text,
                style: isMe ? AppTextStyles.body16.copyWith(color: AppColors.white) : AppTextStyles.aiMessage,
              ),
            ),

          if (message.type == MessageType.formCheck)
            const FormCheckCardWidget(),

          if (message.type == MessageType.routine)
            const RoutineCardWidget(),
        ],
      ),
    );
  }

  String _getDateLabelText(String label, AppLocalizations l10n) {
    if (label == 'yesterday') return l10n.yesterday;
    if (label == 'today') return l10n.today;
    return label;
  }
}

class FormCheckCardWidget extends StatelessWidget {
  const FormCheckCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: AppColors.darkCharcoal5, blurRadius: 10, offset: Offset(0, 4))
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.primary, width: 3),
            ),
            child: const Center(
              child: Text('92%', style: AppTextStyles.cardTitle14),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(l10n.form_check_result.toUpperCase(), style: AppTextStyles.label10Blue),
                const SizedBox(height: 4),
                const Text('Barbell Bench Press', style: AppTextStyles.cardTitle14),
                const SizedBox(height: 2),
                Text(l10n.excellent_pathing, style: AppTextStyles.cardSubtitle13),
              ],
            ),
          ),
          const Icon(Icons.bar_chart, color: AppColors.borderGrey),
        ],
      ),
    );
  }
}

class RoutineCardWidget extends StatelessWidget {
  const RoutineCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.divider),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(l10n.new_routine_assigned.toUpperCase(), style: AppTextStyles.label10Blue),
              const Icon(Icons.fitness_center, color: AppColors.primary, size: 20),
            ],
          ),
          const SizedBox(height: 8),
          const Text('Hypertrophy Push A', style: AppTextStyles.cardTitle18),
          const SizedBox(height: 16),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('75', style: AppTextStyles.cardTitle18),
                  Text(l10n.min.toUpperCase(), style: AppTextStyles.label10Grey),
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                width: 1,
                height: 30,
                color: AppColors.divider,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('8', style: AppTextStyles.cardTitle18),
                  Text(l10n.exercises.toUpperCase(), style: AppTextStyles.label10Grey),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(l10n.view_details.toUpperCase(), style: AppTextStyles.label10Blue),
            ),
          ),
        ],
      ),
    );
  }
}