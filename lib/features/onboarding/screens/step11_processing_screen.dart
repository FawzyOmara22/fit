import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/plan/screens/plan_screen.dart';
import '../../../core/theme/app_colors.dart';

class Step11ProcessingScreen extends StatefulWidget {
  const Step11ProcessingScreen({super.key});

  @override
  State<Step11ProcessingScreen> createState() => _Step11ProcessingScreenState();
}

class _Step11ProcessingScreenState extends State<Step11ProcessingScreen> {
  
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const PlanScreen(), 
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground, 
      body: SafeArea(
        child: Column(
          children: [
            // -----------------------------------------
            // 1. الهيدر المخصص (بدون استخدام الموحد لأنه مختلف)
            // -----------------------------------------
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 16), 
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(Icons.menu, color: AppColors.primary, size: 28),
                  ),
                  Text(
                    "KINETIC AI",
                    style: AppTextStyles.title18Dark.copyWith(fontWeight: FontWeight.w900, letterSpacing: -0.90),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.divider, 
                      ),
                      child: const Icon(Icons.person, color: AppColors.borderGrey, size: 24),
                    ),
                  ),
                ],
              ),
            ),

            // -----------------------------------------
            // 2. المحتوى القابل للسحب
            // -----------------------------------------
            Expanded(
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false, 
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 16),

                          // العناوين العلوية
                          Text(
                            l10n.neural_engine_active,
                            textAlign: TextAlign.center,
                            style: AppTextStyles.label10Blue.copyWith(letterSpacing: 2),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            l10n.finalizing_strategy,
                            textAlign: TextAlign.center,
                            style: AppTextStyles.heading36Black.copyWith(letterSpacing: -0.90),
                          ),
                          const SizedBox(height: 48),

                          // الجزء الدائري (الأنيميشن/الجرافيك)
                          Stack(
                            alignment: Alignment.center,
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                width: 240,
                                height: 240,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: AppColors.primary.withOpacity(0.1), width: 1),
                                ),
                              ),
                              Container(
                                width: 200,
                                height: 200,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: AppColors.primary.withOpacity(0.3), width: 1),
                                ),
                              ),
                              Container(
                                width: 160,
                                height: 160,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    colors: [AppColors.gradientStart, AppColors.gradientEnd],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                                child: const Icon(Icons.auto_awesome, color: Colors.white, size: 48), 
                              ),
                              Positioned(
                                bottom: -20,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(24),
                                    boxShadow: [
                                      BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4)),
                                    ],
                                  ),
                                  child: Text(
                                    l10n.percent_complete,
                                    style: AppTextStyles.body14BlueNoHeight.copyWith(letterSpacing: 1.40),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 48),

                          // كروت العمليات (Current Process)
                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(24),
                              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4))],
                            ),
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: const BoxDecoration(color: AppColors.insightBg, shape: BoxShape.circle),
                                  child: const Icon(Icons.bar_chart, color: AppColors.primary),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(l10n.current_process, style: AppTextStyles.label10Blue.copyWith(letterSpacing: 1)),
                                      const SizedBox(height: 4),
                                      Text(l10n.optimizing_recovery, style: AppTextStyles.cardTitle18),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),

                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(color: AppColors.insightBg, borderRadius: BorderRadius.circular(16)),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.check_circle, color: AppColors.borderGrey, size: 20),
                                      const SizedBox(width: 12),
                                      Expanded(child: Text(l10n.analyzing_biometrics, style: AppTextStyles.body14NoHeight.copyWith(fontSize: 12))),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(color: AppColors.insightBg, borderRadius: BorderRadius.circular(16)),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.check_circle, color: AppColors.borderGrey, size: 20),
                                      const SizedBox(width: 12),
                                      Expanded(child: Text(l10n.movement_selection, style: AppTextStyles.body14NoHeight.copyWith(fontSize: 12))),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),

                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(color: AppColors.insightBg, borderRadius: BorderRadius.circular(16)),
                            child: Row(
                              children: [
                                const Icon(Icons.hourglass_bottom, color: AppColors.primary, size: 20),
                                const SizedBox(width: 12),
                                Expanded(child: Text(l10n.calibrating_overload, style: AppTextStyles.body14NoHeight)),
                                Text(l10n.next_step, style: AppTextStyles.label10GreyDark),
                              ],
                            ),
                          ),

                          const Spacer(), 

                          // النص السفلي
                          Text(
                            l10n.ai_processing_desc,
                            textAlign: TextAlign.center,
                            style: AppTextStyles.caption12.copyWith(color: AppColors.borderGrey, height: 1.63),
                          ),
                          const SizedBox(height: 32),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}