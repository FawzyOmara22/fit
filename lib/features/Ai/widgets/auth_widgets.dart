import 'package:flutter/material.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';


// 1. الحقل النصي المخصص المتوافق مع التصميم والألوان عندك
class CustomAuthTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final bool isPassword;
  final TextEditingController controller;
  final TextInputType keyboardType;

  const CustomAuthTextField({
    Key? key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.fieldLabel,
        ),
        const SizedBox(height: 6),
        Container(
          decoration: BoxDecoration(
            color: AppColors.inputBackground,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.borderGrey),
          ),
          child: TextField(
            controller: controller,
            obscureText: isPassword,
            keyboardType: keyboardType,
            style: AppTextStyles.sessionInput14,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: AppTextStyles.fieldHint,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            ),
          ),
        ),
      ],
    );
  }
}

// 2. الزر الرئيسي (ElevatedButton) متناسق مع حجم وخطوط التطبيق
class CustomPrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomPrimaryButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 0,
        ),
        child: Text(
          text,
          style: AppTextStyles.primaryButton16,
        ),
      ),
    );
  }
}

// 3. أزرار تسجيل الدخول بواسطة منصات التواصل (Google / Apple)
class SocialSignInButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Widget icon;

  const SocialSignInButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: AppColors.borderGrey),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(width: 10),
            Text(
              text,
              style: AppTextStyles.socialButtonText.copyWith(color: AppColors.darkCharcoal),
            ),
          ],
        ),
      ),
    );
  }
}