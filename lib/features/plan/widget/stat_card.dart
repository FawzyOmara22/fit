import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const StatCard({super.key, required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Column(
        children: [
          Icon(icon, color: const Color(0xFF0058BB), size: 20),
          const SizedBox(height: 12),
          Text(label, style: const TextStyle(color: Color(0xFF5B5B60), fontSize: 10, fontFamily: 'Inter', fontWeight: FontWeight.w700, letterSpacing: 0.50)),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(color: Color(0xFF2D2E33), fontSize: 18, fontFamily: 'Inter', fontWeight: FontWeight.w900)),
        ],
      ),
    );
  }
}