import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/Ai/models/form_check_model.dart';
import 'package:kinetic/features/Ai/widgets/form_check_widgets.dart';


class FormCheckScreen extends StatefulWidget {
  const FormCheckScreen({Key? key}) : super(key: key);

  @override
  State<FormCheckScreen> createState() => _FormCheckScreenState();
}

class _FormCheckScreenState extends State<FormCheckScreen> {
  int _selectedRpe = 8;
  final TextEditingController _notesController = TextEditingController();

  Future<void> _submitData() async {
    final model = FormCheckModel(
      exerciseName: "Squat (High Bar)",
      intensityRpe: _selectedRpe,
      coachNotes: _notesController.text,
      videoPath: null,
    );

    final jsonData = model.toJson();
  }

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.darkCharcoal),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(l10n.form_check_title, style: AppTextStyles.appBarTitle),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Center(
              child: Text(l10n.kntk_label, style: AppTextStyles.logoSubtitle.copyWith(fontSize: 16)),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  
                  DashedUploadBox(
                    title: l10n.drag_drop_upload,
                    subtext: l10n.upload_subtext,
                    buttonText: l10n.select_video_btn,
                    onUploadPressed: () {},
                  ),
                  
                  const SizedBox(height: 30),
                  Text(l10n.exercise_label, style: AppTextStyles.label10GreyDark),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(l10n.squat_high_bar, style: AppTextStyles.body14BlueWithHeight.copyWith(color: AppColors.darkCharcoal)),
                        const Icon(Icons.keyboard_arrow_down, color: AppColors.darkCharcoal),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),
                  Text(l10n.intensity_rpe_label, style: AppTextStyles.label10GreyDark),
                  const SizedBox(height: 8),
                  RpeSelectorWidget(
                    selectedRpe: _selectedRpe,
                    onRpeSelected: (val) {
                      setState(() {
                        _selectedRpe = val;
                      });
                    },
                  ),

                  const SizedBox(height: 24),
                  Text(l10n.coach_notes_label, style: AppTextStyles.label10GreyDark),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      controller: _notesController,
                      maxLines: 4,
                      style: AppTextStyles.body14Height.copyWith(color: AppColors.darkCharcoal),
                      decoration: InputDecoration(
                        hintText: l10n.coach_notes_hint,
                        hintStyle: AppTextStyles.body14Height,
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.all(16),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.divider,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.lightbulb_outline, color: AppColors.primary, size: 20),
                            const SizedBox(width: 8),
                            Text(l10n.filming_tips_label, style: AppTextStyles.body14BlueWithHeight.copyWith(color: AppColors.darkCharcoal)),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            FilmingTipCard(
                              icon: Icons.straighten,
                              label: l10n.level_label,
                              value: l10n.eye_level,
                            ),
                            const SizedBox(width: 12),
                            FilmingTipCard(
                              icon: Icons.explore_outlined,
                              label: l10n.angle_label,
                              value: l10n.angle_45_profile,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 32),
                  GradientSubmitButton(
                    label: l10n.submit_review_btn,
                    onPressed: _submitData,
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: Text(
                      l10n.review_disclaimer,
                      style: AppTextStyles.caption12.copyWith(color: AppColors.textGrey),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}