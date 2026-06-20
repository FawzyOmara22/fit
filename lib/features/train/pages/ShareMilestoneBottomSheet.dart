import 'package:flutter/material.dart';
// تأكد من مسار ملف الترجمة
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart'; 
// استدعاء ملفات الثيم الخاصة بك


class ShareMilestoneBottomSheet extends StatelessWidget {
  const ShareMilestoneBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: AppColors.background, 
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Drag Handle (المؤشر العلوي)
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.borderDark,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 24),

          // Header (العنوان وزر الإغلاق)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.shareMilestoneTitle,
                    style: AppTextStyles.settingsName20, 
                  ),
                  const SizedBox(height: 4),
                  Text(
                    l10n.shareMilestoneSubtitle,
                    style: AppTextStyles.body14Height,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: AppColors.divider,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.close, size: 18, color: AppColors.darkCharcoal),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // الثلاث أزرار العلوية (المربعات)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildSquareButton(
                label: l10n.shareIgStory,
                iconWidget: Container(
                  width: 56,
                  height: 56,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Color(0xFFF58529), Color(0xFFDD2A7B), Color(0xFF8134AF)],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                    ),
                  ),
                  child: const Icon(Icons.camera_alt_outlined, color: AppColors.white, size: 28),
                ),
                onTap: () {},
              ),
              _buildSquareButton(
                label: l10n.shareWhatsapp,
                iconWidget: Container(
                  width: 56,
                  height: 56,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF25D366),
                  ),
                  child: const Icon(Icons.call, color: AppColors.white, size: 28),
                ),
                onTap: () {},
              ),
              _buildSquareButton(
                label: l10n.shareSaveImage,
                iconWidget: Container(
                  width: 56,
                  height: 56,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.divider,
                  ),
                  child: const Icon(Icons.download_rounded, color: AppColors.darkCharcoal, size: 28),
                ),
                onTap: () {},
              ),
            ],
          ),
          const SizedBox(height: 24),

          // القائمة السفلية (الروابط والتطبيقات الأخرى)
          Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                _buildListTile(
                  icon: Icons.link_rounded,
                  label: l10n.shareCopyLink,
                  onTap: () {},
                ),
                const Divider(height: 1, color: AppColors.dividerGrey),
                _buildListTile(
                  icon: Icons.chat_bubble_rounded,
                  label: l10n.shareMessages,
                  onTap: () {},
                ),
                const Divider(height: 1, color: AppColors.dividerGrey),
                _buildListTile(
                  icon: Icons.more_horiz_rounded,
                  label: l10n.shareMoreApps,
                  onTap: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  // كارد المشاركة المربع (IG, WhatsApp, Save)
  Widget _buildSquareButton({
    required String label,
    required Widget iconWidget,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100, 
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            iconWidget,
            const SizedBox(height: 12),
            Text(
              label,
              textAlign: TextAlign.center,
              // استخدام caption12 مع تعديل الوزن واللون ليطابق فيجما
              style: AppTextStyles.caption12.copyWith(
                color: AppColors.darkCharcoal,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.30,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // عنصر القائمة (Copy Link, Messages, More Apps)
  Widget _buildListTile({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: AppColors.inputBackground,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: AppColors.darkCharcoal, size: 20),
      ),
      title: Text(
        label,
        // استخدام settingsEditProfile14 لأنه متطابق مع (14, w600) ونغير اللون فقط للرمادي الغامق
        style: AppTextStyles.settingsEditProfile14.copyWith(
          color: AppColors.darkCharcoal,
        ),
      ),
    );
  }
}