import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart'; 
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/Ai/models/ai_models.dart';
import 'package:kinetic/features/Ai/pages/Permissions%20Screen.dart';
import 'package:kinetic/features/Ai/pages/ai_hub_screen.dart';
import 'package:kinetic/features/Ai/widgets/ai_widgets.dart';

// 👇 استدعاء الصفحات اللي هننتقل ليها
import 'package:kinetic/features/Ai/pages/coach_chat_screen.dart';
// 👇 استدعاء صفحة الصلاحيات اللي لسه عاملينها


class AIScreen extends StatefulWidget {
  const AIScreen({Key? key}) : super(key: key);

  @override
  State<AIScreen> createState() => _AIScreenState();
}

class _AIScreenState extends State<AIScreen> {
  
  // ==========================================
  // Mock Data Generators (مجهزة بـ id للـ API)
  // ==========================================
  
  List<QuickActionModel> _getQuickActions(AppLocalizations l10n) {
    return [
      QuickActionModel(
        id: '1', 
        title: l10n.ai_qa_coach_title, 
        description: l10n.ai_qa_coach_desc, 
        icon: Icons.chat_bubble_outline, 
        iconColor: const Color(0xFF0058BB), 
        iconBgColor: const Color(0xFFEBF4FF)
      ),
      QuickActionModel(
        id: '2', 
        title: l10n.ai_qa_form_title, 
        description: l10n.ai_qa_form_desc, 
        icon: Icons.camera_alt_outlined, 
        iconColor: const Color(0xFF883C93), 
        iconBgColor: const Color(0xFFF3E8F5)
      ),
      QuickActionModel(
        id: '3', 
        title: l10n.ai_qa_smart_title, 
        description: l10n.ai_qa_smart_desc, 
        icon: Icons.auto_awesome, 
        iconColor: const Color(0xFF3853B7), 
        iconBgColor: const Color(0xFFECEFF8)
      ),
      QuickActionModel(
        id: '4', 
        title: l10n.ai_qa_predict_title, 
        description: l10n.ai_qa_predict_desc, 
        icon: Icons.trending_up, 
        iconColor: const Color(0xFF933C50), 
        iconBgColor: const Color(0xFFF5E8EB)
      ),
    ];
  }

  List<RecentBiteModel> _getRecentBites(AppLocalizations l10n) {
    return [
      RecentBiteModel(
        id: 'b1', 
        type: BiteType.movement, 
        label: l10n.ai_bite_movement_iq, 
        icon: Icons.bolt, 
        iconColor: const Color(0xFF3B82F6)
      ),
      RecentBiteModel(
        id: 'b2', 
        type: BiteType.strength, 
        label: l10n.ai_bite_strength_proj, 
        icon: Icons.bar_chart, 
        iconColor: const Color(0xFF883C93)
      ),
    ];
  }

  // ==========================================
  // Build Method
  // ==========================================

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    final quickActions = _getQuickActions(l10n);
    final recentBites = _getRecentBites(l10n);

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9FB), 
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Row(
          children: [
            Icon(Icons.bolt, color: Color(0xFF0058BB)),
            SizedBox(width: 4),
            Text(
              'KINETIC AI', 
              style: TextStyle(
                color: Color(0xFF0058BB), 
                fontSize: 20, 
                fontFamily: 'Inter', 
                fontWeight: FontWeight.w900, 
                letterSpacing: -1
              ),
            ),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20.0, left: 20.0),
            child: CircleAvatar(
              radius: 16,
              backgroundImage: NetworkImage('https://images.unsplash.com/photo-1599566150163-29194dcaad36?auto=format&fit=crop&w=100&q=80'),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AIWelcomeCard(), 
            const SizedBox(height: 32),

            Text(l10n.ai_core_systems, style: AppTextStyles.sectionLabel),
            const SizedBox(height: 8),
            Text(l10n.ai_quick_actions, style: AppTextStyles.sectionTitle),
            const SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: quickActions.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.90,
              ),
              itemBuilder: (context, index) {
                return QuickActionCard(
                  action: quickActions[index],
                  onTap: () {
                    if (quickActions[index].id == '3') {
                      // لو ضغط على Smart Generator يروح لصفحة AiHubScreen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AiHubScreen()),
                      );
                    } else if (quickActions[index].id == '1') {
                      // لو ضغط على Coach Chat يروح لصفحة CoachChatScreen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const CoachChatScreen()),
                      );
                    } else if (quickActions[index].id == '2') {
                      // 👇 التعديل هنا: لو ضغط على Form Analysis يروح لصفحة الصلاحيات
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PermissionsScreen()),
                      );
                    }
                  },
                );
              },
            ),
            const SizedBox(height: 32),

            Text(l10n.ai_neural_insights, style: AppTextStyles.sectionLabel),
            const SizedBox(height: 8),
            Text(l10n.ai_recent_bites, style: AppTextStyles.sectionTitle),
            const SizedBox(height: 16),
            SizedBox(
              height: 180,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: recentBites.length,
                separatorBuilder: (_, __) => const SizedBox(width: 16),
                itemBuilder: (context, index) {
                  return RecentBiteCard(bite: recentBites[index]);
                },
              ),
            ),
            const SizedBox(height: 32),

            Text(l10n.ai_recommended_path, style: AppTextStyles.sectionLabel),
            const SizedBox(height: 8),
            Text(l10n.ai_program_spotlight, style: AppTextStyles.sectionTitle),
            const SizedBox(height: 16),
            const AISpotlightCard(),
            
            const SizedBox(height: 40), 
          ],
        ),
      ),
    );
  }
}