import 'package:flutter/material.dart';
// تأكد من ضبط المسارات الخاصة بمشروعك
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';

class PlateCalculatorScreen extends StatefulWidget {
  const PlateCalculatorScreen({Key? key}) : super(key: key);

  @override
  State<PlateCalculatorScreen> createState() => _PlateCalculatorScreenState();
}

class _PlateCalculatorScreenState extends State<PlateCalculatorScreen> {
  // متغير لتحديد البار المختار حالياً (لإعطاء تأثير التفاعل)
  String _selectedBarbell = '20kg';

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _buildAppBar(loc),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ==========================================
            // 1. Target Total Weight Section
            // ==========================================
            Text(loc.calcTargetTotal, style: AppTextStyles.label10Grey),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  '122.5',
                  style: AppTextStyles.prWeight72.copyWith(fontSize: 64, letterSpacing: -2.0),
                ),
                const SizedBox(width: 8),
                Text(
                  loc.calcKg,
                  style: AppTextStyles.heading24.copyWith(color: AppColors.primaryLight, fontWeight: FontWeight.w800),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _buildEditWeightButton(loc),
            const SizedBox(height: 32),

            // ==========================================
            // 2. Barbell Visual Card
            // ==========================================
            _buildBarbellVisualCard(loc),
            const SizedBox(height: 32),

            // ==========================================
            // 3. Barbell Weight Selector
            // ==========================================
            Align(
              alignment: Alignment.centerLeft,
              child: Text(loc.calcBarbellWeight, style: AppTextStyles.label10GreyDark),
            ),
            const SizedBox(height: 16),
            _buildBarbellSelectors(loc),
            const SizedBox(height: 32),

            // ==========================================
            // 4. Plates Needed List
            // ==========================================
            Align(
              alignment: Alignment.centerLeft,
              child: Text(loc.calcPlatesNeeded, style: AppTextStyles.label10GreyDark),
            ),
            const SizedBox(height: 16),
            _buildPlateRow(color: const Color(0xFF0058BB), weight: '20', type: loc.calcStandardBlue, count: 2, loc: loc),
            const SizedBox(height: 12),
            _buildPlateRow(color: const Color(0xFF22C55E), weight: '10', type: loc.calcOlympicGreen, count: 1, loc: loc),
            const SizedBox(height: 12),
            _buildPlateRow(color: const Color(0xFFADACB2), weight: '1.25', type: loc.calcFractionalChrome, count: 1, loc: loc),
            const SizedBox(height: 32),

            // ==========================================
            // 5. Settings / Extras Cards
            // ==========================================
            Row(
              children: [
                Expanded(child: _buildInventoryCard(loc)),
                const SizedBox(width: 16),
                Expanded(child: _buildCollarCard(loc)),
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // ==========================================
  // الدوال المساعدة لبناء الواجهة
  // ==========================================

  PreferredSizeWidget _buildAppBar(AppLocalizations loc) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
      leading: const Icon(Icons.fitness_center, color: AppColors.primary),
      title: Text(
        loc.calcTitle,
        style: AppTextStyles.profileAppBar18.copyWith(fontWeight: FontWeight.w900),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.more_horiz, color: AppColors.darkCharcoal),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildEditWeightButton(AppLocalizations loc) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.lightBlueWhite,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.edit, color: AppColors.primary, size: 14),
          const SizedBox(width: 6),
          Text(
            loc.calcEditWeight,
            style: AppTextStyles.body14BlueNoHeight.copyWith(fontSize: 12, fontWeight: FontWeight.w800),
          ),
        ],
      ),
    );
  }

  Widget _buildBarbellVisualCard(AppLocalizations loc) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surfaceColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // رسم البار والأقراص التقريبي
          SizedBox(
            height: 100,
            child: Stack(
              alignment: Alignment.centerRight,
              children: [
                // عمود البار الرمادي
                Container(
                  width: double.infinity,
                  height: 12,
                  decoration: BoxDecoration(
                    color: AppColors.borderDark,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                // الأقراص المترصة
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // قرص 20 كجم (عدد 2)
                    _buildPlateVisual(color: const Color(0xFF0058BB), height: 90, width: 14),
                    const SizedBox(width: 2),
                    _buildPlateVisual(color: const Color(0xFF0058BB), height: 90, width: 14),
                    const SizedBox(width: 4),
                    // قرص 10 كجم
                    _buildPlateVisual(color: const Color(0xFF22C55E), height: 70, width: 14),
                    const SizedBox(width: 4),
                    // قرص 1.25 كجم
                    _buildPlateVisual(color: const Color(0xFFADACB2), height: 40, width: 8),
                    const SizedBox(width: 20), // مسافة لنهاية البار
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Text(loc.calcOneSide, style: AppTextStyles.label10Grey.copyWith(fontWeight: FontWeight.w900)),
          const SizedBox(height: 4),
          Text('51.25 ${loc.calcKg}', style: AppTextStyles.heading24.copyWith(fontWeight: FontWeight.w900)),
        ],
      ),
    );
  }

  Widget _buildPlateVisual({required Color color, required double height, required double width}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  Widget _buildBarbellSelectors(AppLocalizations loc) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      clipBehavior: Clip.none,
      child: Row(
        children: [
          _buildBarbellOption('20kg', loc.calcStandard),
          const SizedBox(width: 12),
          _buildBarbellOption('15kg', loc.calcWomens),
          const SizedBox(width: 12),
          _buildBarbellOption('10kg', loc.calcTechnique),
        ],
      ),
    );
  }

  Widget _buildBarbellOption(String weight, String type) {
    bool isSelected = _selectedBarbell == weight;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedBarbell = weight;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 110,
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.surfaceColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: isSelected
              ? [BoxShadow(color: AppColors.primary.withOpacity(0.3), blurRadius: 10, offset: const Offset(0, 4))]
              : [],
        ),
        child: Column(
          children: [
            Text(
              weight,
              style: AppTextStyles.heading24.copyWith(
                color: isSelected ? AppColors.white : AppColors.darkCharcoal,
                fontWeight: FontWeight.w900,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              type,
              style: AppTextStyles.label10Grey.copyWith(
                color: isSelected ? AppColors.white.withOpacity(0.8) : AppColors.mutedGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlateRow({required Color color, required String weight, required String type, required int count, required AppLocalizations loc}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Row(
        children: [
          // دائرة القرص
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: color, width: 4),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text('${weight}kg', style: AppTextStyles.heading24.copyWith(fontSize: 18, fontWeight: FontWeight.w900)),
                    const SizedBox(width: 4),
                    Text(loc.calcPlate, style: AppTextStyles.body14NoHeight.copyWith(color: AppColors.textGrey)),
                  ],
                ),
                const SizedBox(height: 4),
                Text(type, style: AppTextStyles.label10Blue.copyWith(color: color, letterSpacing: 0.5)),
              ],
            ),
          ),
          // العداد
          Text('× $count', style: AppTextStyles.heading36Black.copyWith(fontSize: 28)),
        ],
      ),
    );
  }

  Widget _buildInventoryCard(AppLocalizations loc) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surfaceColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.settings_outlined, color: AppColors.primary, size: 24),
          const SizedBox(height: 12),
          Text(loc.calcAvailableInventory, style: AppTextStyles.cardTitle14.copyWith(fontSize: 16)),
          const SizedBox(height: 8),
          Text(
            loc.calcCustomizeInventory,
            style: AppTextStyles.caption12.copyWith(color: AppColors.textGrey, height: 1.4),
          ),
        ],
      ),
    );
  }

  Widget _buildCollarCard(AppLocalizations loc) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.insightBg, // اللون الأزرق الفاتح جداً
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.straighten, color: AppColors.primaryDark, size: 24),
          const SizedBox(height: 12),
          Text(loc.calcCollarWeight, style: AppTextStyles.cardTitle14.copyWith(fontSize: 16, color: AppColors.deepSlate)),
          const SizedBox(height: 8),
          Text(
            loc.calcIncludeCollars,
            style: AppTextStyles.caption12.copyWith(color: AppColors.textGrey, height: 1.4),
          ),
        ],
      ),
    );
  }
}