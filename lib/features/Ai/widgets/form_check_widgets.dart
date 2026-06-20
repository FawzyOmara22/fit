import 'package:flutter/material.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'dart:ui';


class DashedUploadBox extends StatelessWidget {
  final String title;
  final String subtext;
  final String buttonText;
  final VoidCallback onUploadPressed;

  const DashedUploadBox({
    Key? key,
    required this.title,
    required this.subtext,
    required this.buttonText,
    required this.onUploadPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DashedRectPainter(color: AppColors.iconGrey),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: AppColors.lightBlueWhite,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.cloud_upload_outlined, color: AppColors.primary, size: 32),
            ),
            const SizedBox(height: 16),
            Text(title, style: AppTextStyles.body14BlueWithHeight.copyWith(color: AppColors.darkCharcoal)),
            const SizedBox(height: 4),
            Text(subtext, style: AppTextStyles.body14Height.copyWith(fontSize: 12)),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: onUploadPressed,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(buttonText, style: AppTextStyles.primaryButton16.copyWith(fontSize: 14)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DashedRectPainter extends CustomPainter {
  final Color color;

  DashedRectPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    const double dashWidth = 6.0;
    const double dashSpace = 4.0;
    final RRect rrect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      const Radius.circular(16),
    );

    Path path = Path()..addRRect(rrect);
    Path dashPath = Path();

    for (PathMetric measurePath in path.computeMetrics()) {
      double distance = 0.0;
      while (distance < measurePath.length) {
        dashPath.addPath(
          measurePath.extractPath(distance, distance + dashWidth),
          Offset.zero,
        );
        distance += dashWidth + dashSpace;
      }
    }
    canvas.drawPath(dashPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class RpeSelectorWidget extends StatelessWidget {
  final int selectedRpe;
  final ValueChanged<int> onRpeSelected;

  const RpeSelectorWidget({
    Key? key,
    required this.selectedRpe,
    required this.onRpeSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: List.generate(8, (index) {
          final int rpeValue = index + 1;
          final bool isSelected = rpeValue == selectedRpe;
          return Expanded(
            child: GestureDetector(
              onTap: () => onRpeSelected(rpeValue),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primary : Colors.transparent,
                  borderRadius: isSelected ? BorderRadius.circular(8) : null,
                ),
                child: Text(
                  rpeValue.toString(),
                  style: TextStyle(
                    color: isSelected ? AppColors.white : AppColors.darkCharcoal,
                    fontSize: 14,
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class FilmingTipCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const FilmingTipCard({
    Key? key,
    required this.icon,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColors.primary, size: 24),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: AppTextStyles.label10GreyDark),
                const SizedBox(height: 2),
                Text(value, style: AppTextStyles.body14BlueWithHeight.copyWith(color: AppColors.darkCharcoal)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class GradientSubmitButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const GradientSubmitButton({Key? key, required this.label, required this.onPressed}) : super(key: key);

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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(label, style: AppTextStyles.primaryButton16),
            const SizedBox(width: 8),
            const Icon(Icons.send_outlined, color: AppColors.white, size: 18),
          ],
        ),
      ),
    );
  }
}