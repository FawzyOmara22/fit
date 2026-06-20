import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';
import '../data/models/exercise_model.dart'; // استدعاء الموديل

class ExerciseSelectionCard extends StatelessWidget {
  final ExerciseModel exercise;
  final bool isSelected;
  final VoidCallback onTap;

  const ExerciseSelectionCard({
    Key? key,
    required this.exercise,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: isSelected ? AppColors.primary : AppColors.divider, width: isSelected ? 2 : 1),
        ),
        child: Row(
          children: [
            ClipRRect(borderRadius: BorderRadius.circular(12), child: Image.network(exercise.imageUrl, width: 64, height: 64, fit: BoxFit.cover)),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(exercise.title, style: AppTextStyles.addExCardTitle),
                  const SizedBox(height: 4),
                  Text("${exercise.muscle} • ${exercise.equipment}", style: AppTextStyles.addExTagMuscle),
                ],
              ),
            ),
            if (isSelected) const Icon(Icons.check_circle, color: AppColors.primary),
          ],
        ),
      ),
    );
  }
}