import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/coaching/models/assignment_detail_model.dart';


// ==========================================
// 1. كارت العميل العلوي
// ==========================================
class ClientHeaderCard extends StatelessWidget {
  final AssignmentDetailModel data;
  const ClientHeaderCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
      child: Row(
        children: [
          Stack(
            children: [
              CircleAvatar(radius: 28, backgroundImage: NetworkImage(data.clientAvatar)),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                  child: const Icon(Icons.check_circle, color: AppColors.primary, size: 18), //[cite: 2]
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(data.clientName, style: AppTextStyles.cardTitle18), //[cite: 1]
              const SizedBox(height: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(color: AppColors.lightBlueWhite, borderRadius: BorderRadius.circular(12)), //[cite: 2]
                child: Text(data.clientTag, style: AppTextStyles.label10Blue), //[cite: 1]
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ==========================================
// 2. حالة التعيين (Status)
// ==========================================
class StatusRow extends StatelessWidget {
  final String status;
  final AppLocalizations l10n;
  const StatusRow({Key? key, required this.status, required this.l10n}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(width: 8, height: 8, decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle)), //[cite: 2]
            const SizedBox(width: 8),
            Text(l10n.status, style: AppTextStyles.label10GreyDark), //[cite: 1]
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(20)), //[cite: 2]
          child: Text(status, style: AppTextStyles.label10Blue.copyWith(color: Colors.white)), //[cite: 1]
        ),
      ],
    );
  }
}

// ==========================================
// 3. تعليمات المدرب (شكل الاقتباس)
// ==========================================
class CoachInstructions extends StatelessWidget {
  final String instructions;
  final AppLocalizations l10n;
  const CoachInstructions({Key? key, required this.instructions, required this.l10n}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.coachInstructions, style: AppTextStyles.label10Blue), //[cite: 1]
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.only(left: 16),
          decoration: const BoxDecoration(
            border: Border(left: BorderSide(color: AppColors.lightBlueWhite80, width: 4)), //[cite: 2]
          ),
          child: Text(
            instructions,
            style: AppTextStyles.body16.copyWith(color: AppColors.textGrey, fontStyle: FontStyle.italic, fontSize: 17), //[cite: 1, 2]
          ),
        ),
      ],
    );
  }
}

// ==========================================
// 4. كارت الروتين والإحصائيات
// ==========================================
class ActiveRoutineCard extends StatelessWidget {
  final AssignmentDetailModel data;
  final AppLocalizations l10n;
  const ActiveRoutineCard({Key? key, required this.data, required this.l10n}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.activeRoutine, style: AppTextStyles.label10GreyDark), //[cite: 1]
          const SizedBox(height: 8),
          Text(data.routineName, style: AppTextStyles.trainSectionTitle24), //[cite: 1]
        ],
      ),
    );
  }
}

class RoutineStatsCards extends StatelessWidget {
  final AssignmentDetailModel data;
  final AppLocalizations l10n;
  const RoutineStatsCards({Key? key, required this.data, required this.l10n}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _StatCard(icon: Icons.schedule, value: '${data.durationMin}m', label: l10n.estDuration),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _StatCard(icon: Icons.fitness_center, value: '${data.totalExercises}', label: l10n.totalExercises),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String value, label;
  const _StatCard({required this.icon, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.primary, size: 24), //[cite: 2]
          const SizedBox(height: 12),
          Text(value, style: AppTextStyles.heading24.copyWith(fontWeight: FontWeight.w800)), //[cite: 1]
          const SizedBox(height: 4),
          Text(label, style: AppTextStyles.label10GreyDark), //[cite: 1]
        ],
      ),
    );
  }
}

// ==========================================
// 5. قائمة تفاصيل التمرين (Breakdown)
// ==========================================
class WorkoutBreakdownList extends StatelessWidget {
  final AssignmentDetailModel data;
  final AppLocalizations l10n;
  const WorkoutBreakdownList({Key? key, required this.data, required this.l10n}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(l10n.workoutBreakdown, style: AppTextStyles.label10GreyDark.copyWith(fontSize: 12)), //[cite: 1]
            Text('${data.visibleExercises} ${l10n.shownOf} ${data.totalExercises}', style: AppTextStyles.smallCaption11), //[cite: 1]
          ],
        ),
        const SizedBox(height: 16),
        ...data.exercises.map((ex) => _ExerciseTile(exercise: ex, l10n: l10n)).toList(),
      ],
    );
  }
}

class _ExerciseTile extends StatelessWidget {
  final ExerciseBreakdownModel exercise;
  final AppLocalizations l10n;
  const _ExerciseTile({required this.exercise, required this.l10n});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: const Color(0xFFF1F4F8), borderRadius: BorderRadius.circular(12)),
            child: const Icon(Icons.menu, color: AppColors.primary, size: 20), //[cite: 2]
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(exercise.name, style: AppTextStyles.cardTitle16),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text('${exercise.sets} ${l10n.sets} x ${exercise.reps} ${l10n.reps}', style: AppTextStyles.body14Height.copyWith(fontSize: 13, color: AppColors.iconGrey)), //[cite: 1, 2]
                    const SizedBox(width: 8),
                    Container(width: 4, height: 4, decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle)), //[cite: 2]
                    const SizedBox(width: 8),
                    Text(exercise.weightText, style: AppTextStyles.body14Height.copyWith(fontSize: 13, color: AppColors.iconGrey)), //[cite: 1, 2]
                  ],
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: AppColors.iconGrey), //[cite: 2]
        ],
      ),
    );
  }
}

// ==========================================
// 6. الأزرار العائمة السفلية (Reschedule & Edit)
// ==========================================
class FloatingActionRow extends StatelessWidget {
  final AppLocalizations l10n;
  const FloatingActionRow({Key? key, required this.l10n}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            height: 56,
            decoration: BoxDecoration(color: AppColors.divider, borderRadius: BorderRadius.circular(28)), //[cite: 2]
            alignment: Alignment.center,
            child: Text(l10n.reschedule, style: AppTextStyles.primaryButton16.copyWith(color: AppColors.primary)), //[cite: 1, 2]
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          flex: 3,
          child: Container(
            height: 56,
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [Color(0xFF3B82F6), Color(0xFF60A5FA)]),
              borderRadius: BorderRadius.circular(28),
              boxShadow: [BoxShadow(color: AppColors.primary.withOpacity(0.3), blurRadius: 15, offset: const Offset(0, 5))], //[cite: 2]
            ),
            alignment: Alignment.center,
            child: Text(l10n.editAssignment, style: AppTextStyles.primaryButton16), //[cite: 1]
          ),
        ),
      ],
    );
  }
}

