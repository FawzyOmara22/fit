import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';


// ==========================================
// 1. صندوق التقاط الصورة (Capture Box)
// ==========================================
class CaptureProgressBox extends StatelessWidget {
  const CaptureProgressBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      width: double.infinity,
      height: 240,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24),
        // يفضل هنا استخدام باكدج dotted_border لو عايز الخط منقط بالظبط زي الديزاين
        // بس مؤقتاً هنستخدم بوردر رمادي فاتح صلب
        border: Border.all(color: AppColors.divider, width: 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildCircleIcon(Icons.camera_alt_outlined),
              const SizedBox(width: 16),
              _buildCircleIcon(Icons.photo_library_outlined),
            ],
          ),
          const SizedBox(height: 24),
          Text(l10n.captureProgress, style: AppTextStyles.title18Dark),
          const SizedBox(height: 8),
          Text(l10n.frontSideBack, style: AppTextStyles.body14NoHeight),
        ],
      ),
    );
  }

  Widget _buildCircleIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: AppColors.cardSelectedBg, // لون أزرق فاتح جداً
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: AppColors.primary, size: 28),
    );
  }
}

// ==========================================
// 2. حقول الإدخال المخصصة (Input Fields)
// ==========================================
class CustomLogField extends StatelessWidget {
  final String title;
  final String hintText;
  final IconData? icon;
  final bool isTextArea;

  const CustomLogField({
    Key? key,
    required this.title,
    required this.hintText,
    this.icon,
    this.isTextArea = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.inputBackground, // الرمادي الفاتح
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title.toUpperCase(), style: AppTextStyles.fieldLabel),
          SizedBox(height: isTextArea ? 12 : 8),
          Row(
            crossAxisAlignment: isTextArea ? CrossAxisAlignment.start : CrossAxisAlignment.center,
            children: [
              if (icon != null) ...[
                Icon(icon, color: AppColors.primary, size: 20),
                const SizedBox(width: 12),
              ],
              Expanded(
                child: isTextArea
                    ? TextField(
                        maxLines: 3,
                        decoration: InputDecoration(
                          hintText: hintText,
                          hintStyle: AppTextStyles.fieldHint,
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                        ),
                      )
                    : Text(
                        hintText,
                        style: icon != null && hintText.contains('Today')
                            ? AppTextStyles.actionTitle // لو فيها تاريخ تبقى غامقة
                            : AppTextStyles.fieldHint, // لو hint تبقى فاتحة
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ==========================================
// 3. كارت التاريخ الحديث (Recent History Card)
// ==========================================
class RecentHistoryCard extends StatelessWidget {
  final String imageUrl;
  final String dateText;

  const RecentHistoryCard({Key? key, required this.imageUrl, required this.dateText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          // جراديانت أسود خفيف تحت عشان التاريخ يبان
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 40,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(16)),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black.withOpacity(0.7), Colors.transparent],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 12,
            left: 12,
            child: Text(
              dateText.toUpperCase(),
              style: AppTextStyles.addExTagMuscle.copyWith(color: AppColors.white),
            ),
          ),
        ],
      ),
    );
  }
}