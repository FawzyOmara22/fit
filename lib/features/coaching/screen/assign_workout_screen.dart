import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/coaching/provider/assign_workout_provider.dart';
import 'package:kinetic/features/coaching/widgets/assign_workout_widgets.dart';
import 'package:provider/provider.dart';

class AssignWorkoutScreen extends StatefulWidget {
  const AssignWorkoutScreen({Key? key}) : super(key: key);

  @override
  State<AssignWorkoutScreen> createState() => _AssignWorkoutScreenState();
}

class _AssignWorkoutScreenState extends State<AssignWorkoutScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AssignWorkoutProvider>().fetchData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final provider = context.watch<AssignWorkoutProvider>();

    return Scaffold(
      backgroundColor: AppColors.background, //[cite: 2]
      appBar: AppBar(
        backgroundColor: AppColors.background, //[cite: 2]
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primary), //[cite: 2]
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(l10n.assignWorkout, style: AppTextStyles.trainAppBar20), //[cite: 1]
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: AppColors.primary), //[cite: 2]
            onPressed: () {},
          ),
        ],
      ),
      body: provider.isLoading || provider.client == null
          ? const Center(child: CircularProgressIndicator(color: AppColors.primary)) //[cite: 2]
          : Stack(
              children: [
                // 1. المحتوى القابل للتمرير
                SingleChildScrollView(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 120), // مساحة للزر السفلي
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(l10n.assignedClient, style: AppTextStyles.label10GreyDark), //[cite: 1]
                      const SizedBox(height: 12),
                      AssignedClientCard(client: provider.client!),
                      
                      const SizedBox(height: 24),
                      TabsToggle(l10n: l10n),
                      
                      const SizedBox(height: 24),
                      SearchWorkoutBar(l10n: l10n),
                      
                      const SizedBox(height: 24),
                      ...provider.routines.map((workout) => WorkoutItemCard(workout: workout, l10n: l10n)).toList(),
                      
                      const SizedBox(height: 24),
                      Text(l10n.scheduleAssignment, style: AppTextStyles.label10GreyDark), //[cite: 1]
                      const SizedBox(height: 12),
                      ScheduleDateCard(l10n: l10n),
                    ],
                  ),
                ),

                // 2. الزر السفلي الثابت ذو التدرج اللوني
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: const EdgeInsets.only(top: 24, bottom: 32, left: 24, right: 24),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.background.withOpacity(0.0), //[cite: 2]
                          AppColors.background.withOpacity(0.9), //[cite: 2]
                          AppColors.background, //[cite: 2]
                        ],
                        stops: const [0.0, 0.4, 1.0],
                      ),
                    ),
                    child: GradientSubmitButton(l10n: l10n, clientName: provider.client!.name),
                  ),
                ),
              ],
            ),
    );
  }
}