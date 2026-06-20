import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex; // لمعرفة أي صفحة هي النشطة حالياً

  const CustomBottomNav({super.key, this.currentIndex = 0});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 20, offset: const Offset(0, -5))
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _NavItem(icon: Icons.calendar_today, label: l10n.nav_plan, isActive: currentIndex == 0),
              _NavItem(icon: Icons.explore_outlined, label: l10n.nav_explore, isActive: currentIndex == 1),
              _NavItem(icon: Icons.bar_chart, label: l10n.nav_stats, isActive: currentIndex == 2),
              _NavItem(icon: Icons.person_outline, label: l10n.nav_profile, isActive: currentIndex == 3),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  const _NavItem({required this.icon, required this.label, required this.isActive});

  @override
  Widget build(BuildContext context) {
    final color = isActive ? const Color(0xFF0058BB) : const Color(0x665B5B60);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color, size: 24),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(color: color, fontSize: 9, fontFamily: 'Inter', fontWeight: FontWeight.w900, letterSpacing: 0.90)),
      ],
    );
  }
}