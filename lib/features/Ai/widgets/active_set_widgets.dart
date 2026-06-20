import 'package:flutter/material.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';


class StatCard extends StatelessWidget {
  final String title;
  final Widget valueWidget;

  const StatCard({Key? key, required this.title, required this.valueWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.darkCharcoal.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(title, style: AppTextStyles.label10GreyDark),
          const SizedBox(height: 8),
          valueWidget,
        ],
      ),
    );
  }
}

class GradientCircleButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const GradientCircleButton({Key? key, required this.label, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: AppColors.primaryGradient,
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.4),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.add, color: AppColors.white, size: 32),
            Text(label, style: AppTextStyles.sessionFinish14.copyWith(letterSpacing: 1.2)),
          ],
        ),
      ),
    );
  }
}

class GradientActionButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const GradientActionButton({Key? key, required this.label, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          gradient: AppColors.primaryGradient,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.3),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Text(label, style: AppTextStyles.primaryButton16),
      ),
    );
  }
}

class SmallCircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const SmallCircleButton({Key? key, required this.icon, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 50,
        height: 50,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.white,
          boxShadow: [
             BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Icon(icon, color: AppColors.darkCharcoal, size: 24),
      ),
    );
  }
}