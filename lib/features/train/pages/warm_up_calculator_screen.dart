import 'package:flutter/material.dart';
// تأكد من المسارات الخاصة بمشروعك
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';

class WarmUpCalculatorScreen extends StatefulWidget {
  const WarmUpCalculatorScreen({Key? key}) : super(key: key);

  @override
  State<WarmUpCalculatorScreen> createState() => _WarmUpCalculatorScreenState();
}

class _WarmUpCalculatorScreenState extends State<WarmUpCalculatorScreen> {
  String _selectedTab = 'Standard';

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          loc.warmUpCalcTitle,
          style: AppTextStyles.profileAppBar18.copyWith(fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ==========================================
            // 1. Target Working Weight Card
            // ==========================================
            Container(
              padding: const EdgeInsets.all(24),
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
                  Text(loc.warmUpTargetWeight, style: AppTextStyles.label10GreyDark),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          decoration: BoxDecoration(
                            color: AppColors.surfaceColor, // الرصاصي الفاتح
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text('100', style: AppTextStyles.heading36Black),
                              const SizedBox(width: 8),
                              Text('KG', style: AppTextStyles.body16.copyWith(fontWeight: FontWeight.w700)),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      // زر التأكيد الأزرق بتدريج لوني
                      Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          gradient: AppColors.primaryGradient,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(color: AppColors.primary.withOpacity(0.3), blurRadius: 8, offset: const Offset(0, 4)),
                          ],
                        ),
                        child: const Icon(Icons.done_all_rounded, color: AppColors.white, size: 24),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // ==========================================
            // 2. Tabs Selector
            // ==========================================
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.none,
              child: Row(
                children: [
                  _buildTab(loc.warmUpStandard, 'Standard'),
                  const SizedBox(width: 12),
                  _buildTab(loc.warmUpQuick, 'Quick'),
                  const SizedBox(width: 12),
                  _buildTab(loc.warmUpPowerlifting, 'Powerlifting'),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // ==========================================
            // 3. Calculated Steps List
            // ==========================================
            Text(loc.warmUpCalculatedSteps, style: AppTextStyles.label10GreyDark),
            const SizedBox(height: 16),
            
            _buildStepCard(percentage: '20%', weight: '20', desc: loc.warmUpEmptyBar, tag: loc.warmUpBloodFlow),
            const SizedBox(height: 12),
            _buildStepCard(percentage: '40%', weight: '40', desc: loc.warmUpLight, tag: loc.warmUpPrep),
            const SizedBox(height: 12),
            _buildStepCard(percentage: '60%', weight: '60', desc: loc.warmUpVelocity, tag: loc.warmUpFeeler),
            const SizedBox(height: 12),
            _buildStepCard(percentage: '80%', weight: '80', desc: loc.warmUpNeural, tag: loc.warmUpFinal),
            const SizedBox(height: 32),

            // ==========================================
            // 4. Pro Tip Card
            // ==========================================
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.insightBg, // اللون الأزرق الفاتح جداً
                borderRadius: BorderRadius.circular(24),
              ),
              child: Stack(
                children: [
                  Positioned(
                    right: -20,
                    bottom: -20,
                    child: Transform.rotate(
                      angle: -0.5,
                      child: Icon(Icons.fitness_center, size: 100, color: AppColors.primary.withOpacity(0.05)),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.info_outline_rounded, color: AppColors.insightTextDark, size: 20),
                          const SizedBox(width: 8),
                          Text(
                            loc.warmUpProTip,
                            style: AppTextStyles.insightBodyBold.copyWith(fontSize: 16),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        loc.warmUpProTipDesc,
                        style: AppTextStyles.insightBody.copyWith(fontSize: 14, fontWeight: FontWeight.w400, height: 1.63),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // ==========================================
  // دوال مساعدة
  // ==========================================

  Widget _buildTab(String title, String value) {
    bool isSelected = _selectedTab == value;
    return GestureDetector(
      onTap: () => setState(() => _selectedTab = value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.surfaceColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          title,
          style: AppTextStyles.body14Height.copyWith(
            color: isSelected ? AppColors.white : AppColors.textGrey,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget _buildStepCard({
    required String percentage,
    required String weight,
    required String desc,
    required String tag,
  }) {
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
          // الدائرة الخاصة بالنسبة المئوية
          Container(
            width: 48,
            height: 48,
            decoration: const BoxDecoration(
              color: AppColors.surfaceColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                percentage,
                style: AppTextStyles.body14NoHeight.copyWith(fontWeight: FontWeight.w900, color: AppColors.textGrey),
              ),
            ),
          ),
          const SizedBox(width: 16),
          // بيانات الخطوة
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(weight, style: AppTextStyles.heading24.copyWith(fontWeight: FontWeight.w900)),
                    const SizedBox(width: 4),
                    Text('KG', style: AppTextStyles.body14NoHeight.copyWith(fontWeight: FontWeight.w700)),
                  ],
                ),
                const SizedBox(height: 4),
                Text(desc, style: AppTextStyles.body14Height.copyWith(fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          // التاج الأيمن (مثل BLOOD FLOW)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.surfaceColor,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              tag.toUpperCase(),
              style: AppTextStyles.label10Grey.copyWith(letterSpacing: 0.5),
            ),
          ),
        ],
      ),
    );
  }
}