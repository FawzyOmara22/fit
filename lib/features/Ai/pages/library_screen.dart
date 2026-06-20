// lib/features/library/screens/library_screen.dart

import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart'; 
import 'package:kinetic/core/theme/app_text_style.dart'; 
 // حزمة الترجمة
import 'package:kinetic/features/Ai/widgets/library_widgets.dart';
import 'package:kinetic/features/train/pages/train_screen.dart';


class KineticLibraryScreen extends StatelessWidget {
  const KineticLibraryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBackground,
        elevation: 0,
        leading: const Icon(Icons.menu, color: AppColors.darkCharcoal),
        title: Text(l10n.library, style: AppTextStyles.appBarTitle.copyWith(fontSize: 20)),
        centerTitle: false,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.search, color: AppColors.primary),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchBarWidget(),
            const SizedBox(height: 8),
            const CategoryChips(),
            
            // --- القسم الأول: Get Strong ---
            SectionHeader(
              overline: l10n.elite_foundations,
              title: l10n.get_strong,
              actionText: '${l10n.view_all}  ', 
              onActionTap: () {},
            ),
            FeaturedProgramCard(
              onStartTap: () {
               Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const TrainScreen(),
      ),
    );
              },
            ),
            const SizedBox(height: 16),
            SmallHorizontalCard(
              title: "The Deadlift Specialist",
              subtitle: "Master the king of all lifts.",
              meta: "4 ${l10n.weeks} • ${l10n.advanced}",
              imageUrl: "https://images.unsplash.com/photo-1541534741688-6078c6bfb5c5?q=80&w=200", 
            ),
            SmallHorizontalCard(
              title: "Functional Force",
              subtitle: "Build explosive strength for...",
              meta: "6 ${l10n.weeks} • ${l10n.all_levels}",
              imageUrl:"https://images.unsplash.com/photo-1541534741688-6078c6bfb5c5?q=80&w=200", 
            ),

            // --- القسم الثاني: Build Muscle ---
            SectionHeader(
              overline: l10n.hypertrophy_series,
              title: l10n.build_muscle,
              actionText: '${l10n.browse_all}  ',
              onActionTap: () {},
            ),
            SizedBox(
              height: 310, 
              child: ListView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                children: const [
                  VerticalProgramCard(
                    title: "Hypertrophy Max",
                    duration: "12 Weeks",
                    days: "5 p/w",
                    imageUrl: "https://images.unsplash.com/photo-1581009146145-b5ef050c2e1e?q=80&w=400", 
                  ),
                  VerticalProgramCard(
                    title: "Classic Bodybuilding",
                    duration: "8 Weeks",
                    days: "4 p/w",
                    imageUrl: "https://images.unsplash.com/photo-1571019614242-c5c5dee9f50b?q=80&w=400", 
                  ),
                  SizedBox(width: 16), 
                ],
              ),
            ),

            // --- القسم الثالث: Train at Home ---
            SectionHeader(
              overline: l10n.no_gym_needed,
              title: l10n.train_at_home,
              actionText: "", 
            ),
            const GlassmorphismCard(),
            
            const SizedBox(height: 40), 
          ],
        ),
      ),
    );
  }
}