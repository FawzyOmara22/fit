import 'package:flutter/material.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import '../../../core/theme/app_colors.dart';

class WeightRuler extends StatefulWidget {
  final double initialWeight;
  final int minWeight;
  final int maxWeight;
  final ValueChanged<double> onChanged;

  const WeightRuler({super.key, required this.initialWeight, this.minWeight = 30, this.maxWeight = 150, required this.onChanged});

  @override
  State<WeightRuler> createState() => _WeightRulerState();
}

class _WeightRulerState extends State<WeightRuler> {
  late ScrollController _scrollController;
  final double _tickWidth = 16.0;

  @override
  void initState() {
    super.initState();
    double initialOffset = (widget.initialWeight - widget.minWeight) * (_tickWidth * 10);
    _scrollController = ScrollController(initialScrollOffset: initialOffset);
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    double currentWeight = widget.minWeight + (_scrollController.offset / (_tickWidth * 10));
    currentWeight = currentWeight.clamp(widget.minWeight.toDouble(), widget.maxWeight.toDouble());
    widget.onChanged(currentWeight);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Stack(
        alignment: Alignment.center,
        children: [
          LayoutBuilder(builder: (context, constraints) {
            return ListView.builder(
              controller: _scrollController, scrollDirection: Axis.horizontal, physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth / 2),
              itemCount: (widget.maxWeight - widget.minWeight) * 10 + 1,
              itemBuilder: (context, index) {
                final bool isMajor = index % 10 == 0;
                final int currentNumber = widget.minWeight + (index ~/ 10);
                return SizedBox(
                  width: _tickWidth,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (isMajor) Text(currentNumber.toString(), style: AppTextStyles.label10GreyDark.copyWith(fontSize: 12)),
                      if (isMajor) const SizedBox(height: 8),
                      Container(width: 2, height: isMajor ? 24 : 12, decoration: BoxDecoration(color: AppColors.lightGray, borderRadius: BorderRadius.circular(1))),
                    ],
                  ),
                );
              },
            );
          }),
          Container(width: 4, height: 60, decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(2))),
        ],
      ),
    );
  }
}