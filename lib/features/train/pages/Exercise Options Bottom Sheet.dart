import 'dart:ui'; 
import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart'; 
import 'package:kinetic/core/theme/app_text_style.dart'; 

// ==========================================
// مسارات الصفحات (تأكد من مطابقتها لمشروعك)
// ==========================================
import 'plate_calculator_screen.dart'; 
import '../widgets/add_note_bottom_sheet.dart'; 
import 'rest_settings_screen.dart'; 
import 'package:kinetic/features/train/pages/AddExerciseScreen.dart'; 
import 'warm_up_calculator_screen.dart';

class ExerciseOptionsBottomSheet extends StatelessWidget {
  final String exerciseName;
  final String imageUrl;

  const ExerciseOptionsBottomSheet({
    Key? key,
    required this.exerciseName,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: const BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // مقبض السحب (Drag Handle)
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.borderDark,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 24),
          
          // الهيدر (صورة التمرين واسمه)
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  imageUrl,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      exerciseName,
                      style: AppTextStyles.sessionExTitle20.copyWith( 
                        fontWeight: FontWeight.w900,
                        letterSpacing: -0.50,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      l10n.exerciseOptions, 
                      style: AppTextStyles.trainRoutineMeta12.copyWith( 
                        letterSpacing: 1.20,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // ==========================================
          // 1. استبدال التمرين (Swap Exercise)
          // ==========================================
          _buildOptionTile(
            title: l10n.swapExercise, 
            icon: Icons.swap_horiz_rounded,
            iconColor: AppColors.primary,
            iconBgColor: AppColors.primary10,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => const AddExerciseScreen()));
            },
          ),
          const SizedBox(height: 12),

          // ==========================================
          // 2. حاسبة الإحماء (Warm-up Calculator)
          // ==========================================
          _buildOptionTile(
            title: l10n.warmUpCalculator,
            subtitle: l10n.readyToLift,
            icon: Icons.calculate_outlined,
            iconColor: AppColors.restPurple,
            iconBgColor: AppColors.prBg,
            onTap: () {
              Navigator.pop(context); 
              Navigator.push(context, MaterialPageRoute(builder: (context) => const WarmUpCalculatorScreen()));
            },
          ),
          const SizedBox(height: 12),

          // ==========================================
          // 3. حاسبة الأوزان (Plate Calculator)
          // ==========================================
          _buildOptionTile(
            title: l10n.plateCalculator,
            subtitle: l10n.config60kg,
            icon: Icons.fitness_center_rounded,
            iconColor: AppColors.primary,
            iconBgColor: AppColors.primary10,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => const PlateCalculatorScreen()));
            },
          ),
          const SizedBox(height: 12),

          // ==========================================
          // 4. إعدادات الراحة (Rest Timer Settings)
          // ==========================================
          _buildOptionTile(
            title: l10n.restTimerSettings,
            subtitle: l10n.currently90s,
            icon: Icons.timer_outlined,
            iconColor: AppColors.primary,
            iconBgColor: AppColors.primary10,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => const RestSettingsScreen()));
            },
          ),
          const SizedBox(height: 12),

          // ==========================================
          // 5. إضافة ملاحظة (Add Note)
          // ==========================================
          _buildOptionTile(
            title: l10n.addNote,
            icon: Icons.edit_note_rounded,
            iconColor: AppColors.primary,
            iconBgColor: AppColors.primary10,
            onTap: () {
              Navigator.pop(context);
              showModalBottomSheet(
                context: context,
                isScrollControlled: true, 
                backgroundColor: Colors.transparent, 
                builder: (context) {
                  return BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0), 
                    child: AddNoteBottomSheet(exerciseName: exerciseName),
                  );
                },
              );
            },
          ),
          const SizedBox(height: 24),

          // ==========================================
          // 6. زر حذف التمرين (Remove Exercise)
          // ==========================================
          GestureDetector(
            onTap: () {
              _showRemoveExerciseDialog(context, l10n); 
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              decoration: BoxDecoration(
                color: AppColors.errorLightBg, 
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: AppColors.discardIconBg, 
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.backspace_rounded, color: AppColors.errorRed, size: 20), 
                  ),
                  const SizedBox(width: 16),
                  Text(
                    l10n.removeExercise, 
                    style: AppTextStyles.profileListText16.copyWith(color: AppColors.errorRed), 
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),

          // ==========================================
          // 7. زر الإلغاء (Cancel)
          // ==========================================
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: AppColors.keepTrainingBg, 
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text(
                  l10n.cancel, 
                  style: AppTextStyles.textButton14Spacing.copyWith( 
                    color: AppColors.textGrey, 
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  // ==========================================
  // دالة إظهار رسالة تأكيد الحذف
  // ==========================================
  void _showRemoveExerciseDialog(BuildContext context, AppLocalizations l10n) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "RemoveExerciseDialog",
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (ctx, anim1, anim2) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), // تأثير البلور للخلفية
          child: Dialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            backgroundColor: AppColors.white, 
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // أيقونة الحذف الحمراء
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      color: AppColors.discardIconBg, 
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.backspace_rounded, color: AppColors.discardBtnRed, size: 28), 
                  ),
                  const SizedBox(height: 20),
                  
                  // العنوان (مع استبدال النص EXERCISE_NAME بالاسم الحقيقي)
                  Text(
                    l10n.removeExerciseQuestion.replaceAll('EXERCISE_NAME', exerciseName), 
                    style: AppTextStyles.dialogTitle24, 
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  
                  // الوصف
                  Text(
                    l10n.removeExerciseBody,
                    style: AppTextStyles.dialogBody16, 
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  
                  // زر الحذف النهائي (الأحمر)
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(ctx).pop(); // يغلق نافذة الـ Dialog
                        Navigator.of(context).pop(); // يغلق الـ Bottom Sheet ويرجع لصفحة التمرين
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.discardBtnRed, 
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                        elevation: 0,
                      ),
                      child: Text(l10n.removeExercise, style: AppTextStyles.dialogBtnRed16), 
                    ),
                  ),
                  const SizedBox(height: 12),
                  
                  // زر الإلغاء (الرمادي)
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(ctx).pop(); // يغلق الـ Dialog فقط وتبقى في الـ Bottom Sheet
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.keepTrainingBg, 
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                        elevation: 0,
                      ),
                      child: Text(
                        l10n.cancel, 
                        style: AppTextStyles.dialogBtnGray16.copyWith(color: AppColors.primary), 
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // ==========================================
  // مكون إضافي: بناء صف القائمة (Option Tile)
  // ==========================================
  Widget _buildOptionTile({
    required String title,
    String? subtitle,
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: AppColors.white, 
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: iconBgColor,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: iconColor, size: 22),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextStyles.profileListText16), 
                  if (subtitle != null) ...[
                    const SizedBox(height: 2),
                    Text(subtitle, style: AppTextStyles.sessionExMuscle12), 
                  ],
                ],
              ),
            ),
            const Icon(Icons.chevron_right_rounded, color: AppColors.iconGrey, size: 24), 
          ],
        ),
      ),
    );
  }
}