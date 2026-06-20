// lib/features/Ai/widgets/library_widgets.dart

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart'; 
import 'package:kinetic/core/theme/app_text_style.dart'; 

// =====================================
// 1. شريط البحث
// =====================================
class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!; 
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: l10n.search_hint,
          hintStyle: AppTextStyles.discoverSearchHint16,
          prefixIcon: const Icon(Icons.search, color: AppColors.iconGrey, size: 20),
          filled: true,
          fillColor: AppColors.inputBackground,
          contentPadding: const EdgeInsets.symmetric(vertical: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

// =====================================
// 2. الفئات (Chips)
// =====================================
class CategoryChips extends StatelessWidget {
  const CategoryChips({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final categories = [l10n.all_programs, l10n.strength, l10n.hypertrophy];
    
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          bool isSelected = index == 0;
          return Container(
            margin: const EdgeInsets.only(right: 8),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primary : AppColors.inputBackground,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                categories[index],
                style: TextStyle(
                  color: isSelected ? Colors.white : AppColors.textGrey,
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                  fontFamily: 'Inter',
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// =====================================
// 3. عنوان القسم (تم التعديل هنا لحل مشكلة الـ Overflow الكبيرة)
// =====================================
class SectionHeader extends StatelessWidget {
  final String overline;
  final String title;
  final String actionText;
  final VoidCallback? onActionTap;

  const SectionHeader({Key? key, required this.overline, required this.title, required this.actionText, this.onActionTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded( // <-- تم إضافة Expanded هنا لضمان عدم خروج النص عن الشاشة
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(overline.toUpperCase(), style: AppTextStyles.sectionLabel, maxLines: 1, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 4),
                Text(title, style: AppTextStyles.sectionTitle, maxLines: 1, overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
          if (actionText.isNotEmpty)
            GestureDetector(
              onTap: onActionTap,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Text(actionText, style: AppTextStyles.addExSeeAll),
                    const SizedBox(width: 2),
                    const Icon(Icons.arrow_forward, color: AppColors.primary, size: 14),
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}

// =====================================
// 4. الكارت الرئيسي (Featured)
// =====================================
class FeaturedProgramCard extends StatelessWidget {
  final VoidCallback? onStartTap;

  const FeaturedProgramCard({Key? key, this.onStartTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: AppColors.darkCharcoal5, blurRadius: 10, offset: Offset(0, 4))],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 200,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              color: AppColors.nearBlack,
              image: DecorationImage(image: NetworkImage('https://images.unsplash.com/photo-1534438327276-14e5300c3a48?q=80&w=600'), fit: BoxFit.cover),
            ),
            padding: const EdgeInsets.all(16),
            alignment: Alignment.bottomLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(12)),
                  child: Text("8 ${l10n.weeks}", style: AppTextStyles.prTag10),
                ),
                const SizedBox(height: 8),
                const Text("Powerlifting Foundations", style: AppTextStyles.discoverProgramTitle24, maxLines: 2, overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(l10n.frequency, style: AppTextStyles.cardLabel, maxLines: 1, overflow: TextOverflow.ellipsis),
                          const SizedBox(height: 4),
                          const Text("4 Days / Week", style: AppTextStyles.cardTitle14, maxLines: 1, overflow: TextOverflow.ellipsis),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(l10n.level, style: AppTextStyles.cardLabel, maxLines: 1, overflow: TextOverflow.ellipsis),
                          const SizedBox(height: 4),
                          const Text("Intermediate", style: AppTextStyles.cardTitle14, maxLines: 1, overflow: TextOverflow.ellipsis),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.primaryLight,
                    borderRadius: BorderRadius.circular(24),
                    gradient: const LinearGradient(colors: [Color(0xFF4A8CF6), Color(0xFF2361E3)]),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                    ),
                    onPressed: onStartTap ?? () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(child: Text(l10n.start_program, style: AppTextStyles.btnWhiteText, maxLines: 1, overflow: TextOverflow.ellipsis)),
                        const SizedBox(width: 8),
                        const Icon(Icons.bolt, color: Colors.white, size: 18),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 4),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// =====================================
// 5. الكروت الأفقية الصغيرة
// =====================================
class SmallHorizontalCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String meta;
  final String imageUrl;

  const SmallHorizontalCard({Key? key, required this.title, required this.subtitle, required this.meta, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: AppColors.darkCharcoal5, blurRadius: 8, offset: Offset(0, 2))],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(imageUrl, width: 70, height: 70, fit: BoxFit.cover),
          ),
          const SizedBox(width: 16),
          Expanded( // <-- يحمي من أي Overflow
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(title, style: AppTextStyles.addExCardTitle, maxLines: 1, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 4),
                Text(subtitle, style: AppTextStyles.caption12.copyWith(color: AppColors.textGrey), maxLines: 1, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 8),
                Text(meta, style: AppTextStyles.smallCaption11, maxLines: 1, overflow: TextOverflow.ellipsis), 
              ],
            ),
          ),
          const SizedBox(width: 8), 
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(color: AppColors.lightBlueWhite, shape: BoxShape.circle),
            child: const Icon(Icons.play_arrow, color: AppColors.primary, size: 20),
          )
        ],
      ),
    );
  }
}

// =====================================
// 6. الكارت العمودي (تم التأمين هنا أيضاً)
// =====================================
class VerticalProgramCard extends StatelessWidget {
  final String title;
  final String duration;
  final String days;
  final String imageUrl;

  const VerticalProgramCard({Key? key, required this.title, required this.duration, required this.days, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      width: 300,
      margin: const EdgeInsets.only(left: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: AppColors.darkCharcoal5, blurRadius: 10, offset: Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 160,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              image: DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.cardTitle18, maxLines: 1, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(l10n.duration, style: AppTextStyles.cardLabel, maxLines: 1, overflow: TextOverflow.ellipsis),
                          const SizedBox(height: 2),
                          Text(duration, style: AppTextStyles.cardTitle14, maxLines: 1, overflow: TextOverflow.ellipsis),
                        ],
                      ),
                    ),
                    const SizedBox(width: 4), // حماية إضافية
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(l10n.days, style: AppTextStyles.cardLabel, maxLines: 1, overflow: TextOverflow.ellipsis),
                          const SizedBox(height: 2),
                          Text(days, style: AppTextStyles.cardTitle14, maxLines: 1, overflow: TextOverflow.ellipsis),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.inputBackground,
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () {},
                    child: Text(l10n.view_details, style: AppTextStyles.body14BlueNoHeight, maxLines: 1, overflow: TextOverflow.ellipsis),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

// =====================================
// 7. الكارت الزجاجي 
// =====================================
class GlassmorphismCard extends StatelessWidget {
  const GlassmorphismCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      height: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: const DecorationImage(
          image: NetworkImage('https://images.unsplash.com/photo-1518611012118-696072aa579a?q=80&w=600'),
          fit: BoxFit.cover,
        ),
      ),
      alignment: Alignment.bottomCenter,
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(16)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: const EdgeInsets.all(20),
            color: Colors.white.withOpacity(0.2), 
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(color: const Color(0xFFFF5EEA), borderRadius: BorderRadius.circular(8)),
                  child: Text(l10n.editors_choice, style: AppTextStyles.prTag10),
                ),
                const SizedBox(height: 12),
                const Text("Minimalist\nBodyweight 2.0", style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w900, height: 1.1)),
                const SizedBox(height: 8),
                const Text("No equipment. No excuses. 45 days to complete transformation using only your own physics.", style: TextStyle(color: Colors.white, fontSize: 14)),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: AppColors.darkCharcoal,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                    ),
                    onPressed: () {},
                    child: Text(l10n.explore_program, style: const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}