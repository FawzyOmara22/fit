import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/onboarding/screens/step10_units_screen.dart';
import 'package:provider/provider.dart';
import 'package:kinetic/core/l10n/app_localizations.dart'; 
import '../../../core/theme/app_colors.dart';
import '../../../core/shared_widgets/custom_gradient_button.dart'; 
import '../provider/onboarding_provider.dart'; 
import '../widgets/equipment_card.dart'; 
import '../widgets/onboarding_top_bar.dart';

class Step9EquipmentScreen extends StatelessWidget {
  const Step9EquipmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final provider = context.watch<OnboardingProvider>();

    final List<Map<String, String>> equipmentList = [
      {'id': 'Barbells', 'title': l10n.equipment_barbells, 'subtitle': l10n.equipment_barbells_desc},
      {'id': 'Dumbbells', 'title': l10n.equipment_dumbbells, 'subtitle': l10n.equipment_dumbbells_desc},
      {'id': 'Kettlebells', 'title': l10n.equipment_kettlebells, 'subtitle': l10n.equipment_kettlebells_desc},
      {'id': 'Machines', 'title': l10n.equipment_machines, 'subtitle': l10n.equipment_machines_desc},
      {'id': 'Plates', 'title': l10n.equipment_plates, 'subtitle': l10n.equipment_plates_desc},
      {'id': 'Bands', 'title': l10n.equipment_bands, 'subtitle': l10n.equipment_bands_desc},
      {'id': 'Suspension', 'title': l10n.equipment_suspension, 'subtitle': l10n.equipment_suspension_desc},
      {'id': 'Others', 'title': l10n.equipment_others, 'subtitle': l10n.equipment_others_desc},
    ];

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
              child: OnboardingTopBar(stepText: l10n.step_9_of_14, onSkip: () {
                 Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const Step10UnitsScreen(), // 👈 غير HomeScreen باسم صفحتك
      ),
    );
              }),
            ),

            Expanded(
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 32),

                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: l10n.equip_your_p1, style: AppTextStyles.heading36Black.copyWith(height: 0.95)),
                            TextSpan(text: l10n.equip_your_p2, style: AppTextStyles.heading36Primary.copyWith(height: 0.95)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),

                      Text(l10n.equip_your_desc, style: AppTextStyles.body14WithHeight),
                      const SizedBox(height: 32),

                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12, childAspectRatio: 1.6,
                        ),
                        itemCount: equipmentList.length,
                        itemBuilder: (context, index) {
                          final item = equipmentList[index];
                          final isSelected = provider.availableEquipment.contains(item['id']);

                          return EquipmentCard(
                            title: item['title']!, subtitle: item['subtitle']!, iconData: _getIconForId(item['id']!), 
                            isSelected: isSelected, onTap: () => provider.toggleEquipment(item['id']!),
                          );
                        },
                      ),
                      const SizedBox(height: 32),

                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                        decoration: BoxDecoration(color: AppColors.inputBackground, borderRadius: BorderRadius.circular(16)),
                        child: Row(
                          children: [
                            Container(width: 48, height: 48, decoration: BoxDecoration(color: AppColors.divider, borderRadius: BorderRadius.circular(12)), child: const Icon(Icons.directions_run, color: AppColors.primary)),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(l10n.add_cardio_finishers, style: AppTextStyles.cardTitle14.copyWith(fontSize: 16)),
                                  const SizedBox(height: 4),
                                  Text(l10n.add_cardio_finishers_desc, style: AppTextStyles.body14NoHeight.copyWith(fontSize: 12)),
                                ],
                              ),
                            ),
                            CupertinoSwitch(
                              value: provider.addCardioFinishers, activeColor: AppColors.primary,
                              onChanged: (value) => provider.toggleCardioFinishers(value),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: CustomGradientButton(text: 'CONTINUE', onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const Step10UnitsScreen())); }),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getIconForId(String id) {
    switch (id) {
      case 'Barbells': return Icons.fitness_center;
      case 'Dumbbells': return Icons.line_weight;
      case 'Kettlebells': return Icons.sports_gymnastics;
      case 'Machines': return Icons.precision_manufacturing;
      case 'Plates': return Icons.radio_button_checked;
      case 'Bands': return Icons.waves;
      case 'Suspension': return Icons.vertical_align_bottom;
      case 'Others': return Icons.more_horiz;
      default: return Icons.help_outline;
    }
  }
}