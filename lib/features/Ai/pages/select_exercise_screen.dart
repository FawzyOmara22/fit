import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/Ai/pages/ai_exercise_detail_screen.dart';
// تأكد من المسارات دي إنها مطابقة للي عندك تمم
import 'package:kinetic/features/Ai/widgets/exercise_card_widget.dart';
import 'package:kinetic/features/Ai/models/exercise_model.dart';
// 1. تمت إضافة مسار صفحة التفاصيل هنا (تأكد من مطابقته لمسار الملف في مشروعك)
 

class SelectExerciseScreen extends StatefulWidget {
  const SelectExerciseScreen({Key? key}) : super(key: key);

  @override
  State<SelectExerciseScreen> createState() => _SelectExerciseScreenState();
}

class _SelectExerciseScreenState extends State<SelectExerciseScreen> {
  int selectedFilterIndex = 0;

  // الداتا الوهمية مضاف ليها 4 كروت وصور من الإنترنت
  final List<ExerciseModel> exercises = [
    ExerciseModel.fromJson({
      "id": "1",
      "name": "Barbell Squat",
      "muscles": "Quadriceps, Glutes",
      "tags": ["Compound", "Barbell"],
      "hasAiAnalysis": true,
      "imagePath": "https://images.unsplash.com/photo-1534438327276-14e5300c3a48?q=80&w=200&auto=format&fit=crop"
    }),
    ExerciseModel.fromJson({
      "id": "2",
      "name": "Bench Press",
      "muscles": "Chest, Triceps",
      "tags": ["Compound", "Bench"],
      "hasAiAnalysis": true,
      "imagePath": "https://images.unsplash.com/photo-1571019614242-c5c5dee9f50b?q=80&w=200&auto=format&fit=crop"
    }),
    ExerciseModel.fromJson({
      "id": "3",
      "name": "Deadlift",
      "muscles": "Back, Hamstrings",
      "tags": ["Strength", "Barbell"],
      "hasAiAnalysis": false,
      "imagePath": "https://images.unsplash.com/photo-1603287681836-b174ce5074c2?q=80&w=200&auto=format&fit=crop"
    }),
    ExerciseModel.fromJson({
      "id": "4",
      "name": "Pull-ups",
      "muscles": "Back, Biceps",
      "tags": ["Bodyweight"],
      "hasAiAnalysis": true,
      "imagePath": "https://images.unsplash.com/photo-1598971639058-fab3c3109a00?q=80&w=200&auto=format&fit=crop"
    }),
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          l10n.select_exercise_title, 
          style: AppTextStyles.addExAppBarTitle,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              l10n.cancel, 
              style: AppTextStyles.addExCancelBtn,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSearchBar(l10n),
            const SizedBox(height: 24),
            _buildTargetArea(l10n),
            const SizedBox(height: 24),
            _buildFormModeBanner(l10n),
            const SizedBox(height: 32),
            Text(
              l10n.most_popular, 
              style: AppTextStyles.sectionTitle,
            ),
            const SizedBox(height: 16),
            _buildExerciseList(),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar(AppLocalizations l10n) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: l10n.search_exercise_hint,
          hintStyle: AppTextStyles.addExSearchHint,
          prefixIcon: const Icon(Icons.search, color: AppColors.iconGrey),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    );
  }

  Widget _buildTargetArea(AppLocalizations l10n) {
    final filters = [
      l10n.filterAll,
      l10n.filterChest,
      l10n.filterBack,
      l10n.filterLegs,
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.target_area, 
          style: AppTextStyles.addExSectionTitle,
        ),
        const SizedBox(height: 12),
        Row(
          children: List.generate(filters.length, (index) {
            final isSelected = index == selectedFilterIndex;
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedFilterIndex = index;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.primary : AppColors.surfaceColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    filters[index],
                    style: TextStyle(
                      color: isSelected ? AppColors.white : AppColors.textGrey,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildFormModeBanner(AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.speed, color: AppColors.white, size: 20),
              const SizedBox(width: 8),
              Text(
                l10n.form_mode_active, 
                style: AppTextStyles.spotlightTag,
              ),
            ],
          ),
          const SizedBox(height: 12),
          RichText(
            text: TextSpan(
              style: AppTextStyles.body14Height.copyWith(color: AppColors.white),
              children: [
                TextSpan(text: l10n.form_mode_desc_p1), 
                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: AppColors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      l10n.ai_analysis_badge, 
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                TextSpan(text: l10n.form_mode_desc_p2), 
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExerciseList() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: exercises.length,
      itemBuilder: (context, index) {
        return ExerciseCardWidget(
          exercise: exercises[index],
          onTap: () {
            // 2. التعديل تم هنا: الانتقال لصفحة التفاصيل وتمرير بيانات الكارت المختار
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AiExerciseDetailScreen(
                  exercise: exercises[index],
                ),
              ),
            );
          },
        );
      },
    );
  }
}