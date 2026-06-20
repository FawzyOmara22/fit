import 'package:flutter/material.dart';
import 'package:kinetic/core/theme/app_colors.dart';


class CustomGradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData? icon;

  const CustomGradientButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon = Icons.arrow_forward, // سهم لليمين زي التصميم
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        borderRadius: BorderRadius.circular(16), // دوران خفيف مطابق للصورة الجديدة
        boxShadow: const [
          BoxShadow(
            color: AppColors.primary10,
            blurRadius: 15,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          // استخدام شكل المستطيل ذو الحواف الدائرية بدل الدائري بالكامل
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontStyle: FontStyle.italic, // مائل زي الصورة
                fontFamily: 'Inter',
                fontWeight: FontWeight.w900, // أقصى عرض للخط
                letterSpacing: -0.5,
              ),
            ),
            if (icon != null) ...[
              const SizedBox(width: 8),
              Icon(icon, color: Colors.white, size: 24), // الأيقونة
            ],
          ],
        ),
      ),
    );
  }
}