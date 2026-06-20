import 'package:flutter/material.dart';
import 'package:kinetic/core/shared_widgets/custom_bottom_nav_bar.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/features/ai/pages/ai_screen.dart';

import 'package:kinetic/features/profile/pages/profile_screen.dart';
import 'package:kinetic/features/train/pages/train_screen.dart';

class MainLayoutScreen extends StatefulWidget {
  const MainLayoutScreen({Key? key}) : super(key: key);

  @override
  State<MainLayoutScreen> createState() => _MainLayoutScreenState();
}

class _MainLayoutScreenState extends State<MainLayoutScreen> {
  // 👇 التعديل هنا: خليناها 0 عشان التطبيق يفتح على صفحة الـ Home
  int _currentIndex = 0; 

  // 👇 التعديل هنا: رتبنا الصفحات حسب الـ Nav Bar الجديد
  final List<Widget> _pages = const [
    
    TrainScreen(),  // 1. Programs
     AIScreen() ,   // 2. AI Hub
    ProfileScreen(),                       // 3. Profile
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          if (_currentIndex != index) {
            setState(() {
              _currentIndex = index;
            });
          }
        },
      ),
    );
  }
}