import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/Ai/models/ai_exercise_detail_model.dart';
import 'package:kinetic/features/Ai/models/exercise_model.dart'; // مسار موديل الكارت
import 'package:kinetic/features/Ai/pages/form_analysis_screen.dart';
import 'package:kinetic/features/Ai/widgets/exercise_detail_widgets.dart'; // مسار موديل التفاصيل
import 'package:kinetic/features/Ai/widgets/exercise_widgets.dart' hide SetupStepTile, CoreCueCard; // مسار الويدجتس

// 1. استدعاء صفحة تحليل الأداء (تأكد من تعديل المسار لو كان مختلف عندك)


class AiExerciseDetailScreen extends StatefulWidget {
  final ExerciseModel exercise; // استقبال التمرين المختار من الشاشة السابقة

  const AiExerciseDetailScreen({Key? key, required this.exercise}) : super(key: key);

  @override
  State<AiExerciseDetailScreen> createState() => _AiExerciseDetailScreenState();
}

class _AiExerciseDetailScreenState extends State<AiExerciseDetailScreen> {
  late AiExerciseDetailModel exerciseData;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final l10n = AppLocalizations.of(context)!;
    
    // ربط الداتا اللي جاية من الكارت (الاسم والصورة) بالموديل بتاع صفحة التفاصيل
    exerciseData = AiExerciseDetailModel(
      id: widget.exercise.id,
      name: widget.exercise.name, 
      imageUrl: widget.exercise.imagePath, 
      coreCues: [
        InstructionItem(title: l10n.cue1_title, description: l10n.cue1_desc),
        InstructionItem(title: l10n.cue2_title, description: l10n.cue2_desc),
        InstructionItem(title: l10n.cue3_title, description: l10n.cue3_desc),
        InstructionItem(title: l10n.cue4_title, description: l10n.cue4_desc),
      ],
      setupSteps: [
        InstructionItem(title: l10n.setup_step1_title, description: l10n.setup_step1_desc),
        InstructionItem(title: l10n.setup_step2_title, description: l10n.setup_step2_desc),
        InstructionItem(title: l10n.setup_step3_title, description: l10n.setup_step3_desc),
      ],
      commonMistakes: [
        MistakeItem(title: l10n.mistake1_title, description: l10n.mistake1_desc, isCorrectWay: true),
        MistakeItem(title: l10n.mistake2_title, description: l10n.mistake2_desc, isCorrectWay: false),
        MistakeItem(title: l10n.mistake3_title, description: l10n.mistake3_desc, isCorrectWay: false),
      ],
      insight: ProInsight(title: l10n.pro_insight_title, description: l10n.pro_insight_desc),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          l10n.ex_detail_header, 
          style: AppTextStyles.profileAppBar18,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz, color: AppColors.primary),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildVideoHeader(l10n),
            const SizedBox(height: 32),
            
            _buildSectionHeader(l10n.core_cues, l10n.points_of_focus),
            const SizedBox(height: 16),
            _buildCoreCuesGrid(),
            const SizedBox(height: 32),

            Text(l10n.setup_guide, style: AppTextStyles.addExSectionTitle),
            const SizedBox(height: 16),
            ...exerciseData.setupSteps.asMap().entries.map((entry) {
              return SetupStepTile(
                step: entry.value, 
                isLast: entry.key == exerciseData.setupSteps.length - 1,
              );
            }).toList(),
            const SizedBox(height: 24),

            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l10n.common_mistakes, style: AppTextStyles.addExSectionTitle),
                  const SizedBox(height: 20),
                  ...exerciseData.commonMistakes.map((mistake) => CommonMistakeTile(mistake: mistake)).toList(),
                ],
              ),
            ),
            const SizedBox(height: 32),

            ProInsightCard(insight: exerciseData.insight, labelText: l10n.pro_insight),
            const SizedBox(height: 40),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                // 2. التعديل هنا: إضافة أمر النقل للصفحة
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FormAnalysisScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                  elevation: 0,
                ),
                icon: const Icon(Icons.auto_awesome, color: AppColors.white),
                label: Text(
                  l10n.start_ai_analysis,
                  style: AppTextStyles.primaryButton16,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoHeader(AppLocalizations l10n) {
    return Container(
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        image: DecorationImage(
          image: NetworkImage(exerciseData.imageUrl), 
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Colors.black.withOpacity(0.8), Colors.transparent],
          ),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.current_movement,
                      style: AppTextStyles.label10Grey.copyWith(color: AppColors.white70),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      exerciseData.name, 
                      style: AppTextStyles.heading24.copyWith(color: AppColors.white, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(color: AppColors.white, shape: BoxShape.circle),
                  child: const Icon(Icons.play_arrow_rounded, color: AppColors.primary, size: 28),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, String actionText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppTextStyles.addExSectionTitle),
        Text(actionText, style: AppTextStyles.addExSeeAll),
      ],
    );
  }

  Widget _buildCoreCuesGrid() {
    final icons = [Icons.arrow_downward, Icons.monitor_weight_outlined, Icons.fitness_center, Icons.expand_more];
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.1, 
      ),
      itemCount: exerciseData.coreCues.length,
      itemBuilder: (context, index) {
        return CoreCueCard(
          cue: exerciseData.coreCues[index],
          iconData: icons[index % icons.length],
        );
      },
    );
  }
}