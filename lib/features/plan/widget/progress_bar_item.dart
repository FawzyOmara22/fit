import 'package:flutter/material.dart';

class ProgressBarItem extends StatelessWidget {
  final String label;
  final int percent;
  final Color color;

  const ProgressBarItem({super.key, required this.label, required this.percent, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: const TextStyle(color: Color(0xFF2D2E33), fontSize: 10, fontFamily: 'Inter', fontWeight: FontWeight.w700, letterSpacing: 0.50)),
            Text('$percent%', style: const TextStyle(color: Color(0xFF5B5B60), fontSize: 10, fontFamily: 'Inter', fontWeight: FontWeight.w700, letterSpacing: 0.50)),
          ],
        ),
        const SizedBox(height: 8),
        Stack(
          children: [
            Container(height: 4, decoration: BoxDecoration(color: const Color(0xFFF1F4F8), borderRadius: BorderRadius.circular(2))),
            FractionallySizedBox(widthFactor: percent / 100, child: Container(height: 4, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(2)))),
          ],
        ),
      ],
    );
  }
}