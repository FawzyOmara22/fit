import 'package:flutter/material.dart';

class FormAnalysisModel {
  final double depthPercentage;
  final int repCount;
  final bool isLive;
  final List<Offset> skeletonPoints; // الإحداثيات اللي هتيجي من الـ API
  final List<Offset> barPathPoints;

  FormAnalysisModel({
    this.depthPercentage = 0.0,
    this.repCount = 0,
    this.isLive = true,
    this.skeletonPoints = const [],
    this.barPathPoints = const [],
  });

  // دالة الاستقبال من الـ API
  factory FormAnalysisModel.fromJson(Map<String, dynamic> json) {
    return FormAnalysisModel(
      depthPercentage: (json['depthPercentage'] as num?)?.toDouble() ?? 0.0,
      repCount: json['repCount'] as int? ?? 0,
      isLive: json['isLive'] as bool? ?? true,
      skeletonPoints: (json['skeletonPoints'] as List<dynamic>?)
          ?.map((e) => Offset((e['dx'] as num).toDouble(), (e['dy'] as num).toDouble()))
          .toList() ?? [],
      barPathPoints: (json['barPathPoints'] as List<dynamic>?)
          ?.map((e) => Offset((e['dx'] as num).toDouble(), (e['dy'] as num).toDouble()))
          .toList() ?? [],
    );
  }

  // دالة الإرسال للـ API
  Map<String, dynamic> toJson() {
    return {
      'depthPercentage': depthPercentage,
      'repCount': repCount,
      'isLive': isLive,
      'skeletonPoints': skeletonPoints.map((e) => {'dx': e.dx, 'dy': e.dy}).toList(),
      'barPathPoints': barPathPoints.map((e) => {'dx': e.dx, 'dy': e.dy}).toList(),
    };
  }
}