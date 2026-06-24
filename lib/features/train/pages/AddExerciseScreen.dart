import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/train/pages/filters_bottom_sheet.dart';
import 'package:kinetic/features/train/widgets/add_exercise_widgets.dart';
// 👇 استدعاء ملف الفلاتر (تأكد من المسار الصحيح عندك)


class AddExerciseScreen extends StatefulWidget {
  const AddExerciseScreen({Key? key}) : super(key: key);

  @override
  State<AddExerciseScreen> createState() => _AddExerciseScreenState();
}

class _AddExerciseScreenState extends State<AddExerciseScreen> {
  // داتا التمارين الأساسية (يفضل متبقاش متعدلة عشان نفلتر منها براحتنا)
  final List<Map<String, dynamic>> _allExercises = [
    {
      'id': '1', 'title': 'Barbell Bench Press', 'muscle': 'CHEST', 'equipment': 'BARBELL',
      'imageUrl': 'https://images.unsplash.com/photo-1571019614242-c5c5dee9f50b?q=80&w=200&auto=format&fit=crop',
    },
    {
      'id': '2', 'title': 'Cable Crossover', 'muscle': 'CHEST', 'equipment': 'CABLES',
      'imageUrl': 'https://images.unsplash.com/photo-1534438327276-14e5300c3a48?q=80&w=200&auto=format&fit=crop',
    },
    {
      'id': '3', 'title': 'Barbell Back Squat', 'muscle': 'LEGS', 'equipment': 'BARBELL',
      'imageUrl': 'https://images.unsplash.com/photo-1541534741688-6078c6bfb5c5?q=80&w=200&auto=format&fit=crop',
    },
    {
      'id': '4', 'title': 'Dumbbell Overhead Press', 'muscle': 'SHOULDER', 'equipment': 'DUMBBELL',
      'imageUrl': 'https://images.unsplash.com/photo-1581009146145-b5ef050c2e1e?q=80&w=200&auto=format&fit=crop',
    },
    {
      'id': '5', 'title': 'Kettlebell Swing', 'muscle': 'GLUTES', 'equipment': 'KETTLEBELL',
      'imageUrl': 'https://images.unsplash.com/photo-1519500528352-2d1460418d41?q=80&w=200&auto=format&fit=crop',
    },
    {
      'id': '6', 'title': 'Plank (Weighted)', 'muscle': 'CORE', 'equipment': 'PLATES',
      'imageUrl': 'https://images.unsplash.com/photo-1566241440091-ec10de8db2e1?q=80&w=200&auto=format&fit=crop',
    },
  ];

  // ================= State Variables =================
  final Set<String> _selectedExerciseIds = {};
  
  // 1. المتغيرات الخاصة بالبحث والفلترة
  List<Map<String, dynamic>> _filteredExercises = [];
  String _searchQuery = '';
  String _muscleFilter = 'All';
  String _equipmentFilter = 'All';

  @override
  void initState() {
    super.initState();
    // في البداية بنعرض كل التمارين
    _filteredExercises = List.from(_allExercises);
  }

  // 2. دالة تشغيل الفلترة والبحث
  void _runFilters() {
    List<Map<String, dynamic>> results = _allExercises;

    // أ. فلترة بالبحث (النص)
    if (_searchQuery.isNotEmpty) {
      results = results.where((ex) => 
        ex['title'].toString().toLowerCase().contains(_searchQuery.toLowerCase())
      ).toList();
    }

    // ب. فلترة بالعضلة (لو مش All)
    if (_muscleFilter != 'All') {
      results = results.where((ex) => 
        ex['muscle'].toString().toUpperCase() == _muscleFilter.toUpperCase()
      ).toList();
    }

    // ج. فلترة بالأداة (لو مش All)
    if (_equipmentFilter != 'All') {
      results = results.where((ex) => 
        ex['equipment'].toString().toUpperCase() == _equipmentFilter.toUpperCase()
      ).toList();
    }

    // تحديث الشاشة بالنتائج الجديدة
    setState(() {
      _filteredExercises = results;
    });
  }

  // 3. فتح نافذة الفلاتر السفلية
  Future<void> _openFiltersSheet() async {
    final result = await showModalBottomSheet<Map<String, dynamic>>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => FiltersBottomSheet(
        // بنمرر الفلاتر الحالية عشان يتعملها Select تلقائي في الشيت
        initialMuscle: _muscleFilter,
        initialEquipment: _equipmentFilter,
      ),
    );

    // لو اليوزر ضغط Apply ورجع بداتا
    if (result != null) {
      setState(() {
        _muscleFilter = result['muscle'] ?? 'All';
        _equipmentFilter = result['equipment'] ?? 'All';
      });
      _runFilters(); // نشغل الفلتر بعد تحديث القيم
    }
  }

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
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _buildAppBar(context, l10n),
      body: Stack(
        children: [
          Positioned.fill(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  
                  // 👇 هنا لازم تتأكد إن الـ ExerciseSearchBar بيستقبل منك دالة onChanged
                  ExerciseSearchBar(
                    onChanged: (value) {
                      _searchQuery = value;
                      _runFilters(); // نشغل الفلتر مع كل حرف بيتكتب
                    },
                  ), 
                  const SizedBox(height: 16),
                  
                  // 👇 ربط زر الفلتر بفتح البوتوم شيت
               ExerciseFiltersButton(
  onTap: _openFiltersSheet, // 👈 بنمرر الدالة هنا مباشرة
),
                  const SizedBox(height: 32),
                  
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
                  
                  // لو مفيش نتايج، نعرض رسالة مناسبة
                  if (_filteredExercises.isEmpty)
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Text(
                          "No exercises found.",
                          style: AppTextStyles.body14NoHeight.copyWith(color: AppColors.textGrey),
                        ),
                      ),
                    )
                  else
                    // 👇 هنا بنعرض الـ _filteredExercises بدل الـ _exercises
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _filteredExercises.length,
                      separatorBuilder: (context, index) => const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final exercise = _filteredExercises[index];
                        final isSelected = _selectedExerciseIds.contains(exercise['id']);
                        
                        return ExerciseCardWidget(
                          exercise: exercise,
                          isSelected: isSelected,
                          onTap: () => _toggleSelection(exercise['id']),
                        );
                      },
                    ),
                  const SizedBox(height: 100), 
                ],
              ),
            ),
          ),
          
          if (_selectedExerciseIds.isNotEmpty)
            Align(
              alignment: Alignment.bottomCenter,
              child: AddExercisesBottomButton(
                selectedCount: _selectedExerciseIds.length,
                onPressed: () {
                  final selectedExercises = _allExercises.where((ex) {
                    return _selectedExerciseIds.contains(ex['id']);
                  }).toList();

                  Navigator.pop(context, selectedExercises);
                },
              ),
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
}