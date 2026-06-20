import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/Ai/models/active_set_model.dart';
import 'package:kinetic/features/Ai/models/form_analysis_model.dart';
import 'package:kinetic/features/Ai/widgets/form_analysis_widgets.dart';
import 'package:kinetic/features/Ai/widgets/skeleton_painter.dart';

import 'analysis_progress_screen.dart';
import 'active_set_screen.dart';
import 'form_check_screen.dart';

class FormAnalysisScreen extends StatefulWidget {
  const FormAnalysisScreen({Key? key}) : super(key: key);

  @override
  State<FormAnalysisScreen> createState() => _FormAnalysisScreenState();
}

class _FormAnalysisScreenState extends State<FormAnalysisScreen> {
  bool showSkeleton = true;
  bool showBarPath = false;
  bool isRecording = false;

  late FormAnalysisModel liveData;

  @override
  void initState() {
    super.initState();
    liveData = FormAnalysisModel.fromJson({
      "depthPercentage": 94.0,
      "repCount": 5,
      "isLive": true,
      "skeletonPoints": [
        {"dx": 200, "dy": 300},
        {"dx": 200, "dy": 350},
        {"dx": 200, "dy": 500},
        {"dx": 150, "dy": 600},
        {"dx": 250, "dy": 600}
      ],
      "barPathPoints": [
        {"dx": 200, "dy": 350},
        {"dx": 200, "dy": 450}
      ]
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              'https://images.unsplash.com/photo-1581009146145-b5ef050c2e1e?q=80&w=1000&auto=format&fit=crop',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: CustomPaint(
              painter: SkeletonPainter(
                skeletonPoints: liveData.skeletonPoints,
                barPathPoints: liveData.barPathPoints,
                showSkeleton: showSkeleton,
                showBarPath: showBarPath,
              ),
            ),
          ),
          Positioned(
            top: 50, left: 0, right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: AppColors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const SizedBox(width: 8),
                      Text(l10n.form_analysis_title, style: AppTextStyles.trainAppBar20.copyWith(color: AppColors.white, fontSize: 16)),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(color: AppColors.errorRed, borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        const Icon(Icons.circle, color: AppColors.white, size: 8),
                        const SizedBox(width: 6),
                        Text(l10n.live, style: AppTextStyles.label10Grey.copyWith(color: AppColors.white)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 120, right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                DepthCardWidget(depth: liveData.depthPercentage, label: l10n.depth_label),
                const SizedBox(height: 24),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ActiveSetScreen(
                          model: ActiveSetModel(
                            exerciseNameKey: 'bicep_curls',
                            currentReps: liveData.repCount,
                            targetReps: 12,
                            currentSet: 2,
                            weight: 24.0,
                            restTime: ':45',
                          ),
                        ),
                      ),
                    );
                  },
                  child: RepCountCardWidget(reps: liveData.repCount, label: l10n.rep_count_label, repText: l10n.rep_value),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 40, left: 0, right: 0,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FilterToggleButton(
                      icon: Icons.psychology, label: l10n.skeleton_toggle, isActive: showSkeleton,
                      onTap: () => setState(() => showSkeleton = !showSkeleton),
                    ),
                    const SizedBox(width: 24),
                    FilterToggleButton(
                      icon: Icons.gesture, label: l10n.bar_path_toggle, isActive: showBarPath,
                      onTap: () => setState(() => showBarPath = !showBarPath),
                    ),
                    const SizedBox(width: 24),
                    FilterToggleButton(
                      icon: Icons.flash_on, label: l10n.flash_toggle, isActive: false,
                      onTap: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: AppColors.white.withOpacity(0.1), shape: BoxShape.circle), child: const Icon(Icons.flip_camera_ios, color: AppColors.white)),
                    GestureDetector(
                      onTap: () {
                        setState(() => isRecording = !isRecording);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AnalysisProgressScreen(),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppColors.white, width: 3)),
                        child: Container(width: 60, height: 60, decoration: BoxDecoration(color: AppColors.errorRed, borderRadius: BorderRadius.circular(isRecording ? 12 : 30))),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FormCheckScreen(),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColors.white.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.photo_library, color: AppColors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}