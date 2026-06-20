import 'dart:ui'; // 👈 ضرورية جداً لعمل تأثير الـ Blur
import 'package:flutter/material.dart';

// لا تنسَ استدعاء ملفاتك هنا
import 'package:kinetic/core/l10n/app_localizations.dart'; // تأكد من المسار الصحيح
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

// 👇 التعديل: استدعاء ملف الـ Bottom Sheet الخاص بالفلاتر
import 'filters_bottom_sheet.dart'; 

class AddExerciseScreen extends StatefulWidget {
  const AddExerciseScreen({Key? key}) : super(key: key);

  @override
  State<AddExerciseScreen> createState() => _AddExerciseScreenState();
}

class _AddExerciseScreenState extends State<AddExerciseScreen> {
  // داتا وهمية للتمارين عشان نجرب عليها الشاشة
  final List<Map<String, dynamic>> _exercises = [
    {
      'id': '1',
      'title': 'Barbell Bench Press',
      'muscle': 'CHEST',
      'equipment': 'BARBELL',
      'imageUrl': 'https://images.unsplash.com/photo-1571019614242-c5c5dee9f50b?q=80&w=200&auto=format&fit=crop',
    },
    {
      'id': '2',
      'title': 'Cable Crossover',
      'muscle': 'CHEST',
      'equipment': 'CABLES',
      'imageUrl': 'https://images.unsplash.com/photo-1534438327276-14e5300c3a48?q=80&w=200&auto=format&fit=crop',
    },
    {
      'id': '3',
      'title': 'Barbell Back Squat',
      'muscle': 'LEGS',
      'equipment': 'BARBELL',
      'imageUrl': 'https://images.unsplash.com/photo-1541534741688-6078c6bfb5c5?q=80&w=200&auto=format&fit=crop',
    },
    {
      'id': '4',
      'title': 'Dumbbell Overhead Press',
      'muscle': 'SHOULDER',
      'equipment': 'DUMBBELL',
      'imageUrl': 'https://images.unsplash.com/photo-1581009146145-b5ef050c2e1e?q=80&w=200&auto=format&fit=crop',
    },
    {
      'id': '5',
      'title': 'Kettlebell Swing',
      'muscle': 'GLUTES',
      'equipment': 'KETTLEBELL',
      'imageUrl': 'https://images.unsplash.com/photo-1519500528352-2d1460418d41?q=80&w=200&auto=format&fit=crop',
    },
    {
      'id': '6',
      'title': 'Plank (Weighted)',
      'muscle': 'CORE',
      'equipment': 'PLATES',
      'imageUrl': 'https://images.unsplash.com/photo-1566241440091-ec10de8db2e1?q=80&w=200&auto=format&fit=crop',
    },
  ];

  // Set لتخزين الـ IDs بتاعة التمارين اللي تم اختيارها
  final Set<String> _selectedExerciseIds = {'1', '3', '5'};

  void _toggleSelection(String id) {
    setState(() {
      if (_selectedExerciseIds.contains(id)) {
        _selectedExerciseIds.remove(id);
      } else {
        _selectedExerciseIds.add(id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // استدعاء ملف الترجمة الحقيقي
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _buildAppBar(context, l10n),
      body: Stack(
        children: [
          // المحتوى الأساسي للصفحة
          Positioned.fill(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  _buildSearchBar(l10n),
                  const SizedBox(height: 16),
                  _buildFiltersButton(l10n),
                  const SizedBox(height: 32),
                  
                  // الهيدر الخاص بالتمارين الموصى بها
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(l10n.recommended, style: AppTextStyles.addExSectionTitle),
                      GestureDetector(
                        onTap: () {},
                        child: Text(l10n.seeAll, style: AppTextStyles.addExSeeAll),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  
                  // قائمة الكروت
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _exercises.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final exercise = _exercises[index];
                      final isSelected = _selectedExerciseIds.contains(exercise['id']);
                      
                      return _buildExerciseCard(
                        exercise: exercise,
                        isSelected: isSelected,
                        onTap: () => _toggleSelection(exercise['id']),
                      );
                    },
                  ),
                  
                  // مساحة في الآخر عشان الزرار العائم ميغطيش على آخر كارت
                  const SizedBox(height: 100), 
                ],
              ),
            ),
          ),

          // الزرار الثابت في أسفل الشاشة
          if (_selectedExerciseIds.isNotEmpty)
            Align(
              alignment: Alignment.bottomCenter,
              child: _buildBottomButton(l10n),
            ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context, AppLocalizations l10n) {
    return AppBar(
      backgroundColor: AppColors.background,
      elevation: 0,
      centerTitle: false,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: AppColors.primary),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(l10n.addExerciseTitle, style: AppTextStyles.addExAppBarTitle),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(l10n.cancel, style: AppTextStyles.addExCancelBtn),
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  Widget _buildSearchBar(AppLocalizations l10n) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.inputBackground,
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: l10n.searchExercises,
          hintStyle: AppTextStyles.addExSearchHint,
          prefixIcon: const Icon(Icons.search, color: AppColors.textGrey),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        ),
      ),
    );
  }

  Widget _buildFiltersButton(AppLocalizations l10n) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.divider),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(24),
          // 👇 التعديل هنا: فتح الـ Bottom Sheet عند الضغط على زر Filters
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true, 
              backgroundColor: Colors.transparent, // ضروري عشان الحواف الدائرية
              builder: (context) {
                return BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0), // تأثير البلور
                  child: const FiltersBottomSheet(),
                );
              },
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.tune_rounded, color: AppColors.primary, size: 20),
                const SizedBox(width: 8),
                Text(l10n.filters, style: AppTextStyles.addExFiltersBtn),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildExerciseCard({
    required Map<String, dynamic> exercise,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.divider,
            width: isSelected ? 2 : 1,
          ),
          boxShadow: [
            if (isSelected)
              BoxShadow(
                color: AppColors.primary.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              )
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                exercise['imageUrl'],
                width: 64,
                height: 64,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(exercise['title'], style: AppTextStyles.addExCardTitle),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(exercise['muscle'], style: AppTextStyles.addExTagMuscle),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: Text('•', style: TextStyle(color: AppColors.iconGrey, fontSize: 10)),
                      ),
                      Text(exercise['equipment'], style: AppTextStyles.addExTagEquipment),
                    ],
                  ),
                ],
              ),
            ),
            
            const SizedBox(width: 16),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : AppColors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? AppColors.primary : AppColors.borderDark,
                  width: 1.5,
                ),
              ),
              child: isSelected
                  ? const Icon(Icons.check, color: AppColors.white, size: 18)
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomButton(AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
      decoration: BoxDecoration(
        color: AppColors.background,
        // هذا التدريج خاص بالخلفية لعمل تأثير التلاشي (Fade Effect)
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.background.withOpacity(0.0),
            AppColors.background.withOpacity(0.9),
            AppColors.background,
          ],
          stops: const [0.0, 0.4, 1.0],
        ),
      ),
      child: Container(
        // الحاوية الجديدة الخاصة بعمل تدريج لوني للزر نفسه
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          gradient: LinearGradient(
            colors: [
              AppColors.primary.withOpacity(0.7), 
              AppColors.primary,
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: () {
            // Action for adding exercises
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent, // جعل خلفية الزر شفافة ليظهر التدريج
            shadowColor: Colors.transparent, // إلغاء الظل الافتراضي للزر لأننا أضفناه في الحاوية
            minimumSize: const Size(double.infinity, 56),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28),
            ),
            elevation: 0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.add_circle_outline, color: Colors.white, size: 20),
              const SizedBox(width: 8),
              Text(l10n.addNExercises(_selectedExerciseIds.length), style: AppTextStyles.addExSubmitBtn),
            ],
          ),
        ),
      ),
    );
  }
}