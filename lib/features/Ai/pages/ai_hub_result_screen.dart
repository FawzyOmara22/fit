import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/Ai/models/ai_hub_model_result.dart';
import 'package:kinetic/features/Ai/widgets/ai_hub_widgets_result.dart';

class AiHubResultScreen extends StatefulWidget {
  const AiHubResultScreen({Key? key}) : super(key: key);

  @override
  State<AiHubResultScreen> createState() => _AiHubResultScreenState();
}

class _AiHubResultScreenState extends State<AiHubResultScreen> {
  late AiHubDataModel hubData;
  int selectedFilterIndex = 0; // للتحكم في الفلتر النشط

  @override
  void initState() {
    super.initState();
    // داتا وهمية (Mock Data) مطابقة للصورة للاختبار لحين ربط الـ API
    hubData = AiHubDataModel.fromJson({
      "trendPercentage": "↗ +4%",
      "globalRank": 92,
      "chartData": [30.0, 45.0, 40.0, 55.0, 75.0, 85.0], // أطوال العواميد في الرسم البياني
      "checks": [
        {
          "exerciseName": "Barbell Squat",
          "dateString": "OCT 14",
          "setsCount": 4,
          "statusKey": "elite",
          "score": 92,
          "imageUrl": "https://images.unsplash.com/photo-1574680096145-d05b474e2155?q=80&w=300&auto=format&fit=crop"
        },
        {
          "exerciseName": "Sumo Deadlift",
          "dateString": "OCT 12",
          "setsCount": 2,
          "statusKey": "good",
          "score": 84,
          "imageUrl": "https://images.unsplash.com/photo-1517836357463-d25dfeac3438?q=80&w=300&auto=format&fit=crop"
        },
        {
          "exerciseName": "Bench Press",
          "dateString": "OCT 10",
          "setsCount": 5,
          "statusKey": "needs_work",
          "score": 68,
          "imageUrl": "https://images.unsplash.com/photo-1534438327276-14e5300c3a48?q=80&w=300&auto=format&fit=crop"
        }
      ]
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    // قائمة الفلاتر مربوطة باللوكاليزيشن بشكل مباشر تمم
    final List<String> filters = [
      l10n.filter_all,
      l10n.filter_squat,
      l10n.filter_deadlift,
      l10n.filter_bench_press,
    ];

    return Scaffold(
      backgroundColor: AppColors.background, 
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: AppColors.darkCharcoal),
          onPressed: () {}, 
        ),
        title: Text(
          "KINETIC",
          style: AppTextStyles.heading24.copyWith(color: AppColors.primary, fontWeight: FontWeight.w900, letterSpacing: 1.5),
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: CircleAvatar(
              radius: 18,
              backgroundImage: const NetworkImage("https://images.unsplash.com/photo-1599566150163-29194dcaad36?q=80&w=200&auto=format&fit=crop"),
              backgroundColor: AppColors.primary,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. كارت الملخص الأسبوعي
            WeeklySummaryCardWidget(
              trend: hubData.trendPercentage,
              rank: hubData.globalRank,
              chartData: hubData.chartData,
            ),
            const SizedBox(height: 24),

            // 2. الفلاتر الأفقية
            SizedBox(
              height: 45,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (context, index) {
                  return HubFilterChipWidget(
                    label: filters[index],
                    isSelected: selectedFilterIndex == index,
                    onTap: () {
                      setState(() {
                        selectedFilterIndex = index;
                      });
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 32),

            // 3. عنوان الفحوصات الزمنية من اللوكاليزيشن
            Text(l10n.chronological_checks, style: AppTextStyles.label10Grey.copyWith(letterSpacing: 1)),
            const SizedBox(height: 16),

            // 4. قائمة التمارين (التي تستخدم الويدجت المعدل النظيف)
            ...hubData.checks.map((check) => ChronologicalCheckCardWidget(checkItem: check)).toList(),
            
            const SizedBox(height: 40), 
          ],
        ),
      ),
    );
  }
}