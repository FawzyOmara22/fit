import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';


// ==========================================
// 1. كارت الصورة (Before / After)
// ==========================================
class TransformationImageCard extends StatelessWidget {
  final String imageUrl;
  final String badgeText;
  final bool isAfter; // لو true الكارت هياخد اللون الأزرق للتاج
  final String dateText;
  final String weightText;

  const TransformationImageCard({
    Key? key,
    required this.imageUrl,
    required this.badgeText,
    this.isAfter = false,
    required this.dateText,
    required this.weightText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: AppColors.darkCharcoal, // خلفية مؤقتة لو الصورة لسه بتحمل
        image: imageUrl.isNotEmpty
            ? DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: Stack(
        children: [
          // جراديانت أسود من تحت عشان الكلام يبان بوضوح
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 120,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(24)),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black.withOpacity(0.8), Colors.transparent],
                ),
              ),
            ),
          ),
          
          // Badge (Before/After)
          Positioned(
            top: 16,
            left: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                color: isAfter ? AppColors.primary : AppColors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                badgeText.toUpperCase(),
                style: AppTextStyles.addExTagEquipment.copyWith(
                  color: isAfter ? AppColors.white : AppColors.darkCharcoal,
                ),
              ),
            ),
          ),
          
          // Refresh Icon
          Positioned(
            top: 16,
            right: 16,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.sync, color: AppColors.white, size: 20),
            ),
          ),
          
          // النصوص السفلية (التاريخ والوزن)
          Positioned(
            bottom: 20,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(dateText, style: AppTextStyles.trainRoutineTitle20.copyWith(color: AppColors.white)),
                const SizedBox(height: 4),
                Text(weightText, style: AppTextStyles.body14NoHeight.copyWith(color: AppColors.white70)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// 2. كارت إحصائيات التغيير (الرمادي الفاتح)
// ==========================================
class BodyStatsCard extends StatelessWidget {
  final int weightLoss;
  final double bodyFatChange;
  final int consistencyScore;
  final String consistencyLevel;

  const BodyStatsCard({
    Key? key,
    required this.weightLoss,
    required this.bodyFatChange,
    required this.consistencyScore,
    required this.consistencyLevel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.inputBackground, // الرمادي الفاتح
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // الوزن
          Text(l10n.totalWeightLoss.toUpperCase(), style: AppTextStyles.profileStatLabel10),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text('$weightLoss', style: AppTextStyles.heading36Black),
              const SizedBox(width: 8),
              Text(l10n.lbs.toUpperCase(), style: AppTextStyles.profileVolumeUnit18.copyWith(color: AppColors.darkCharcoal)),
            ],
          ),
          const SizedBox(height: 24),
          
          // نسبة الدهون
          Text(l10n.bodyFatChange.toUpperCase(), style: AppTextStyles.profileStatLabel10),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text('$bodyFatChange', style: AppTextStyles.heading36Black),
              const SizedBox(width: 8),
              Text('%', style: AppTextStyles.profileVolumeUnit18.copyWith(color: AppColors.darkCharcoal)),
            ],
          ),
          const SizedBox(height: 24),
          
          // الكارت الأبيض الداخلي (Consistency)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(16)),
            child: Row(
              children: [
                // أيقونة خلفيتها بمبي
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFD6F4), // لون بمبي فاتح
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.show_chart, color: Color(0xFFC81D9D), size: 20), // لون أيقونة بمبي غامق
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(l10n.consistencyScore.toUpperCase(), style: AppTextStyles.smallCaption11),
                    const SizedBox(height: 4),
                    Text('$consistencyScore% ${consistencyLevel.toUpperCase()}', style: AppTextStyles.actionTitle.copyWith(fontWeight: FontWeight.w900)),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// ==========================================
// 3. الزراير (Save & Share)
// ==========================================
class BodyActionButtons extends StatelessWidget {
  const BodyActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      children: [
        // زرار الحفظ (أزرق)
        SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton.icon(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryLight, // أزرق فاتح شوية زي الصورة
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
              elevation: 0,
            ),
            icon: const Icon(Icons.photo_library_outlined, color: AppColors.white),
            label: Text(l10n.saveTransformation, style: AppTextStyles.primaryButton16),
          ),
        ),
        const SizedBox(height: 16),
        // زرار المشاركة (رمادي)
        SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton.icon(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.divider, // لون رمادي فاتح
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
              elevation: 0,
            ),
            icon: const Icon(Icons.ios_share, color: AppColors.primary),
            label: Text(l10n.shareCollage, style: AppTextStyles.primaryButton16.copyWith(color: AppColors.primary)),
          ),
        ),
      ],
    );
  }
}