import 'package:flutter/material.dart';
// تأكد من ضبط مسار الترجمة والثيمات حسب مشروعك
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';

class AddNoteBottomSheet extends StatefulWidget {
  final String exerciseName;

  const AddNoteBottomSheet({
    Key? key,
    required this.exerciseName,
  }) : super(key: key);

  @override
  State<AddNoteBottomSheet> createState() => _AddNoteBottomSheetState();
}

class _AddNoteBottomSheetState extends State<AddNoteBottomSheet> {
  final TextEditingController _noteController = TextEditingController();

  // إضافة النص السريع إلى حقل الإدخال عند الضغط على الـ Chip
  void _addQuickTag(String text) {
    setState(() {
      final currentText = _noteController.text;
      if (currentText.isEmpty) {
        _noteController.text = text;
      } else {
        _noteController.text = '$currentText. $text';
      }
      // وضع المؤشر في نهاية النص
      _noteController.selection = TextSelection.fromPosition(
        TextPosition(offset: _noteController.text.length),
      );
    });
  }

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    // لمعرفة مساحة الكيبورد لرفع الشاشة للأعلى
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Container(
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        top: 16,
        bottom: bottomInset > 0 ? bottomInset + 16 : 32, // يتمدد مع الكيبورد
      ),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Drag Handle (المؤشر العلوي)
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

          // Header (اسم التمرين، العنوان، وزر الإغلاق)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.exerciseName.toUpperCase(),
                    style: AppTextStyles.label10Blue.copyWith(
                      fontSize: 12, 
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    l10n.addNoteTitle,
                    style: AppTextStyles.settingsName20.copyWith(fontWeight: FontWeight.w800),
                  ),
                ],
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
          const SizedBox(height: 24),

          // حقل النص مع الأزرار السريعة بداخله (The Text Area Box)
          Container(
            height: 260, // ارتفاع ثابت أو حسب الرغبة
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.primary.withOpacity(0.3), width: 1), // حواف زرقاء فاتحة
            ),
            child: Column(
              children: [
                Expanded(
                  child: TextField(
                    controller: _noteController,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    style: AppTextStyles.body16.copyWith(color: AppColors.darkCharcoal),
                    decoration: InputDecoration(
                      hintText: l10n.addNoteHint,
                      hintStyle: AppTextStyles.body14Height.copyWith(color: AppColors.iconGrey),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.all(16),
                    ),
                  ),
                ),
                // خط فاصل قبل الأزرار السريعة
                Divider(height: 1, color: AppColors.primary.withOpacity(0.1)),
                // الأزرار السريعة (Quick Tags)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: Row(
                    children: [
                      _buildQuickTag(l10n.tagLeftLegWeaker),
                      const SizedBox(width: 8),
                      _buildQuickTag(l10n.tagIncreaseWeight),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // زر حفظ الملاحظة
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
              borderRadius: BorderRadius.circular(32),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.3), 
                  blurRadius: 15, 
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: ElevatedButton.icon(
              onPressed: () {
                // منطق الحفظ هنا
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
              ),
              icon: const Icon(Icons.save_outlined, color: AppColors.white, size: 20),
              label: Text(
                l10n.saveNoteBtn, 
                style: AppTextStyles.primaryButton16.copyWith(fontWeight: FontWeight.w800),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ويدجت مساعدة لبناء الـ Chips (الأزرار السريعة)
  Widget _buildQuickTag(String text) {
    return GestureDetector(
      onTap: () => _addQuickTag(text),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.surfaceColor, // لون رمادي فاتح للخلفية
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          text,
          style: AppTextStyles.body14NoHeight.copyWith(
            color: AppColors.textGrey,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}