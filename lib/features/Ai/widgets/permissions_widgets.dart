// lib/features/permissions/widgets/permissions_widgets.dart

import 'package:flutter/material.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';

class PermissionCardWidget extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;
  final String title;
  final String description;
  final Color dotColor;

  const PermissionCardWidget({
    Key? key,
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
    required this.title,
    required this.description,
    required this.dotColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: AppColors.darkCharcoal5,
            blurRadius: 10,
            offset: Offset(0, 4),
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: iconBgColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.cardTitle18),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: AppTextStyles.caption12.copyWith(color: AppColors.textGrey),
                ),
              ],
            ),
          ),
          Container(
            width: 6,
            height: 6,
            margin: const EdgeInsets.only(top: 6),
            decoration: BoxDecoration(
              color: dotColor,
              shape: BoxShape.circle,
            ),
          )
        ],
      ),
    );
  }
}