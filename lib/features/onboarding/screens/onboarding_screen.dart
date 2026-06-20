import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/auth/screens/login_screen.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/shared_widgets/custom_gradient_button.dart';
import '../widgets/onboarding_card.dart';
import 'step1_goal_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(viewportFraction: 0.85);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final screenHeight = MediaQuery.of(context).size.height; 

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              height: screenHeight * 0.60,
              width: double.infinity,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/images/Athlete sprinting at high speed.png',
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          AppColors.scaffoldBackground.withOpacity(0.4),
                          AppColors.scaffoldBackground,
                        ],
                        stops: const [0.4, 0.8, 1.0],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.33),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: l10n.onb_heading1_part1, style: AppTextStyles.heroHeadingItalic),
                            TextSpan(text: l10n.onb_heading1_part2, style: AppTextStyles.heroHeadingPrimaryItalic),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(l10n.onb_heading2, style: AppTextStyles.heading24.copyWith(fontStyle: FontStyle.italic, fontWeight: FontWeight.w900)),
                      const SizedBox(height: 12),
                      Text(l10n.onb_body, style: AppTextStyles.body14WithHeight),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                SizedBox(
                  height: 200,
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() { _currentPage = page; });
                    },
                    children: [
                      OnboardingCard(icon: Icons.flash_on, tag: l10n.onb_card1_tag, title: l10n.onb_card1_title, body: l10n.onb_card1_body),
                      const OnboardingCard(icon: Icons.bar_chart, tag: "TOP 1% INSIGHTS", title: "Deep Insights", body: "Visual trends and PR tracking to see your growth."),
                      const OnboardingCard(icon: Icons.fitness_center, tag: "AI DRIVEN", title: "Smart Routines", body: "Adaptable plans tailored to your specific gear."),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    3,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      height: 8,
                      width: _currentPage == index ? 24 : 8,
                      decoration: BoxDecoration(
                        color: _currentPage == index ? AppColors.primary : AppColors.lightGray,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    children: [
                      CustomGradientButton(
                        text: l10n.button_start_journey,
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const Step1GoalScreen()));
                        },
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const LoginScreen()),
                    );
                        },
                        child: Text(l10n.login_prompt, style: AppTextStyles.body14BlueNoHeight.copyWith(fontWeight: FontWeight.w600)),
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}