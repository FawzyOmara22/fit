import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/coaching/provider/assignment_detail_provider.dart';
import 'package:kinetic/features/coaching/widgets/assignment_detail_widgets.dart';
import 'package:provider/provider.dart';


class AssignmentDetailScreen extends StatefulWidget {
  const AssignmentDetailScreen({Key? key}) : super(key: key);

  @override
  State<AssignmentDetailScreen> createState() => _AssignmentDetailScreenState();
}

class _AssignmentDetailScreenState extends State<AssignmentDetailScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AssignmentDetailProvider>().fetchAssignmentDetails();
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final provider = context.watch<AssignmentDetailProvider>();

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
        title: Text(l10n.assignmentDetail, style: AppTextStyles.trainAppBar20), //[cite: 1]
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: AppColors.primary), //[cite: 2]
            onPressed: () {},
          ),
        ],
      ),
      body: provider.isLoading || provider.detailData == null
          ? const Center(child: CircularProgressIndicator(color: AppColors.primary)) //[cite: 2]
          : Stack(
              children: [
                // المحتوى القابل للتمرير
                SingleChildScrollView(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 100), // مساحة للأزرار العائمة
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClientHeaderCard(data: provider.detailData!),
                      const SizedBox(height: 24),
                      
                      StatusRow(status: provider.detailData!.statusText, l10n: l10n),
                      const SizedBox(height: 24),
                      
                      CoachInstructions(instructions: provider.detailData!.instructions, l10n: l10n),
                      const SizedBox(height: 24),
                      
                      ActiveRoutineCard(data: provider.detailData!, l10n: l10n),
                      const SizedBox(height: 16),
                      
                      RoutineStatsCards(data: provider.detailData!, l10n: l10n),
                      const SizedBox(height: 32),
                      
                      WorkoutBreakdownList(data: provider.detailData!, l10n: l10n),
                    ],
                  ),
                ),
                
                // الأزرار العائمة المزدوجة (Reschedule & Edit)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0),
                    child: FloatingActionRow(l10n: l10n),
                  ),
                ),
              ],
            ),
      // Nav Bar مخصص للمدرب
     
    );
  }
}