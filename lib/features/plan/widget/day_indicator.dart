import 'package:flutter/material.dart';

class DayIndicator extends StatelessWidget {
  final String day;
  final String status; // 'completed', 'planned', 'rest'

  const DayIndicator({super.key, required this.day, required this.status});

  @override
  Widget build(BuildContext context) {
    Color bgColor;
    Widget? icon;
    if (status == 'completed') {
      bgColor = const Color(0xFF0058BB);
      icon = const Icon(Icons.check, color: Colors.white, size: 12);
    } else if (status == 'planned') {
      bgColor = const Color(0xFFE6EFFF);
    } else {
      bgColor = const Color(0xFFF1F4F8); // rest
    }

    return Column(
      children: [
        Container(
          width: 32,
          height: status == 'rest' ? 24 : 40,
          decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(8)),
          child: Center(child: icon),
        ),
        const SizedBox(height: 8),
        Text(day, style: TextStyle(color: status == 'completed' || status == 'planned' ? const Color(0xFF2D2E33) : const Color(0xFF5B5B60), fontSize: 10, fontFamily: 'Inter', fontWeight: FontWeight.w700)),
      ],
    );
  }
}