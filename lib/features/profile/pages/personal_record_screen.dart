import 'package:flutter/material.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
// استدعاء الويدجتس والموديل
import 'package:kinetic/features/profile/widgets/pr_widgets.dart'; 
import 'package:kinetic/features/profile/models/pr_model.dart';
// زرار الإضافة الدائري اللي عملناه قبل كده
import 'package:kinetic/features/profile/widgets/measurement_widgets.dart'; 

class PersonalRecordScreen extends StatelessWidget {
  const PersonalRecordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    // داتا وهمية لاختبار الشاشة
    final List<MilestoneModel> dummyMilestones = [
      MilestoneModel(type: 'new_pr', date: 'OCT 24, 2023', valueText: '225 lbs × 5 reps', percentage: '+4.5%'),
      MilestoneModel(type: 'volume_pr', date: 'SEP 15, 2023', valueText: '215 lbs × 8 reps', percentage: '+2.1%'),
      MilestoneModel(type: 'max_pr', date: 'AUG 02, 2023', valueText: '210 lbs × 5 reps', percentage: '+3.2%'),
    ];

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(l10n.personalRecords, style: AppTextStyles.appBarTitle),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.share_outlined, color: AppColors.primary),
            onPressed: () {},
          ),
        ],
      ),
      
      // زرار الـ Gradient اللي طلبت يكون موجود هنا
      floatingActionButton: GradientCircularButton(
        onTap: () {
          print("إضافة رقم قياسي جديد");
        },
        icon: Icons.add,
      ),

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PRHeaderWidget(),
            const SizedBox(height: 24),
            
            const CurrentPeakCard(),
            const SizedBox(height: 16),
            
            const PRSubStatsRow(),
            const SizedBox(height: 32),
            
            const PRProgressionChart(),
            const SizedBox(height: 32),
            
            MilestoneHistorySection(milestones: dummyMilestones),
            const SizedBox(height: 80), // مساحة للزرار العائم
          ],
        ),
      ),
    );
  }
}