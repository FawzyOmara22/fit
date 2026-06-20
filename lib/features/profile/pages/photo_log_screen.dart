import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/features/profile/widgets/photo_log_widgets.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';


class PhotoLogScreen extends StatelessWidget {
  const PhotoLogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    // داتا مؤقتة لصور التاريخ القديم
    final List<Map<String, String>> recentPhotos = [
      {'image': 'https://images.unsplash.com/photo-1581009146145-b5ef050c2e1e?q=80&w=500&auto=format&fit=crop', 'date': 'Oct 12'},
      {'image': 'https://images.unsplash.com/photo-1534438327276-14e5300c3a48?q=80&w=500&auto=format&fit=crop', 'date': 'Sep 28'},
      {'image': 'https://images.unsplash.com/photo-1571019614242-c5c5dee9f50b?q=80&w=500&auto=format&fit=crop', 'date': 'Sep 14'},
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: AppColors.primary),
          onPressed: () => Navigator.pop(context), // لغلق الشاشة
        ),
        title: Text(l10n.photoLog, style: AppTextStyles.trainAppBar20),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined, color: AppColors.primary),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CaptureProgressBox(),
            const SizedBox(height: 24),
            
            CustomLogField(
              title: l10n.logDate,
              hintText: l10n.todayOct24,
              icon: Icons.calendar_month_outlined,
            ),
            const SizedBox(height: 16),
            
            CustomLogField(
              title: l10n.currentWeight,
              hintText: l10n.addWeightLbs,
              icon: Icons.monitor_weight_outlined,
            ),
            const SizedBox(height: 16),
            
            CustomLogField(
              title: l10n.trainingNotes,
              hintText: l10n.howAreYouFeeling,
              isTextArea: true,
            ),
            const SizedBox(height: 32),
            
            // قسم التاريخ الحديث (Recent History)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(l10n.recentHistory.toUpperCase(), style: AppTextStyles.profileSectionTitle10),
                Text(l10n.viewAll.toUpperCase(), style: AppTextStyles.profileViewAll10),
              ],
            ),
            const SizedBox(height: 16),
            
            SizedBox(
              height: 140, // ارتفاع كروت الصور
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: recentPhotos.length,
                itemBuilder: (context, index) {
                  return RecentHistoryCard(
                    imageUrl: recentPhotos[index]['image']!,
                    dateText: recentPhotos[index]['date']!,
                  );
                },
              ),
            ),
            const SizedBox(height: 40),
            
            // زرار الحفظ الأزرق
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
                  elevation: 4, // ظل خفيف زي الصورة
                  shadowColor: AppColors.primary.withOpacity(0.4),
                ),
                child: Text(l10n.savePhoto, style: AppTextStyles.primaryButton16),
              ),
            ),
            const SizedBox(height: 40), // مساحة سفلية
          ],
        ),
      ),
    );
  }
}