import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';

class FiltersBottomSheet extends StatefulWidget {
  // 👇 ضفنا المتغيرات دي عشان نحتفظ باختيارات اليوزر السابقة
  final String initialMuscle;
  final String initialEquipment;

  const FiltersBottomSheet({
    Key? key, 
    this.initialMuscle = 'All', 
    this.initialEquipment = 'All'
  }) : super(key: key);

  @override
  State<FiltersBottomSheet> createState() => _FiltersBottomSheetState();
}

class _FiltersBottomSheetState extends State<FiltersBottomSheet> {
  late String _selectedMuscle; 
  late String _selectedEquipment;

  @override
  void initState() {
    super.initState();
    // 👇 سحب القيم المبدئية عند فتح الشيت
    _selectedMuscle = widget.initialMuscle;
    _selectedEquipment = widget.initialEquipment;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 24),
      decoration: const BoxDecoration(
        color: AppColors.background, 
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Drag Handle
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.borderDark,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                l10n.filterTitle,
                style: AppTextStyles.heading24.copyWith(
                  fontWeight: FontWeight.w900,
                  letterSpacing: -0.60,
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: AppColors.surfaceColor, 
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.close, size: 20, color: AppColors.darkCharcoal),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),

          // Muscle Group Section
          Text(
            l10n.filterMuscleGroup,
            style: AppTextStyles.label10GreyDark.copyWith(letterSpacing: 1.0),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8, 
            runSpacing: 12, 
            children: [
              _buildFilterChip(l10n.filterAll, 'All', true),
              _buildFilterChip(l10n.filterChest, 'Chest', true),
              _buildFilterChip(l10n.filterBack, 'Back', true),
              _buildFilterChip(l10n.filterLegs, 'Legs', true),
              _buildFilterChip(l10n.filterShoulders, 'Shoulders', true),
              _buildFilterChip(l10n.filterArms, 'Arms', true),
            ],
          ),
          const SizedBox(height: 32),

          // Equipment Section
          Text(
            l10n.filterEquipment,
            style: AppTextStyles.label10GreyDark.copyWith(letterSpacing: 1.0),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 12,
            children: [
              _buildFilterChip(l10n.filterAll, 'All', false),
              _buildFilterChip(l10n.filterBarbell, 'Barbell', false),
              _buildFilterChip(l10n.filterDumbbell, 'Dumbbell', false),
              _buildFilterChip(l10n.filterMachine, 'Machine', false),
              _buildFilterChip(l10n.filterCables, 'Cables', false),
              _buildFilterChip(l10n.filterBodyweight, 'Bodyweight', false),
            ],
          ),
          const SizedBox(height: 40),
          
          const Divider(height: 1, color: AppColors.divider),
          const SizedBox(height: 24),

          // Bottom Actions
          Row(
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    _selectedMuscle = 'All';
                    _selectedEquipment = 'All';
                  });
                },
                child: Text(
                  l10n.filterClearAll,
                  style: AppTextStyles.textButton14Spacing.copyWith(
                    color: AppColors.textGrey, 
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      // 👇 عند التطبيق، بنقفل الشيت ونرجع الداتا للشاشة الأساسية
                      Navigator.pop(context, {
                        'muscle': _selectedMuscle,
                        'equipment': _selectedEquipment,
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                      elevation: 0,
                    ),
                    child: Text(
                      l10n.filterApply,
                      style: AppTextStyles.primaryButton16.copyWith(
                        fontSize: 14,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String localizedText, String internalValue, bool isMuscleGroup) {
    bool isSelected = isMuscleGroup ? _selectedMuscle == internalValue : _selectedEquipment == internalValue;

    return GestureDetector(
      onTap: () {
        setState(() {
          if (isMuscleGroup) {
            _selectedMuscle = internalValue;
          } else {
            _selectedEquipment = internalValue;
          }
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.surfaceColor,
          borderRadius: BorderRadius.circular(20), 
        ),
        child: Text(
          localizedText,
          style: AppTextStyles.body14NoHeight.copyWith(
            color: isSelected ? AppColors.white : AppColors.darkCharcoal,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}