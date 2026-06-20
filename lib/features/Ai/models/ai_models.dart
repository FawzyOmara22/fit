import 'package:flutter/material.dart';

// ==========================================
// 1. Model for Quick Actions Grid
// ==========================================
class QuickActionModel {
  final String id;
  final String title;
  final String description;
  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;

  QuickActionModel({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
  });

  // استقبال البيانات من الـ API
  factory QuickActionModel.fromJson(Map<String, dynamic> json) {
    return QuickActionModel(
      id: json['id']?.toString() ?? '',
      title: json['title'] ?? 'Action',
      description: json['description'] ?? '',
      // الـ API بيبعت اسم الأيقونة كنص، فبنحولها لـ IconData
      icon: _getIconFromString(json['iconName'] ?? ''),
      // الـ API بيبعت اللون كـ Hex String (زي #0058BB)، فبنحوله لـ Color
      iconColor: _getColorFromHex(json['iconColorHex'] ?? ''),
      iconBgColor: _getColorFromHex(json['iconBgColorHex'] ?? ''),
    );
  }

  // إرسال البيانات للـ API أو حفظها محلياً
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'iconName': icon.codePoint.toString(), // أو ممكن تبعت اسم الأيقونة لو حابب
      'iconColorHex': _colorToHex(iconColor),
      'iconBgColorHex': _colorToHex(iconBgColor),
    };
  }
}

// ==========================================
// 2. Model for Recent Bites (Insights)
// ==========================================
enum BiteType { movement, strength, recovery, general }

class RecentBiteModel {
  final String id;
  final BiteType type;
  final String label;
  final IconData icon;
  final Color iconColor;

  RecentBiteModel({
    required this.id,
    required this.type,
    required this.label,
    required this.icon,
    required this.iconColor,
  });

  factory RecentBiteModel.fromJson(Map<String, dynamic> json) {
    return RecentBiteModel(
      id: json['id']?.toString() ?? '',
      type: _getBiteTypeFromString(json['type'] ?? ''),
      label: json['label'] ?? '',
      icon: _getIconFromString(json['iconName'] ?? ''),
      iconColor: _getColorFromHex(json['iconColorHex'] ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type.name, // تحويل الـ enum لنص
      'label': label,
      'iconName': icon.codePoint.toString(),
      'iconColorHex': _colorToHex(iconColor),
    };
  }
}

// ==========================================
// Helper Methods (دوال المساعدة للتحويل)
// ==========================================

/// دالة لتحويل كود اللون النصي (Hex) إلى Color في فلاتر
Color _getColorFromHex(String hexColor) {
  hexColor = hexColor.toUpperCase().replaceAll("#", "");
  if (hexColor.isEmpty) return Colors.grey; // لون افتراضي لو مفيش داتا

  if (hexColor.length == 6) {
    hexColor = "FF$hexColor"; // إضافة قيمة الشفافية لو مش موجودة
  }
  
  // حماية من الكراش لو السيرفر بعت لون بصيغة غلط
  try {
    return Color(int.parse("0x$hexColor"));
  } catch (e) {
    return Colors.grey; 
  }
}

/// دالة لتحويل لون فلاتر إلى Hex String عشان الـ API
String _colorToHex(Color color) {
  return '#${color.value.toRadixString(16).padLeft(8, '0').toUpperCase()}';
}

/// دالة لتحويل النص اللي جاي من السيرفر لـ Enum
BiteType _getBiteTypeFromString(String type) {
  switch (type.toLowerCase()) {
    case 'movement': return BiteType.movement;
    case 'strength': return BiteType.strength;
    case 'recovery': return BiteType.recovery;
    default: return BiteType.general;
  }
}

/// دالة لتحويل اسم الأيقونة اللي جاي من السيرفر لـ IconData حقيقي
IconData _getIconFromString(String iconName) {
  switch (iconName.toLowerCase()) {
    case 'chat': return Icons.chat_bubble_outline;
    case 'camera': return Icons.camera_alt_outlined;
    case 'smart': return Icons.auto_awesome;
    case 'predict': return Icons.trending_up;
    case 'bolt': return Icons.bolt;
    case 'chart': return Icons.bar_chart;
    default: return Icons.info_outline; // أيقونة افتراضية
  }
}