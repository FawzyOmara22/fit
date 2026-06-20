import 'dart:ui'; // 👈 ضرورية جداً عشان تأثير البلور
import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/train/pages/ShareMilestoneBottomSheet.dart';



class NewPersonalRecordScreen extends StatelessWidget {
  const NewPersonalRecordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close, color: AppColors.darkCharcoal),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(loc.newPrTitle, style: AppTextStyles.appBarTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.share_outlined, color: AppColors.darkCharcoal),
            onPressed: () {
              // 👇 التعديل هنا: إضافة تأثير البلور
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent, 
                isScrollControlled: true, 
                builder: (context) {
                  return BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0), // 👈 درجة البلور (تقدر تزودها أو تقللها)
                    child: const ShareMilestoneBottomSheet(),
                  );
                },
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          children: [
            // ==========================================
            // 1. قسم الكأس
            // ==========================================
            _buildTrophyHeader(loc),
            const SizedBox(height: 32),

            // ==========================================
            // 2. النصوص الرئيسية
            // ==========================================
            Text(
              loc.congratulations.toUpperCase(),
              textAlign: TextAlign.center,
              style: AppTextStyles.prCongrats10,
            ),
            const SizedBox(height: 16),

            Text(
              '120 ${loc.sessionKg.toUpperCase()}',
              textAlign: TextAlign.center,
              style: AppTextStyles.prWeight72.copyWith(fontSize: 84, letterSpacing: -4.0),
            ),
            const SizedBox(height: 12),

            Text('Barbell Bench Press', textAlign: TextAlign.center, style: AppTextStyles.prExercise24),
            const SizedBox(height: 8),

            Text(loc.repMaxImproved, textAlign: TextAlign.center, style: AppTextStyles.prImproved14),
            const SizedBox(height: 40),

            // ==========================================
            // 3. كروت الإحصائيات ( Previous & Increase )
            // ==========================================
            Row(
              children: [
                Expanded(child: _buildMetricCard(loc.previousLabel, '115', loc.sessionKg.toUpperCase(), isIncrease: false)),
                const SizedBox(width: 16),
                Expanded(child: _buildMetricCard(loc.increaseLabel, '+5', loc.sessionKg.toUpperCase(), isIncrease: true)),
              ],
            ),
            const SizedBox(height: 16),

            // ==========================================
            // 4. كارت مقارنة النشاط 
            // ==========================================
            _buildActivityComparison(loc),
            const SizedBox(height: 16),

            // ==========================================
            // 5. منحنى النمو (الرسم البياني)
            // ==========================================
            _buildGrowthCurve(loc),
            const SizedBox(height: 40),

            // ==========================================
            // 6. الأزرار السفلية التفاعلية
            // ==========================================
            _buildBottomActions(loc, context),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  // ==========================================
  // دوال بناء المكونات الفرعية وتنظيم الكود
  // ==========================================

  Widget _buildTrophyHeader(AppLocalizations loc) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Positioned(
          left: -30,
          top: -10,
          child: Icon(Icons.star_border, color: AppColors.divider.withOpacity(0.5), size: 40),
        ),
        Container(
          width: 160,
          height: 160,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: AppColors.primaryGradient,
          ),
          child: const Icon(Icons.emoji_events, color: Colors.white, size: 80),
        ),
        Positioned(
          bottom: -16,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))
              ],
            ),
            child: Text(
              loc.newPrBadge.toUpperCase(),
              style: AppTextStyles.prBadge20,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMetricCard(String label, String value, String unit, {required bool isIncrease}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: isIncrease ? AppTextStyles.prCardIncLabel10 : AppTextStyles.prCardLabel10),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(value, style: isIncrease ? AppTextStyles.prCardIncValue24 : AppTextStyles.prCardValue24),
              const SizedBox(width: 4),
              Text(unit, style: isIncrease ? AppTextStyles.prCardIncUnit12 : AppTextStyles.prCardUnit12),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            width: 40,
            height: 3,
            decoration: BoxDecoration(
              gradient: isIncrease ? AppColors.primaryGradient : null,
              color: isIncrease ? null : AppColors.divider,
              borderRadius: BorderRadius.circular(2),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildActivityComparison(AppLocalizations loc) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.surfaceColor,
        ),
        child: Stack(
          children: [
            Positioned(
              right: 10,
              top: -30,
              child: Transform.rotate(
                angle: 0.5,
                child: Icon(
                  Icons.close, 
                  size: 140, 
                  color: AppColors.divider.withOpacity(0.5),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(loc.activityComparison.toUpperCase(), style: AppTextStyles.prActivityTitle10),
                      const SizedBox(height: 4),
                      Text(loc.topLifters, style: AppTextStyles.prActivityDesc14),
                    ],
                  ),
                  const Icon(Icons.insert_chart_outlined, color: AppColors.primaryDark, size: 28),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGrowthCurve(AppLocalizations loc) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(loc.growthCurve, style: AppTextStyles.prChartTitle18),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(color: AppColors.lightBlueWhite, borderRadius: BorderRadius.circular(8)),
                child: Text(loc.last6Months.toUpperCase(), style: AppTextStyles.prChartTag12),
              ),
            ],
          ),
          const SizedBox(height: 32),
          
          SizedBox(
            height: 160,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(child: _buildChartBar(height: 40, isToday: false)),
                Expanded(child: _buildChartBar(height: 45, isToday: false)),
                Expanded(child: _buildChartBar(height: 60, isToday: false)),
                Expanded(child: _buildChartBar(height: 55, isToday: false)),
                Expanded(child: _buildChartBar(height: 80, isToday: false)),
                Expanded(child: _buildChartBar(height: 110, isToday: true, loc: loc)), 
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChartBar({required double height, required bool isToday, AppLocalizations? loc}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (isToday) ...[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(color: AppColors.nearBlack, borderRadius: BorderRadius.circular(4)),
            child: Text(loc!.prTag.toUpperCase(), style: AppTextStyles.prTag10),
          ),
          const SizedBox(height: 4),
        ],
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 6), 
          height: height,
          decoration: BoxDecoration(
            gradient: isToday ? AppColors.primaryGradient : null,
            color: isToday ? null : AppColors.surfaceColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(6)),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomActions(AppLocalizations loc, BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: AppColors.primaryGradient,
            borderRadius: BorderRadius.circular(32),
            boxShadow: [
              BoxShadow(color: AppColors.primary.withOpacity(0.3), blurRadius: 15, offset: const Offset(0, 8)),
            ],
          ),
          child: ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              padding: const EdgeInsets.symmetric(vertical: 20),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            ),
            child: Text(loc.awesomeBtn, style: AppTextStyles.prAwesome18, textAlign: TextAlign.center,),
          ),
        ),
        const SizedBox(height: 16),
        TextButton(
          onPressed: () {},
          child: Text(loc.viewHistoryBtn, style: AppTextStyles.prViewHistory14, textAlign: TextAlign.center,),
        ),
      ],
    );
  }
}