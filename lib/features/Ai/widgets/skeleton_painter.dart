import 'package:flutter/material.dart';
import 'package:kinetic/core/theme/app_colors.dart';

class SkeletonPainter extends CustomPainter {
  final List<Offset> skeletonPoints;
  final List<Offset> barPathPoints;
  final bool showSkeleton;
  final bool showBarPath;

  SkeletonPainter({
    required this.skeletonPoints,
    required this.barPathPoints,
    required this.showSkeleton,
    required this.showBarPath,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final skeletonPaint = Paint()
      ..color = AppColors.primaryLight.withOpacity(0.8)
      ..strokeWidth = 4.0
      ..strokeCap = StrokeCap.round;

    final jointPaint = Paint()
      ..color = AppColors.white
      ..style = PaintingStyle.fill;

    final barPathPaint = Paint()
      ..color = AppColors.successGreen.withOpacity(0.8)
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke;

    if (showSkeleton && skeletonPoints.isNotEmpty) {
      for (int i = 0; i < skeletonPoints.length - 1; i++) {
        canvas.drawLine(skeletonPoints[i], skeletonPoints[i + 1], skeletonPaint);
      }
      for (var point in skeletonPoints) {
        canvas.drawCircle(point, 6.0, jointPaint);
      }
    }

    if (showBarPath && barPathPoints.isNotEmpty) {
      final path = Path();
      path.moveTo(barPathPoints.first.dx, barPathPoints.first.dy);
      for (var point in barPathPoints) {
        path.lineTo(point.dx, point.dy);
      }
      canvas.drawPath(path, barPathPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}