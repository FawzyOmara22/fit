import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/Ai/models/hub_models.dart';
import 'package:kinetic/features/Ai/widgets/hub_widgets.dart'; 
// 👇 التعديل 3: استدعاء صفحة التدريب (تأكد من مسار الصفحة في مشروعك)
import 'package:kinetic/features/train/pages/train_screen.dart'; 

class AiHubScreen extends StatefulWidget {
  const AiHubScreen({Key? key}) : super(key: key);

  @override
  State<AiHubScreen> createState() => _AiHubScreenState();
}

class _AiHubScreenState extends State<AiHubScreen> {
  late HubDataModel mockData;

  @override
  void initState() {
    super.initState();
    mockData = HubDataModel(
      intensityValue: 'High (92%)',
      recoveryValue: '-14% Optimal',
      workoutMins: 55,
      workoutKcal: 480,
      insightValue: '245 lbs',
      pulseData: WeeklyPulseModel(
        chartData: [0.3, 0.8, 0.6, 0.5, 0.3, 0.2, 0.4], 
        metricValue: '4.2cm',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB), 
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: const Padding(
          padding: EdgeInsets.all(10.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://images.unsplash.com/photo-1599566150163-29194dcaad36?auto=format&fit=crop&w=100&q=80'),
          ),
        ),
        title: Text(l10n.hub_kinetic, style: AppTextStyles.kineticLogo),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined, color: Color(0xFF5B5B60)), 
            onPressed: () {}
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HubHeroCard(),
            const SizedBox(height: 20),

            Row(
              children: [
                MiniStatPill(
                  label: l10n.hub_weekly_intensity, 
                  value: mockData.intensityValue, 
                  icon: Icons.bolt, 
                  iconColor: const Color(0xFF3B82F6)
                ),
                const SizedBox(width: 12),
                MiniStatPill(
                  label: l10n.hub_recovery_gap, 
                  value: mockData.recoveryValue, 
                  icon: Icons.dark_mode, 
                  iconColor: const Color(0xFF1D4ED8)
                ),
              ],
            ),
            const SizedBox(height: 32),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(l10n.hub_smart_workouts, style: AppTextStyles.sectionTitle),
                Text(l10n.hub_recommended, style: AppTextStyles.recommended),
              ],
            ),
            const SizedBox(height: 16),

            // 👇 التعديل 4: استخدام GestureDetector حوالين كارت التمارين عشان يفتح TrainScreen
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TrainScreen()),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white, 
                  borderRadius: BorderRadius.circular(24), 
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4))
                  ]
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(l10n.hub_next_best, style: AppTextStyles.nextBest),
                        Container(
                          padding: const EdgeInsets.all(8), 
                          decoration: const BoxDecoration(color: Color(0xFFF1F5F9), shape: BoxShape.circle), 
                          child: const Icon(Icons.open_in_full, color: Color(0xFF1D4ED8), size: 16)
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Text('Hypertrophy:\nPosterior\nChain', style: AppTextStyles.workoutTitle),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start, 
                          children: [
                            Text('${mockData.workoutMins}', style: AppTextStyles.statNum), 
                            Text(l10n.hub_mins, style: AppTextStyles.statUnit)
                          ]
                        ),
                        const SizedBox(width: 24),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start, 
                          children: [
                            Text('${mockData.workoutKcal}', style: AppTextStyles.statNum), 
                            Text(l10n.hub_kcal, style: AppTextStyles.statUnit)
                          ]
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 80, height: 32,
                          child: Stack(
                            children: [
                              Positioned(left: 0, child: CircleAvatar(radius: 16, backgroundColor: Colors.grey)),
                              Positioned(left: 20, child: CircleAvatar(radius: 16, backgroundColor: Colors.grey)),
                              Positioned(left: 40, child: CircleAvatar(radius: 16, backgroundColor: Colors.grey)),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(color: const Color(0xFFF1F5F9), borderRadius: BorderRadius.circular(20)),
                          child: Text(l10n.hub_view_details, style: AppTextStyles.viewDetailsBtn),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white, 
                borderRadius: BorderRadius.circular(24), 
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4))
                ]
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(l10n.hub_ai_analysis, style: AppTextStyles.analysisLabel),
                      const Icon(Icons.analytics_outlined, color: Color(0xFF1D4ED8)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(l10n.hub_form_check, style: AppTextStyles.analysisTitle),
                  const SizedBox(height: 16),
                  Container(
                    height: 160,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16), 
                      image: const DecorationImage(
                        image: NetworkImage('https://images.unsplash.com/photo-1517836357463-d25dfeac3438?auto=format&fit=crop&w=800&q=80'), 
                        fit: BoxFit.cover
                      )
                    ),
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.all(12), 
                        decoration: BoxDecoration(color: Colors.black.withOpacity(0.5), shape: BoxShape.circle), 
                        child: const Icon(Icons.play_arrow, color: Colors.white, size: 32)
                      )
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: l10n.hub_form_desc_1, style: AppTextStyles.analysisDescNormal),
                        TextSpan(text: mockData.pulseData.metricValue, style: AppTextStyles.analysisDescBold),
                        TextSpan(text: l10n.hub_form_desc_2, style: AppTextStyles.analysisDescNormal),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white, 
                      borderRadius: BorderRadius.circular(20), 
                      boxShadow: [
                        BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4))
                      ]
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.insert_chart_outlined, color: Color(0xFF1D4ED8)),
                        const SizedBox(height: 16),
                        Text(l10n.hub_insights, style: AppTextStyles.gridCardLabel),
                        const SizedBox(height: 8),
                        Text(mockData.insightValue, style: AppTextStyles.gridCardValue),
                        const SizedBox(height: 4),
                        Text(l10n.hub_predicted_1rm, style: AppTextStyles.gridCardSub),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white, 
                      borderRadius: BorderRadius.circular(20), 
                      boxShadow: [
                        BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4))
                      ]
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.handyman_outlined, color: Color(0xFF1D4ED8)),
                        const SizedBox(height: 16),
                        Text(l10n.hub_tool, style: AppTextStyles.gridCardLabel),
                        const SizedBox(height: 8),
                        Text(l10n.hub_draft_plan, style: AppTextStyles.gridCardTitle),
                        const SizedBox(height: 4),
                        Text(l10n.hub_ai_generator, style: AppTextStyles.gridCardSub),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            WeeklyPulseChart(chartData: mockData.pulseData.chartData),
            
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}