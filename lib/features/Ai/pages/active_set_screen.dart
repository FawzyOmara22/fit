import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/Ai/models/active_set_model.dart';
import 'package:kinetic/features/Ai/widgets/active_set_widgets.dart';

import 'form_analysis_screen.dart';

class ActiveSetScreen extends StatefulWidget {
  final ActiveSetModel model;

  const ActiveSetScreen({Key? key, required this.model}) : super(key: key);

  @override
  State<ActiveSetScreen> createState() => _ActiveSetScreenState();
}

class _ActiveSetScreenState extends State<ActiveSetScreen> {
  late int currentReps;

  @override
  void initState() {
    super.initState();
    currentReps = widget.model.currentReps;
  }

  void _incrementReps() {
    setState(() {
      if (currentReps < widget.model.targetReps) currentReps++;
    });
  }

  void _decrementReps() {
    setState(() {
      if (currentReps > 0) currentReps--;
    });
  }

  Future<void> _submitDataToApi() async {
    final updatedModel = ActiveSetModel(
      exerciseNameKey: widget.model.exerciseNameKey,
      currentReps: currentReps,
      targetReps: widget.model.targetReps,
      currentSet: widget.model.currentSet,
      weight: widget.model.weight,
      restTime: widget.model.restTime,
    );
    
    final Map<String, dynamic> jsonData = updatedModel.toJson();
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
          icon: const Icon(Icons.close, color: AppColors.darkCharcoal),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const FormAnalysisScreen()),
            );
          },
        ),
        title: Text(
          l10n.bicep_curls, 
          style: AppTextStyles.trainAppBar20,
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(l10n.finish_btn, style: AppTextStyles.textButton14Spacing),
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
                children: [
                  const SizedBox(height: 20),
                  Center(
                    child: SizedBox(
                      width: 280,
                      height: 280,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          CircularProgressIndicator(
                            value: widget.model.targetReps > 0 
                                ? currentReps / widget.model.targetReps 
                                : 0,
                            strokeWidth: 16,
                            backgroundColor: AppColors.divider,
                            valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(l10n.reps_completed, style: AppTextStyles.smallCaption11),
                              const SizedBox(height: 4),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Text(currentReps.toString(), style: AppTextStyles.timerHuge80),
                                  Text('/${widget.model.targetReps}', style: AppTextStyles.heading36.copyWith(color: AppColors.mutedGrey)),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StatCard(
                        title: l10n.set_label,
                        valueWidget: Text('0${widget.model.currentSet}', style: AppTextStyles.prCardValue24),
                      ),
                      StatCard(
                        title: l10n.weight_label,
                        valueWidget: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(widget.model.weight.toInt().toString(), style: AppTextStyles.prCardValue24),
                            const SizedBox(width: 2),
                            Text(l10n.kg_unit, style: AppTextStyles.prCardUnit12),
                          ],
                        ),
                      ),
                      StatCard(
                        title: l10n.rest_label,
                        valueWidget: Text(widget.model.restTime, style: AppTextStyles.prCardValue24),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SmallCircleButton(icon: Icons.remove, onPressed: _decrementReps),
                      GradientCircleButton(label: l10n.add_reps, onPressed: _incrementReps),
                      SmallCircleButton(icon: Icons.history, onPressed: () {}),
                    ],
                  ),
                  const SizedBox(height: 30),
                  GradientActionButton(
                    label: l10n.set_complete_btn,
                    onPressed: _submitDataToApi,
                  ),
                  const SizedBox(height: 24),
                  Container(
                    height: 180,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: Colors.grey.shade300,
                      image: const DecorationImage(
                        image: NetworkImage('https://images.unsplash.com/photo-1584735935682-2f2b69dff9d2?q=80&w=1000&auto=format&fit=crop'),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(Colors.grey, BlendMode.saturation),
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            AppColors.background.withOpacity(1.0),
                            AppColors.background.withOpacity(0.1),
                          ],
                        ),
                      ),
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