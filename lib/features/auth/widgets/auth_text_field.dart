import 'package:flutter/material.dart';
import 'package:kinetic/core/theme/app_colors.dart'; 
import 'package:kinetic/core/theme/app_text_style.dart';

class AuthTextField extends StatelessWidget {
  final String label;
  final String hint;
  final bool isPassword;
  final String? rightLabel;
  final VoidCallback? onRightLabelTap;
  
  // 1. 👈 المتغيرات الجديدة اللي ضفناها
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const AuthTextField({
    super.key,
    required this.label,
    required this.hint,
    this.isPassword = false,
    this.rightLabel,
    this.onRightLabelTap,
    this.controller, // 2. 👈 ضفناها في الـ Constructor
    this.validator,  // 2. 👈 ضفناها في الـ Constructor
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: AppTextStyles.fieldLabel,
            ),
            if (rightLabel != null)
              GestureDetector(
                onTap: onRightLabelTap,
                child: Text(
                  rightLabel!,
                  style: AppTextStyles.fieldRightLabel,
                ),
              ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          // ⚠️ ملحوظة: أنا شيلت سطر (height: 56) من هنا
          // عشان لما الـ Validator يظهر رسالة الخطأ الحمراء، الكونتينر يقدر يتمدد وميقصش الكلام
          decoration: BoxDecoration(
            color: AppColors.inputBackground, 
            borderRadius: BorderRadius.circular(16),
          ),
          // 3. 👈 حولنا TextField لـ TextFormField
          child: TextFormField(
            controller: controller, // 👈 ربطنا الـ Controller
            validator: validator,   // 👈 ربطنا الـ Validator
            obscureText: isPassword,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: AppTextStyles.fieldHint.copyWith(
                fontWeight: isPassword ? FontWeight.w400 : FontWeight.w500,
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            ),
          ),
        ),
      ],
    );
  }
}