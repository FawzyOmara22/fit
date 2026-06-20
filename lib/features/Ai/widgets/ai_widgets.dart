import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart'; 
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/Ai/models/ai_models.dart';
import 'package:kinetic/features/Ai/pages/coach_chat_screen.dart';

// ==========================================
// 1. Welcome Card Widget
// ==========================================
class AIWelcomeCard extends StatelessWidget {
  const AIWelcomeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 20, offset: const Offset(0, 10)),
        ],
        gradient: const RadialGradient(
          center: Alignment.topRight,
          radius: 1.5,
          colors: [Color(0xFFEBF4FF), Colors.white],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.ai_intelligence_engine, style: AppTextStyles.sectionLabel),
          const SizedBox(height: 12),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(text: l10n.ai_welcome_to, style: AppTextStyles.welcomeTo),
                TextSpan(text: l10n.ai_kinetic, style: AppTextStyles.welcomeBrand),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Text(l10n.ai_subtitle, style: AppTextStyles.welcomeSubtitle),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CoachChatScreen(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF3B82F6),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              elevation: 0,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(l10n.ai_start_briefing, style: AppTextStyles.btnWhiteText),
                const SizedBox(width: 8),
                const Icon(Icons.arrow_forward, color: Colors.white, size: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// 2. Quick Action Card
// ==========================================
class QuickActionCard extends StatelessWidget {
  final QuickActionModel action;
  final VoidCallback? onTap; // 👈 ضفنا استقبال أمر الضغط هنا

  const QuickActionCard({Key? key, required this.action, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      // 👈 ضفنا Material و InkWell عشان شكل الضغطة يكون احترافي
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(color: action.iconBgColor, shape: BoxShape.circle),
                  child: Icon(action.icon, color: action.iconColor, size: 20),
                ),
                const Spacer(),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                  child: Text(action.title, style: AppTextStyles.actionTitle),
                ),
                const SizedBox(height: 4),
                Expanded(
                  child: Text(
                    action.description,
                    style: AppTextStyles.actionDesc,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ==========================================
// 3. Recent Bite Card (Insights)
// ==========================================
class RecentBiteCard extends StatelessWidget {
  final RecentBiteModel bite;

  const RecentBiteCard({Key? key, required this.bite}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      width: 260,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F7FA),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(bite.icon, color: bite.iconColor, size: 16),
              const SizedBox(width: 6),
              Text(bite.label, style: AppTextStyles.sectionLabelDark.copyWith(color: bite.iconColor)),
            ],
          ),
          const SizedBox(height: 16),
          _buildRichText(bite.type, l10n),
        ],
      ),
    );
  }

  Widget _buildRichText(BiteType type, AppLocalizations l10n) {
    if (type == BiteType.movement) {
      return Text.rich(
        TextSpan(
          children: [
            TextSpan(text: l10n.ai_bite_movement_text1, style: AppTextStyles.biteTextNormal),
            TextSpan(text: l10n.ai_bite_movement_text2, style: AppTextStyles.biteTextHighlightBlue),
            TextSpan(text: l10n.ai_bite_movement_text3, style: AppTextStyles.biteTextNormal),
            TextSpan(text: l10n.ai_bite_movement_text4, style: AppTextStyles.biteTextNormal),
            TextSpan(text: l10n.ai_bite_movement_text5, style: AppTextStyles.biteTextNormal),
          ],
        ),
      );
    } else {
      return Text.rich(
        TextSpan(
          children: [
            TextSpan(text: l10n.ai_bite_strength_text1, style: AppTextStyles.biteTextNormal),
            TextSpan(text: l10n.ai_bite_strength_text2, style: AppTextStyles.biteTextHighlightNavy),
            TextSpan(text: l10n.ai_bite_strength_text3, style: AppTextStyles.biteTextNormal),
            TextSpan(text: l10n.ai_bite_strength_text4, style: AppTextStyles.biteTextNormal),
            TextSpan(text: l10n.ai_bite_strength_text5, style: AppTextStyles.biteTextNormal),
          ],
        ),
      );
    }
  }
}

// ==========================================
// 4. Spotlight Card Widget
// ==========================================
class AISpotlightCard extends StatelessWidget {
  const AISpotlightCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        image: const DecorationImage(
          image: NetworkImage('https://images.unsplash.com/photo-1534438327276-14e5300c3a48?auto=format&fit=crop&w=800&q=80'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black.withOpacity(0.2), Colors.black.withOpacity(0.8)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(color: const Color(0xFF0058BB), borderRadius: BorderRadius.circular(4)),
                child: Text(l10n.ai_spotlight_tag, style: AppTextStyles.spotlightTag),
              ),
              const SizedBox(height: 12),
              Text(l10n.ai_spotlight_title, style: AppTextStyles.spotlightTitle),
              const SizedBox(height: 12),
              Text(l10n.ai_spotlight_desc, style: AppTextStyles.spotlightDesc),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                  ),
                  child: Text(l10n.ai_preview_program, style: AppTextStyles.spotlightBtn),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}