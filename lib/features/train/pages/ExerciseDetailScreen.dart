import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart'; // تأكد من مسار الترجمة
import 'package:kinetic/features/train/widgets/exercise_detail_widgets.dart';
import '../../../../core/theme/app_colors.dart'; // تأكد من المسار
import '../../../../core/theme/app_text_style.dart'; // تأكد من المسار
 // استدعاء ملف الويدجتس اللي عملناه فوق

class ExerciseDetailScreen extends StatelessWidget {
  // ممكن تستقبل الداتا هنا بعدين، بس هحطلك لينك الصورة كمثال
  final String exerciseImage = 'https://images.unsplash.com/photo-1571019614242-c5c5dee9f50b?q=80&w=600&auto=format&fit=crop'; 

  const ExerciseDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(l10n.exerciseDetailTitle, style: const TextStyle(color: AppColors.darkCharcoal, fontSize: 16, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: AppColors.primary),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            // 1. صورة التمرين بالفيديو
            ExerciseVideoHeader(imageUrl: exerciseImage),
            const SizedBox(height: 24),
            
            // 2. عنوان التمرين وزر التسجيل
            Text(l10n.strengthTraining, style: const TextStyle(color: AppColors.primary, fontSize: 10, fontWeight: FontWeight.w800, letterSpacing: 1.5)),
            const SizedBox(height: 4),
            const Text('Barbell Bench Press', style: TextStyle(color: AppColors.darkCharcoal, fontSize: 28, fontWeight: FontWeight.w500)), // العنوان ثابت من الداتا
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  elevation: 0,
                ),
                icon: const Icon(Icons.add_circle_outline, color: Colors.white, size: 20),
                label: Text(l10n.logWorkout, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 32),

            // 3. أفضل رقم شخصي
            const PersonalBestCard(),
            const SizedBox(height: 32),

            // 4. العضلات المستهدفة
            const TargetedMusclesSection(),
            const SizedBox(height: 32),

            // 5. كيفية الأداء
            Row(
              children: [
                Text(l10n.howToPerform, style: const TextStyle(color: AppColors.darkCharcoal, fontSize: 18, fontWeight: FontWeight.w900)),
                const SizedBox(width: 16),
                const Expanded(child: Divider(color: AppColors.divider)),
              ],
            ),
            const SizedBox(height: 24),
            HowToPerformStep(stepNum: l10n.step1Num, title: l10n.step1Title, description: l10n.step1Desc),
            HowToPerformStep(stepNum: l10n.step2Num, title: l10n.step2Title, description: l10n.step2Desc),
            HowToPerformStep(stepNum: l10n.step3Num, title: l10n.step3Title, description: l10n.step3Desc),
            const SizedBox(height: 8),

            // 6. نصائح احترافية
            const ProFormTipsCard(),
            const SizedBox(height: 40), // مساحة فاضية في الآخر بدل الـ Nav Bar
          ],
        ),
      ),
    );
  }
}