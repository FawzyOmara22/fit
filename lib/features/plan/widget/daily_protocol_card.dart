import 'package:flutter/material.dart';

class DailyProtocolCard extends StatelessWidget {
  final String dayText;
  final String time;
  final String title;
  final String desc;
  final bool isActive;

  const DailyProtocolCard({super.key, required this.dayText, required this.time, required this.title, required this.desc, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4))]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: isActive ? const Color(0xFFE6EFFF) : Colors.transparent, borderRadius: BorderRadius.circular(12)), child: Text(dayText, style: TextStyle(color: const Color(0xFF0058BB), fontSize: 10, fontFamily: 'Inter', fontWeight: FontWeight.w900, letterSpacing: 1))),
              const SizedBox(width: 12),
              const Icon(Icons.timer_outlined, color: Color(0xFF5B5B60), size: 12),
              const SizedBox(width: 4),
              Text(time, style: const TextStyle(color: Color(0xFF5B5B60), fontSize: 11, fontFamily: 'Inter', fontWeight: FontWeight.w700)),
            ],
          ),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(color: Color(0xFF2D2E33), fontSize: 20, fontFamily: 'Inter', fontWeight: FontWeight.w900, letterSpacing: -0.50)),
          const SizedBox(height: 8),
          Text(desc, style: const TextStyle(color: Color(0xFF5B5B60), fontSize: 13, fontFamily: 'Inter', fontWeight: FontWeight.w500, height: 1.38)),
          const SizedBox(height: 12),
          const Icon(Icons.chevron_right, color: Color(0xFFADACB2)),
        ],
      ),
    );
  }
}