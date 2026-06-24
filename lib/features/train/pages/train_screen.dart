import 'package:flutter/material.dart';
import 'package:kinetic/features/train/logic/train_provider.dart';
import 'package:kinetic/features/train/widgets/train_stats_widgets.dart';
import 'package:provider/provider.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/features/Ai/pages/library_screen.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';
import 'active_session_screen.dart';



class TrainScreen extends StatefulWidget {
  const TrainScreen({Key? key}) : super(key: key);

  @override
  State<TrainScreen> createState() => _TrainScreenState();
}

class _TrainScreenState extends State<TrainScreen> {
  
  @override
  void initState() {
    super.initState();
    // تحميل الداتا أول ما الشاشة تفتح
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TrainProvider>().loadTrainingStats();
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        titleSpacing: 20,
        title: Row(
          children: [
            const CircleAvatar(
              radius: 16,
              backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=11'),
            ),
            const SizedBox(width: 12),
            Text(l10n.trainTitle, style: AppTextStyles.trainAppBar20),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined, color: AppColors.darkCharcoal),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            
            // 👇 استدعاء الويدجتس المنفصلة بكل نضافة هنا
            const Row(
              children: [
                Expanded(child: StreakCardWidget()),
                SizedBox(width: 16),
                Expanded(child: VolumeCardWidget()),
              ],
            ),
            
            const SizedBox(height: 24),
            _buildEmptyWorkoutButton(l10n),
            const SizedBox(height: 32),
            _buildSectionHeader(l10n.trainFolders, l10n.trainSeeAll),
            const SizedBox(height: 16),
            _buildFoldersGrid(context, l10n),
            const SizedBox(height: 32),
            _buildSectionHeader(l10n.trainMyRoutines, '+'),
            const SizedBox(height: 16),
            _buildRoutineList(context),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  // ---------------------------------------------------------
  // باقي الميثودز اللي في الصفحة زي ما هي بدون تغيير 
  // ---------------------------------------------------------
  
  Widget _buildEmptyWorkoutButton(AppLocalizations l10n) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(color: AppColors.primary.withOpacity(0.3), blurRadius: 15, offset: const Offset(0, 8)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(l10n.trainStartEmptyWorkout, style: AppTextStyles.trainEmptyWorkout24),
              const SizedBox(height: 4),
              Text(l10n.trainLogFreeForm, style: AppTextStyles.trainEmptyWorkoutSub14),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.white.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.add, color: AppColors.white, size: 28),
          )
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, String action) {
    bool isPlus = action == '+';
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppTextStyles.trainSectionTitle24),
        if (isPlus)
          Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(color: AppColors.lightGray, shape: BoxShape.circle),
            child: const Icon(Icons.add, color: AppColors.textGrey, size: 20),
          )
        else
          Text(action, style: AppTextStyles.trainSeeAll12),
      ],
    );
  }

  Widget _buildFoldersGrid(BuildContext context, AppLocalizations l10n) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.6,
      children: [
        _buildFolderCard(Icons.folder, 'Powerlifting', AppColors.primary),
        _buildFolderCard(Icons.flash_on, 'Conditioning', AppColors.primary),
        _buildFolderCard(Icons.history, 'Hypertrophy', AppColors.primary),
        _buildFolderCard(Icons.add_circle_outline, l10n.trainNewFolder, AppColors.iconGrey, isNew: true, onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const KineticLibraryScreen(),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildFolderCard(IconData icon, String title, Color iconColor, {bool isNew = false, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isNew ? Colors.transparent : AppColors.white,
          border: isNew ? Border.all(color: AppColors.lightGray, width: 2) : null,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: iconColor, size: 28),
            const Spacer(),
            Text(title, style: isNew ? AppTextStyles.trainNewFolder14 : AppTextStyles.trainFolderText14),
          ],
        ),
      ),
    );
  }

  Widget _buildRoutineList(BuildContext context) {
    final routines = [
      {'last': 'LAST PERFORMED: 2 DAYS AGO', 'title': 'Push Day A', 'desc': 'Chest, Shoulders, Triceps', 'time': '65m', 'ex': '6 Exercises', 'isActive': true},
      {'last': 'LAST PERFORMED: 4 DAYS AGO', 'title': 'Pull Day Volume', 'desc': 'Back, Biceps, Rear Delts', 'time': '55m', 'ex': '5 Exercises', 'isActive': true},
      {'last': 'LAST PERFORMED: 1 WEEK AGO', 'title': 'Legs Heavy', 'desc': 'Quads, Hamstrings, Calves', 'time': '75m', 'ex': '7 Exercises', 'isActive': false},
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: routines.length,
      itemBuilder: (context, index) {
        final item = routines[index];
        bool isActive = item['isActive'] as bool;
        
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item['last'] as String, style: AppTextStyles.trainRoutineLastPerformed10),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(item['title'] as String, style: AppTextStyles.trainRoutineTitle20),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ActiveSessionScreen(),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        gradient: isActive ? AppColors.primaryGradient : null,
                        color: isActive ? null : AppColors.lightGray,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.play_arrow, color: isActive ? AppColors.white : AppColors.darkCharcoal, size: 24),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(item['desc'] as String, style: AppTextStyles.trainRoutineMuscles14),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Icon(Icons.timer_outlined, size: 16, color: AppColors.iconGrey),
                  const SizedBox(width: 4),
                  Text(item['time'] as String, style: AppTextStyles.trainRoutineMeta12),
                  const SizedBox(width: 16),
                  const Icon(Icons.fitness_center, size: 16, color: AppColors.iconGrey),
                  const SizedBox(width: 4),
                  Text(item['ex'] as String, style: AppTextStyles.trainRoutineMeta12),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}