import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/coaching/models/assign_workout_model.dart';
import 'package:kinetic/features/coaching/provider/assign_workout_provider.dart';
import 'package:provider/provider.dart';


// ==========================================
// 1. كارت العميل
// ==========================================
class AssignedClientCard extends StatelessWidget {
  final AssignedClientModel client;
  const AssignedClientCard({Key? key, required this.client}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          CircleAvatar(radius: 24, backgroundImage: NetworkImage(client.avatarUrl)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(client.name, style: AppTextStyles.cardTitle18), //[cite: 1]
                const SizedBox(height: 4),
                Text(client.programInfo, style: AppTextStyles.body14Height.copyWith(fontSize: 13)), //[cite: 1]
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: AppColors.lightBlueWhite, shape: BoxShape.circle), //[cite: 2]
            child: const Icon(Icons.swap_horiz, color: AppColors.primary, size: 20), //[cite: 2]
          ),
        ],
      ),
    );
  }
}

// ==========================================
// 2. أزرار التبديل (Routines / Programs)
// ==========================================
class TabsToggle extends StatelessWidget {
  final AppLocalizations l10n;
  const TabsToggle({Key? key, required this.l10n}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AssignWorkoutProvider>();
    final isRoutines = provider.selectedTabIndex == 0;

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(color: const Color(0xFFF1F4F8), borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => provider.setTab(0),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(color: isRoutines ? AppColors.primary : Colors.transparent, borderRadius: BorderRadius.circular(12)), //[cite: 2]
                alignment: Alignment.center,
                child: Text(l10n.routines, style: AppTextStyles.label10Blue.copyWith(color: isRoutines ? Colors.white : AppColors.textGrey, fontSize: 14)), //[cite: 1, 2]
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => provider.setTab(1),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(color: !isRoutines ? AppColors.primary : Colors.transparent, borderRadius: BorderRadius.circular(12)), //[cite: 2]
                alignment: Alignment.center,
                child: Text(l10n.programs, style: AppTextStyles.label10Blue.copyWith(color: !isRoutines ? Colors.white : AppColors.textGrey, fontSize: 14)), //[cite: 1, 2]
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// 3. شريط البحث
// ==========================================
class SearchWorkoutBar extends StatelessWidget {
  final AppLocalizations l10n;
  const SearchWorkoutBar({Key? key, required this.l10n}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(color: const Color(0xFFF1F4F8), borderRadius: BorderRadius.circular(16)),
      child: TextField(
        decoration: InputDecoration(
          hintText: l10n.searchLibrary,
          hintStyle: AppTextStyles.body14Height.copyWith(color: AppColors.iconGrey), //[cite: 1, 2]
          border: InputBorder.none,
          icon: const Icon(Icons.search, color: AppColors.iconGrey), //[cite: 2]
        ),
      ),
    );
  }
}

// ==========================================
// 4. كارت التمرين (يتم تحديده)
// ==========================================
class WorkoutItemCard extends StatelessWidget {
  final WorkoutItemModel workout;
  final AppLocalizations l10n;
  
  const WorkoutItemCard({Key? key, required this.workout, required this.l10n}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AssignWorkoutProvider>();
    final isSelected = provider.selectedWorkoutId == workout.id;

    return GestureDetector(
      onTap: () => provider.selectWorkout(workout.id),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: isSelected ? Border.all(color: AppColors.primary, width: 2) : Border.all(color: Colors.transparent, width: 2), //[cite: 2]
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4))],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(color: isSelected ? AppColors.primary : AppColors.lightBlueWhite, borderRadius: BorderRadius.circular(12)), //[cite: 2]
                  child: Icon(Icons.fitness_center, color: isSelected ? Colors.white : AppColors.primary, size: 24), //[cite: 2]
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(color: AppColors.lightBlueWhite, borderRadius: BorderRadius.circular(12)), //[cite: 2]
                  child: Row(
                    children: [
                      const Icon(Icons.timer_outlined, color: AppColors.primary, size: 14), //[cite: 2]
                      const SizedBox(width: 4),
                      Text('${workout.durationMin} ${l10n.min}', style: AppTextStyles.label10Blue.copyWith(fontWeight: FontWeight.w800)), //[cite: 1]
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(workout.title, style: AppTextStyles.cardTitle18), //[cite: 1]
            const SizedBox(height: 8),
            Text(workout.description, style: AppTextStyles.body14Height), //[cite: 1]
            const SizedBox(height: 16),
            Row(
              children: [
                const Icon(Icons.list_alt, color: AppColors.iconGrey, size: 16), //[cite: 2]
                const SizedBox(width: 4),
                Text('${workout.exerciseCount} ${l10n.exercises}', style: AppTextStyles.label10GreyDark.copyWith(fontSize: 11)), //[cite: 1]
                const SizedBox(width: 16),
                const Icon(Icons.show_chart, color: AppColors.iconGrey, size: 16), //[cite: 2]
                const SizedBox(width: 4),
                Text(workout.intensityTag, style: AppTextStyles.label10Blue), //[cite: 1]
                const Spacer(),
                Icon(
                  isSelected ? Icons.check_circle : Icons.radio_button_unchecked,
                  color: isSelected ? AppColors.primary : AppColors.borderGrey, //[cite: 2]
                  size: 24,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 5. كارت التاريخ
// ==========================================
class ScheduleDateCard extends StatelessWidget {
  final AppLocalizations l10n;
  const ScheduleDateCard({Key? key, required this.l10n}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AssignWorkoutProvider>();

    return GestureDetector(
      onTap: () async {
        final date = await showDatePicker(
          context: context,
          initialDate: provider.selectedDate,
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(const Duration(days: 365)),
        );
        if (date != null) provider.setDate(date);
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(l10n.assignedDate, style: AppTextStyles.label10GreyDark), //[cite: 1]
                const SizedBox(height: 4),
                Text(provider.getFormattedDate(), style: AppTextStyles.cardTitle18), //[cite: 1]
              ],
            ),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: const Color(0xFFF1F4F8), borderRadius: BorderRadius.circular(12)),
              child: const Icon(Icons.calendar_today_outlined, color: AppColors.primary), //[cite: 2]
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 6. زر الإرسال المتدرج (Gradient Submit Button)
// ==========================================
class GradientSubmitButton extends StatelessWidget {
  final AppLocalizations l10n;
  final String clientName;

  const GradientSubmitButton({Key? key, required this.l10n, required this.clientName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AssignWorkoutProvider>();
    final isReady = provider.selectedWorkoutId != null;

    return GestureDetector(
      onTap: isReady ? () => provider.submitAssignment() : null,
      child: Container(
        width: double.infinity,
        height: 56,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isReady 
                ? const [Color(0xFF3B82F6), Color(0xFF60A5FA)] // تدرج أزرق ساطع
                : [AppColors.iconGrey, AppColors.borderGrey], //[cite: 2]
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(28),
          boxShadow: isReady ? [
            BoxShadow(color: AppColors.primary.withOpacity(0.3), blurRadius: 15, offset: const Offset(0, 5)) //[cite: 2]
          ] : null,
        ),
        child: Center(
          child: provider.isSubmitting
              ? const CircularProgressIndicator(color: Colors.white)
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.send_outlined, color: Colors.white, size: 20),
                    const SizedBox(width: 8),
                    Text('${l10n.assignTo} $clientName', style: AppTextStyles.primaryButton16), //[cite: 1]
                  ],
                ),
        ),
      ),
    );
  }
}