import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  // ==========================================
  // --- 1. Onboarding Top Bar & Navigation ---
  // ==========================================
  static const TextStyle topBarStep = TextStyle(color: AppColors.textGrey, fontSize: 11, fontFamily: 'Inter', fontWeight: FontWeight.w700, letterSpacing: 0.88);
  static const TextStyle topBarSkip = TextStyle(color: AppColors.primary, fontSize: 13, fontFamily: 'Inter', fontWeight: FontWeight.w600);

  // ==========================================
  // --- 2. Headings & Titles ---
  // ==========================================
  static const TextStyle logoTitle = TextStyle(color: AppColors.primary, fontSize: 48, fontFamily: 'Inter', fontWeight: FontWeight.w900, height: 1, letterSpacing: -2.40);
  static const TextStyle logoSubtitle = TextStyle(color: AppColors.primary, fontSize: 18, fontFamily: 'Inter', fontWeight: FontWeight.w900, letterSpacing: 1.80);
  
  static const TextStyle heroHeadingItalic = TextStyle(color: AppColors.nearBlack, fontSize: 54, fontStyle: FontStyle.italic, fontFamily: 'Inter', fontWeight: FontWeight.w900, height: 0.9, letterSpacing: -2.5);
  static const TextStyle heroHeadingPrimaryItalic = TextStyle(color: AppColors.primary, fontSize: 54, fontStyle: FontStyle.italic, fontFamily: 'Inter', fontWeight: FontWeight.w900);
  
  static const TextStyle heading36 = TextStyle(color: AppColors.darkCharcoal, fontSize: 36, fontFamily: 'Inter', fontWeight: FontWeight.w800, letterSpacing: -1.80);
  static const TextStyle heading36Black = TextStyle(color: AppColors.darkCharcoal, fontSize: 36, fontFamily: 'Inter', fontWeight: FontWeight.w900, height: 1.10, letterSpacing: -1.80);
  static const TextStyle heading36Primary = TextStyle(color: AppColors.primary, fontSize: 36, fontFamily: 'Inter', fontWeight: FontWeight.w900, height: 1.10, letterSpacing: -1.80);
  
  static const TextStyle heading24 = TextStyle(color: AppColors.darkCharcoal, fontSize: 24, fontFamily: 'Inter', fontWeight: FontWeight.w400, letterSpacing: -0.60);
  static const TextStyle appBarTitle = TextStyle(color: AppColors.darkCharcoal, fontSize: 16, fontFamily: 'Inter', fontWeight: FontWeight.w700, letterSpacing: -0.80);
  static const TextStyle title18Dark = TextStyle(color: AppColors.deepSlate, fontSize: 18, fontFamily: 'Inter', fontWeight: FontWeight.w700);

  // ==========================================
  // --- 3. Subtitles & Body Text ---
  // ==========================================
  static const TextStyle loginSubtitle = TextStyle(color: AppColors.textGrey, fontSize: 18, fontFamily: 'Inter', fontWeight: FontWeight.w500, height: 1.56, letterSpacing: -0.45);
  static const TextStyle signUpSubtitle = TextStyle(color: AppColors.textGrey, fontSize: 18, fontFamily: 'Inter', fontWeight: FontWeight.w500, height: 1.25, letterSpacing: -0.45);
  static const TextStyle resetInstructions = TextStyle(color: AppColors.textGrey, fontSize: 18, fontFamily: 'Inter', fontWeight: FontWeight.w500, height: 1.63);
  static const TextStyle body16 = TextStyle(color: AppColors.textGrey, fontSize: 16, fontFamily: 'Inter', fontWeight: FontWeight.w400, height: 1.63);
  
  static const TextStyle body14Height = TextStyle(color: AppColors.textGrey, fontSize: 14, fontFamily: 'Inter', fontWeight: FontWeight.w400, height: 1.43); 
  static const TextStyle body14WithHeight = TextStyle(color: AppColors.textGrey, fontSize: 14, fontFamily: 'Inter', fontWeight: FontWeight.w500, height: 1.43);
  static const TextStyle body14BlueWithHeight = TextStyle(color: AppColors.primary, fontSize: 14, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.43);
  static const TextStyle body14NoHeight = TextStyle(color: AppColors.textGrey, fontSize: 14, fontFamily: 'Inter', fontWeight: FontWeight.w500);
  static const TextStyle body14BlueNoHeight = TextStyle(color: AppColors.primary, fontSize: 14, fontFamily: 'Inter', fontWeight: FontWeight.w700);

  // ==========================================
  // --- 4. Cards & Insights (Onboarding) ---
  // ==========================================
  static const TextStyle cardTitle18 = TextStyle(color: AppColors.darkCharcoal, fontSize: 18, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.25);
  static const TextStyle cardTitle14 = TextStyle(color: AppColors.darkCharcoal, fontSize: 14, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.2);
  static const TextStyle cardSubtitle13 = TextStyle(color: AppColors.textGrey, fontSize: 13, fontFamily: 'Inter', fontWeight: FontWeight.w400, height: 1.25);
  
  static const TextStyle insightTitle = TextStyle(color: AppColors.insightIconBg, fontSize: 10, fontFamily: 'Inter', fontWeight: FontWeight.w900, height: 1.50, letterSpacing: 0.90);
  static const TextStyle insightBody = TextStyle(color: AppColors.insightTextDark, fontSize: 12, fontFamily: 'Inter', fontWeight: FontWeight.w500, height: 1.63);
  static const TextStyle insightBodyBold = TextStyle(color: AppColors.insightIconBg, fontSize: 12, fontFamily: 'Inter', fontWeight: FontWeight.w900);

  // ==========================================
  // --- 5. Buttons ---
  // ==========================================
  static const TextStyle primaryButton16 = TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700, letterSpacing: -0.40);
  static const TextStyle primaryButton18 = TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700);
  static const TextStyle textButton14Spacing = TextStyle(color: AppColors.primary, fontSize: 14, fontWeight: FontWeight.w700, letterSpacing: 1.40);
  static const TextStyle socialButtonText = TextStyle(fontSize: 14, fontFamily: 'Inter', fontWeight: FontWeight.w600, height: 1.43, letterSpacing: -0.35);

  // ==========================================
  // --- 6. Labels, Inputs & Captions ---
  // ==========================================
  static const TextStyle orDivider = TextStyle(color: AppColors.mutedGrey, fontSize: 10, fontFamily: 'Inter', fontWeight: FontWeight.w800, height: 1.50, letterSpacing: 2);
  
  static const TextStyle label10Grey = TextStyle(color: AppColors.mutedGrey, fontSize: 10, fontWeight: FontWeight.w700, letterSpacing: 1);
  static const TextStyle label10Blue = TextStyle(color: AppColors.primary, fontSize: 10, fontWeight: FontWeight.w700, letterSpacing: 0.50);
  static const TextStyle label10GreyDark = TextStyle(color: AppColors.textGrey, fontSize: 10, fontWeight: FontWeight.w700, letterSpacing: 1);
  
  static const TextStyle fieldLabel = TextStyle(color: AppColors.mutedGrey, fontSize: 10, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.50, letterSpacing: 1);
  static const TextStyle fieldRightLabel = TextStyle(color: AppColors.primary, fontSize: 10, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.50, letterSpacing: 0.50);
  static const TextStyle fieldHint = TextStyle(color: AppColors.hintColor, fontSize: 16, fontFamily: 'Inter');

  static const TextStyle smallCaption11 = TextStyle(color: AppColors.mutedGrey, fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 1.10);
  static const TextStyle caption12 = TextStyle(fontSize: 12, fontFamily: 'Inter', fontWeight: FontWeight.w500, height: 1.33);

  // ==========================================
  // --- 7. Special Elements & Spans ---
  // ==========================================
  static const TextStyle reqItemChecked = TextStyle(color: AppColors.darkCharcoal, fontSize: 14, fontWeight: FontWeight.w500);
  static const TextStyle reqItemUnchecked = TextStyle(color: AppColors.textGrey, fontSize: 14, fontWeight: FontWeight.w500);
  static const TextStyle boldText = TextStyle(fontWeight: FontWeight.w700);
  static const TextStyle spanGrey = TextStyle(color: AppColors.borderGrey);
  static const TextStyle spanBlueUnderline = TextStyle(color: AppColors.primary, decoration: TextDecoration.underline);

  // ==========================================
  // --- 8. Profile & Nav Bar Specific ---
  // ==========================================
  static const TextStyle profileName30 = TextStyle(color: AppColors.darkCharcoal, fontSize: 30, fontFamily: 'Inter', fontWeight: FontWeight.w900, height: 1.20, letterSpacing: -1.50);
  static const TextStyle profileProMember10 = TextStyle(color: AppColors.primary, fontSize: 10, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.50, letterSpacing: 1);
  static const TextStyle profileStat20 = TextStyle(color: AppColors.darkCharcoal, fontSize: 20, fontFamily: 'Inter', fontWeight: FontWeight.w800, height: 1.40);
  static const TextStyle profileStatLabel10 = TextStyle(color: AppColors.textGrey, fontSize: 10, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.50, letterSpacing: 0.50);
  
  static const TextStyle profileVolume36 = TextStyle(color: AppColors.darkCharcoal, fontSize: 36, fontFamily: 'Inter', fontWeight: FontWeight.w900, height: 1.11);
  static const TextStyle profileVolumeUnit18 = TextStyle(color: AppColors.textGrey, fontSize: 18, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.56);
  
  static const TextStyle profileWorkouts24 = TextStyle(color: AppColors.darkCharcoal, fontSize: 24, fontFamily: 'Inter', fontWeight: FontWeight.w900, height: 1.33);
  static const TextStyle profileStreak24 = TextStyle(color: AppColors.white, fontSize: 24, fontFamily: 'Inter', fontWeight: FontWeight.w900, height: 1.33);
  static const TextStyle profileStreakLabel10 = TextStyle(color: AppColors.lightBlueTransparent, fontSize: 10, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.50, letterSpacing: 0.50);
  
  static const TextStyle profileConsistency18 = TextStyle(color: AppColors.darkCharcoal, fontSize: 18, fontFamily: 'Inter', fontWeight: FontWeight.w900, height: 1.56, letterSpacing: -0.45);
  static const TextStyle profileConsistencySub12 = TextStyle(color: AppColors.textGrey, fontSize: 12, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.33);
  
  static const TextStyle profileSectionTitle10 = TextStyle(color: AppColors.textGrey, fontSize: 10, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.50, letterSpacing: 1.50);
  static const TextStyle profileListText16 = TextStyle(color: AppColors.darkCharcoal, fontSize: 16, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.50);
  static const TextStyle profileViewAll10 = TextStyle(color: AppColors.primary, fontSize: 10, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.50);
  static const TextStyle profileBadge10 = TextStyle(color: AppColors.textGrey, fontSize: 10, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.50);
  
  static const TextStyle profileAppBar18 = TextStyle(color: AppColors.darkCharcoal, fontSize: 18, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.56, letterSpacing: -0.45);
  
  static const TextStyle navBarUnselected10 = TextStyle(color: AppColors.darkCharcoal50, fontSize: 10, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.50, letterSpacing: 0.50);
  static const TextStyle navBarSelected10 = TextStyle(color: AppColors.white, fontSize: 10, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.50, letterSpacing: 0.50);
  // ==========================================
  // --- 9. Settings Specific ---
  // ==========================================
  static const TextStyle settingsName20 = TextStyle(color: AppColors.darkCharcoal, fontSize: 20, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.40, letterSpacing: -0.50);
  static const TextStyle settingsEmail16 = TextStyle(color: AppColors.textGrey, fontSize: 16, fontFamily: 'Inter', fontWeight: FontWeight.w400, height: 1.50);
  static const TextStyle settingsEditProfile14 = TextStyle(color: AppColors.primary, fontSize: 14, fontFamily: 'Inter', fontWeight: FontWeight.w600, height: 1.43);
  
  static const TextStyle settingsSectionTitle10 = TextStyle(color: AppColors.textGrey, fontSize: 10, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.50, letterSpacing: 0.50);
  
  static const TextStyle settingsItemTitle16 = TextStyle(color: AppColors.darkCharcoal, fontSize: 16, fontFamily: 'Inter', fontWeight: FontWeight.w600, height: 1.50);
  static const TextStyle settingsItemSubtitle12 = TextStyle(color: AppColors.textGrey, fontSize: 12, fontFamily: 'Inter', fontWeight: FontWeight.w400, height: 1.33);
  
  static const TextStyle settingsToggleSelected14 = TextStyle(color: AppColors.white, fontSize: 14, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.43);
  static const TextStyle settingsToggleUnselected14 = TextStyle(color: AppColors.textGrey, fontSize: 14, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.43);
  
  static const TextStyle settingsTrailingText14 = TextStyle(color: AppColors.textGrey, fontSize: 14, fontFamily: 'Inter', fontWeight: FontWeight.w400, height: 1.43);
  static const TextStyle settingsSubItem14 = TextStyle(color: AppColors.textGrey, fontSize: 14, fontFamily: 'Inter', fontWeight: FontWeight.w500, height: 1.43);
  
  static const TextStyle settingsLogout16 = TextStyle(color: AppColors.errorRed, fontSize: 16, fontFamily: 'Inter', fontWeight: FontWeight.w800, height: 1.50, letterSpacing: -0.40);
  static const TextStyle settingsVersion10 = TextStyle(color: AppColors.borderGrey, fontSize: 10, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.50, letterSpacing: 2);
  // ==========================================
  // --- 10. Train Screen Specific ---
  // ==========================================
  static const TextStyle trainAppBar20 = TextStyle(color: AppColors.darkCharcoal, fontSize: 20, fontFamily: 'Inter', fontWeight: FontWeight.w900, height: 1.40, letterSpacing: -1);
  
  static const TextStyle trainStreakLabel10 = TextStyle(color: AppColors.textGrey, fontSize: 10, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.50, letterSpacing: 2);
  static const TextStyle trainStreakValue60 = TextStyle(color: AppColors.primary, fontSize: 60, fontFamily: 'Inter', fontWeight: FontWeight.w900, height: 1, letterSpacing: -3);
  static const TextStyle trainStreakUnit20 = TextStyle(color: AppColors.primary, fontSize: 20, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.40);
  static const TextStyle trainStreakBest11 = TextStyle(color: AppColors.textGrey, fontSize: 11, fontFamily: 'Inter', fontWeight: FontWeight.w500, height: 1.50, letterSpacing: 0.28);
  
  static const TextStyle trainVolumeLabel10 = TextStyle(color: AppColors.textGrey, fontSize: 10, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.50, letterSpacing: 2);
  static const TextStyle trainVolumeValue24 = TextStyle(color: AppColors.darkCharcoal, fontSize: 24, fontFamily: 'Inter', fontWeight: FontWeight.w900, height: 1.33, letterSpacing: -1.20);
  static const TextStyle trainVolumeUnit10 = TextStyle(color: AppColors.textGrey, fontSize: 10, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.50, letterSpacing: 1);
  
  static const TextStyle trainEmptyWorkout24 = TextStyle(color: AppColors.lightBlueWhite, fontSize: 24, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.33, letterSpacing: -0.60);
  static const TextStyle trainEmptyWorkoutSub14 = TextStyle(color: AppColors.lightBlueWhite80, fontSize: 14, fontFamily: 'Inter', fontWeight: FontWeight.w500, height: 1.43);
  
  static const TextStyle trainSectionTitle24 = TextStyle(color: AppColors.darkCharcoal, fontSize: 24, fontFamily: 'Inter', fontWeight: FontWeight.w900, height: 1.33, letterSpacing: -1.20);
  static const TextStyle trainSectionTitleLight24 = TextStyle(color: AppColors.darkCharcoal, fontSize: 24, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.33, letterSpacing: -0.60);
  static const TextStyle trainSeeAll12 = TextStyle(color: AppColors.primary, fontSize: 12, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.33, letterSpacing: 1.80);
  
  static const TextStyle trainFolderText14 = TextStyle(color: AppColors.darkCharcoal, fontSize: 14, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.25);
  static const TextStyle trainNewFolder14 = TextStyle(color: AppColors.textGrey, fontSize: 14, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.25);
  
  static const TextStyle trainRoutineLastPerformed10 = TextStyle(color: AppColors.primary, fontSize: 10, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.50, letterSpacing: 1);
  static const TextStyle trainRoutineTitle20 = TextStyle(color: AppColors.darkCharcoal, fontSize: 20, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.40);
  static const TextStyle trainRoutineMuscles14 = TextStyle(color: AppColors.textGrey, fontSize: 14, fontFamily: 'Inter', fontWeight: FontWeight.w500, height: 1.43);
  static const TextStyle trainRoutineMeta12 = TextStyle(color: AppColors.textGrey, fontSize: 12, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.33);
  // ==========================================
  // --- 11. Active Session Specific ---
  // ==========================================
  static const TextStyle sessionTime18 = TextStyle(color: Color(0xFF0F172A), fontSize: 18, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.56, letterSpacing: -0.45);
  static const TextStyle sessionActive10 = TextStyle(color: AppColors.primary, fontSize: 10, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.50, letterSpacing: 0.50);
  static const TextStyle sessionFinish14 = TextStyle(color: Colors.white, fontSize: 14, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.43);
  
  static const TextStyle sessionMorning11 = TextStyle(color: AppColors.primary, fontSize: 11, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.50, letterSpacing: 1.10);
  static const TextStyle sessionTitle36 = TextStyle(color: AppColors.darkCharcoal, fontSize: 36, fontFamily: 'Inter', fontWeight: FontWeight.w800, height: 1, letterSpacing: -0.90);
  static const TextStyle sessionFocus36 = TextStyle(color: AppColors.focusBlue, fontSize: 36, fontFamily: 'Inter', fontWeight: FontWeight.w800);
  static const TextStyle sessionKcal24 = TextStyle(color: AppColors.darkCharcoal, fontSize: 24, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.33);
  static const TextStyle sessionKcalLabel10 = TextStyle(color: AppColors.textGrey, fontSize: 10, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.50);
  
  static const TextStyle sessionExTitle20 = TextStyle(color: AppColors.darkCharcoal, fontSize: 20, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.40);
  static const TextStyle sessionExRest12 = TextStyle(color: AppColors.primary, fontSize: 12, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.33);
  static const TextStyle sessionExMuscle12 = TextStyle(color: AppColors.textGrey, fontSize: 12, fontFamily: 'Inter', fontWeight: FontWeight.w500, height: 1.33);
  
  static const TextStyle sessionTableHead10 = TextStyle(color: AppColors.textGrey, fontSize: 10, fontFamily: 'Inter', fontWeight: FontWeight.w800, height: 1.50, letterSpacing: 1);
  static const TextStyle sessionSetNum14 = TextStyle(color: AppColors.darkCharcoal, fontSize: 14, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.43);
  static const TextStyle sessionPrev12 = TextStyle(color: AppColors.textGrey, fontSize: 12, fontStyle: FontStyle.italic, fontFamily: 'Inter', fontWeight: FontWeight.w400, height: 1.33);
  static const TextStyle sessionInput14 = TextStyle(color: AppColors.darkCharcoal, fontSize: 14, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.43);
  static const TextStyle sessionInputHint14 = TextStyle(color: Color(0xFF6B7280), fontSize: 14, fontFamily: 'Inter', fontWeight: FontWeight.w700);
  
  static const TextStyle sessionAddSet14 = TextStyle(color: AppColors.textGrey, fontSize: 14, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.43);
  static const TextStyle sessionAddEx18 = TextStyle(color: AppColors.primary, fontSize: 18, fontFamily: 'Inter', fontWeight: FontWeight.w800, height: 1.56);
  
  static const TextStyle sessionResting14 = TextStyle(color: Colors.white, fontSize: 14, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.25);
  static const TextStyle sessionNextSet10 = TextStyle(color: Colors.white60, fontSize: 10, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.50, letterSpacing: -0.50);
  static const TextStyle sessionRestTime20 = TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'Inter', fontWeight: FontWeight.w900, height: 1.40);
  // ==========================================
  // --- 12. Dialogs Specific ---
  // ==========================================
  static const TextStyle dialogTitle24 = TextStyle(color: AppColors.darkCharcoal, fontSize: 24, fontFamily: 'Inter', fontWeight: FontWeight.w900, height: 1.33, letterSpacing: -0.60);
  static const TextStyle dialogBody16 = TextStyle(color: AppColors.textGrey, fontSize: 16, fontFamily: 'Inter', fontWeight: FontWeight.w400, height: 1.63);
  static const TextStyle dialogBodyBold16 = TextStyle(color: AppColors.darkCharcoal, fontSize: 16, fontFamily: 'Inter', fontWeight: FontWeight.w700);
  
  static const TextStyle dialogBtnRed16 = TextStyle(color: Colors.white, fontSize: 16, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.50);
  static const TextStyle dialogBtnGray16 = TextStyle(color: AppColors.darkCharcoal, fontSize: 16, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.50);
  // ==========================================
  // --- 13. Summary Screen Specific ---
  // ==========================================
  static const TextStyle sumSession10 = TextStyle(color: AppColors.primary, fontSize: 10, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.50, letterSpacing: 1);
  static const TextStyle sumCrushed36 = TextStyle(color: AppColors.darkCharcoal, fontSize: 36, fontFamily: 'Inter', fontWeight: FontWeight.w900, height: 0.90, letterSpacing: -1.80);
  
  static const TextStyle sumStatTitle10 = TextStyle(color: AppColors.textGrey, fontSize: 10, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.50, letterSpacing: 1);
  static const TextStyle sumStatValue30 = TextStyle(color: AppColors.darkCharcoal, fontSize: 30, fontFamily: 'Inter', fontWeight: FontWeight.w900, height: 1.20, letterSpacing: -1.50);
  
  static const TextStyle sumTotalVolume48 = TextStyle(color: AppColors.darkCharcoal, fontSize: 48, fontFamily: 'Inter', fontWeight: FontWeight.w900, height: 1, letterSpacing: -2.40);
  
  static const TextStyle sumPR16 = TextStyle(color: Color(0xFF60136D), fontSize: 16, fontFamily: 'Inter', fontWeight: FontWeight.w900, letterSpacing: -0.40);
  static const TextStyle sumPRSub14 = TextStyle(color: Color(0xFF6A1F76), fontSize: 14, fontFamily: 'Inter', fontWeight: FontWeight.w600, height: 1.43);
  
  static const TextStyle sumBreakdownTitle16 = TextStyle(color: AppColors.darkCharcoal, fontSize: 16, fontFamily: 'Inter', fontWeight: FontWeight.w700, letterSpacing: -0.40);
  // --- إضافات شاشة إعدادات الراحة ---
  static const TextStyle timerHuge80 = TextStyle(color: AppColors.nearBlack, fontSize: 80, fontFamily: 'Inter', fontWeight: FontWeight.w900, height: 1.1, letterSpacing: -3.0);
  static const TextStyle timerSub10 = TextStyle(color: AppColors.textGrey, fontSize: 10, fontFamily: 'Inter', fontWeight: FontWeight.w800, height: 1.5, letterSpacing: 2.5);
  // ==========================================
  // --- 14. New Personal Record Screen ---
  // ==========================================
  static const TextStyle prCongrats10 = TextStyle(color: Color(0xFF004CA4), fontSize: 10, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.50, letterSpacing: 2);
  static const TextStyle prWeight72 = TextStyle(color: Color(0xFF2D2E33), fontSize: 72, fontFamily: 'Inter', fontWeight: FontWeight.w900, height: 1, letterSpacing: -3.60);
  static const TextStyle prExercise24 = TextStyle(color: Color(0xFF5B5B60), fontSize: 24, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.33, letterSpacing: -0.60);
  static const TextStyle prImproved14 = TextStyle(color: Color(0xFF5191FF), fontSize: 14, fontFamily: 'Inter', fontWeight: FontWeight.w500, height: 1.43, letterSpacing: 0.35);
  
  static const TextStyle prBadge20 = TextStyle(color: Color(0xFF0058BB), fontSize: 20, fontFamily: 'Inter', fontWeight: FontWeight.w900, height: 1.40, letterSpacing: -1);
  
  static const TextStyle prCardLabel10 = TextStyle(color: Color(0x995B5B60), fontSize: 10, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.50, letterSpacing: 1);
  static const TextStyle prCardValue24 = TextStyle(color: Color(0xFF2D2E33), fontSize: 24, fontFamily: 'Inter', fontWeight: FontWeight.w900, height: 1.33);
  static const TextStyle prCardUnit12 = TextStyle(color: Color(0xFF5B5B60), fontSize: 12, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.33);
  
  static const TextStyle prCardIncLabel10 = TextStyle(color: Color(0x990058BB), fontSize: 10, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.50, letterSpacing: 1);
  static const TextStyle prCardIncValue24 = TextStyle(color: Color(0xFF0058BB), fontSize: 24, fontFamily: 'Inter', fontWeight: FontWeight.w900, height: 1.33);
  static const TextStyle prCardIncUnit12 = TextStyle(color: Color(0xFF0058BB), fontSize: 12, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.33);
  
  static const TextStyle prActivityTitle10 = TextStyle(color: Color(0x995B5B60), fontSize: 10, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.50, letterSpacing: 1);
  static const TextStyle prActivityDesc14 = TextStyle(color: Color(0xFF2D2E33), fontSize: 14, fontFamily: 'Inter', fontWeight: FontWeight.w500, height: 1.43);
  
  static const TextStyle prChartTitle18 = TextStyle(color: Color(0xFF2D2E33), fontSize: 18, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.56);
  static const TextStyle prChartTag12 = TextStyle(color: Color(0xFF004CA4), fontSize: 12, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.33);
  static const TextStyle prTag10 = TextStyle(color: Colors.white, fontSize: 10, fontFamily: 'Inter', fontWeight: FontWeight.w900, height: 1.50);
  
  static const TextStyle prAwesome18 = TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Inter', fontWeight: FontWeight.w900, height: 1.56, letterSpacing: -0.45);
  static const TextStyle prViewHistory14 = TextStyle(color: Color(0xFF0058BB), fontSize: 14, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.43);
  static const TextStyle menuOption16 = TextStyle(color: AppColors.nearBlack, fontSize: 16, fontFamily: 'Inter', fontWeight: FontWeight.w600, height: 1.50);
  // ==========================================
  // --- 16. Add Exercise Screen ---
  // ==========================================
  static const TextStyle addExAppBarTitle = TextStyle(color: Color(0xFF1E293B), fontSize: 18, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.56, letterSpacing: -0.45);
  static const TextStyle addExCancelBtn = TextStyle(color: AppColors.primary, fontSize: 16, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.50, letterSpacing: -0.40);
  
  static const TextStyle addExSearchHint = TextStyle(color: AppColors.textGrey, fontSize: 16, fontFamily: 'Inter', fontWeight: FontWeight.w400);
  static const TextStyle addExFiltersBtn = TextStyle(color: AppColors.primary, fontSize: 16, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.50, letterSpacing: 0.40);
  
  static const TextStyle addExSectionTitle = TextStyle(color: AppColors.textGrey, fontSize: 12, fontFamily: 'Inter', fontWeight: FontWeight.w900, height: 1.33, letterSpacing: 1.20);
  static const TextStyle addExSeeAll = TextStyle(color: AppColors.primary, fontSize: 12, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.33);
  
  static const TextStyle addExCardTitle = TextStyle(color: AppColors.darkCharcoal, fontSize: 16, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.50);
  
  static const TextStyle addExTagMuscle = TextStyle(color: AppColors.primary, fontSize: 10, fontFamily: 'Inter', fontWeight: FontWeight.w900, height: 1.50, letterSpacing: 1);
  static const TextStyle addExTagEquipment = TextStyle(color: AppColors.textGrey, fontSize: 10, fontFamily: 'Inter', fontWeight: FontWeight.w900, height: 1.50, letterSpacing: 1);
  
  static const TextStyle addExSubmitBtn = TextStyle(color: Colors.white, fontSize: 12, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.50, letterSpacing: 0.60);
  // ==========================================
  // --- Discover Screen Specific ---
  // ==========================================
  static const TextStyle discoverSearchHint16 = TextStyle(color: Color(0x995B5B60), fontSize: 16, fontFamily: 'Inter', fontWeight: FontWeight.w400);
  static const TextStyle discoverSectionLabel10 = TextStyle(color: AppColors.primary, fontSize: 10, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.50, letterSpacing: 2);
  static const TextStyle discoverSectionTitle30 = TextStyle(color: AppColors.darkCharcoal, fontSize: 30, fontFamily: 'Inter', fontWeight: FontWeight.w900, height: 1.20, letterSpacing: -1.50);
  static const TextStyle discoverViewAll14 = TextStyle(color: AppColors.primary, fontSize: 14, fontFamily: 'Inter', fontWeight: FontWeight.w600, height: 1.43);
  
  static const TextStyle discoverProgramTitle24 = TextStyle(color: Colors.white, fontSize: 24, fontStyle: FontStyle.italic, fontFamily: 'Inter', fontWeight: FontWeight.w900, height: 1.33, letterSpacing: -0.60);
  static const TextStyle discoverProgramTag10 = TextStyle(color: Colors.white, fontSize: 10, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.50, letterSpacing: 1);
  
  static const TextStyle discoverCategoryTitle12 = TextStyle(color: AppColors.darkCharcoal, fontSize: 12, fontFamily: 'Inter', fontWeight: FontWeight.w900, height: 1.33, letterSpacing: 1.20);
  
  static const TextStyle discoverRoutineTitle18 = TextStyle(color: AppColors.darkCharcoal, fontSize: 18, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.56, letterSpacing: -0.45);
  static const TextStyle discoverRoutineCreator12 = TextStyle(color: AppColors.textGrey, fontSize: 12, fontFamily: 'Inter', fontWeight: FontWeight.w500, height: 1.33);
  static const TextStyle discoverRoutineExercises14 = TextStyle(color: AppColors.darkCharcoal, fontSize: 14, fontFamily: 'Inter', fontWeight: FontWeight.w900, height: 1.43);
  static const TextStyle discoverRoutineTime10 = TextStyle(color: AppColors.textGrey, fontSize: 10, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.50, letterSpacing: 0.50);
  // ==========================================
  // --- 17. Feed Screen Specific ---
  // ==========================================
  static const TextStyle feedTabSelected14 = TextStyle(color: Color(0xFFF0F2FF), fontSize: 14, fontFamily: 'Inter', fontWeight: FontWeight.w600, height: 1.43);
  static const TextStyle feedTabUnselected14 = TextStyle(color: Color(0xFF5B5B60), fontSize: 14, fontFamily: 'Inter', fontWeight: FontWeight.w600, height: 1.43);
  
  static const TextStyle feedUserName16 = TextStyle(color: AppColors.darkCharcoal, fontSize: 16, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.25);
  static const TextStyle feedTimeAgo12 = TextStyle(color: AppColors.textGrey, fontSize: 12, fontFamily: 'Inter', fontWeight: FontWeight.w400, height: 1.33);
  
  static const TextStyle feedPrBadge10 = TextStyle(color: AppColors.primary, fontSize: 10, fontFamily: 'Inter', fontWeight: FontWeight.w900, height: 1.50, letterSpacing: 1);
  
  static const TextStyle feedPostTitle24 = TextStyle(color: AppColors.darkCharcoal, fontSize: 24, fontFamily: 'Inter', fontWeight: FontWeight.w900, height: 1.33, letterSpacing: -0.60);
  static const TextStyle feedPostDesc14 = TextStyle(color: AppColors.textGrey, fontSize: 14, fontFamily: 'Inter', fontWeight: FontWeight.w400, height: 1.63);
  
  static const TextStyle feedStatValue24 = TextStyle(color: AppColors.primary, fontSize: 24, fontFamily: 'Inter', fontWeight: FontWeight.w800, height: 1);
  static const TextStyle feedStatLabel10 = TextStyle(color: AppColors.textGrey, fontSize: 10, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.50, letterSpacing: 1);
  
  static const TextStyle feedExName14 = TextStyle(color: AppColors.darkCharcoal, fontSize: 14, fontFamily: 'Inter', fontWeight: FontWeight.w600, height: 1.43);
  static const TextStyle feedExDetails12 = TextStyle(color: AppColors.textGrey, fontSize: 12, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.33);
  static const TextStyle feedExPrDetails12 = TextStyle(color: AppColors.primary, fontSize: 12, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.33);
  
  static const TextStyle feedActionText14 = TextStyle(color: AppColors.darkCharcoal, fontSize: 14, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.43);
  // ==========================================
  // Headers & Subheaders
  // ==========================================
  // كبرنا العناوين الجانبية لـ 12 بدل 10
  static const TextStyle sectionLabel = TextStyle(color: Color(0xFF0058BB), fontSize: 12, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.50, letterSpacing: 2);
  static const TextStyle sectionLabelDark = TextStyle(color: Color(0xFF2D2E33), fontSize: 12, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.50, letterSpacing: 1);
  // كبرنا العناوين الرئيسية لـ 26 بدل 24 وتقلنا الوزن لـ w800
  static const TextStyle sectionTitle = TextStyle(color: Color(0xFF2D2E33), fontSize: 26, fontFamily: 'Inter', fontWeight: FontWeight.w800, height: 1.33, letterSpacing: -0.60);

  // ==========================================
  // Welcome Section
  // ==========================================
  // كبرنا الترحيب لـ 40 بدل 36
  static const TextStyle welcomeTo = TextStyle(color: Color(0xFF2D2E33), fontSize: 40, fontFamily: 'Inter', fontWeight: FontWeight.w400, height: 0.95, letterSpacing: -0.90);
  static const TextStyle welcomeBrand = TextStyle(color: Color(0xFF0058BB), fontSize: 40, fontFamily: 'Inter', fontWeight: FontWeight.w700); 
  // كبرنا الوصف لـ 20 بدل 18
  static const TextStyle welcomeSubtitle = TextStyle(color: Color(0xFF5B5B60), fontSize: 20, fontFamily: 'Inter', fontWeight: FontWeight.w400, height: 1.56);
  // خط الزرار لـ 16 بدل 14
  static const TextStyle btnWhiteText = TextStyle(color: Colors.white, fontSize: 16, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.43);

  // ==========================================
  // Quick Actions
  // ==========================================
  // كبرنا عنوان الأكشن لـ 16 والوصف لـ 12
  static const TextStyle actionTitle = TextStyle(color: Color(0xFF2D2E33), fontSize: 16, fontFamily: 'Inter', fontWeight: FontWeight.w600, height: 1.43); 
  static const TextStyle actionDesc = TextStyle(color: Color(0xFF5B5B60), fontSize: 12, fontFamily: 'Inter', fontWeight: FontWeight.w400, height: 1.25);

  // ==========================================
  // Recent Bites (Insights)
  // ==========================================
  // كبرنا النصوص جوه الكروت لـ 16 بدل 14 مع إبراز الكلمات الملونة
  static const TextStyle biteTextNormal = TextStyle(color: Color(0xFF2D2E33), fontSize: 16, fontFamily: 'Inter', fontWeight: FontWeight.w400, height: 1.63);
  static const TextStyle biteTextHighlightBlue = TextStyle(color: Color(0xFF0058BB), fontSize: 16, fontFamily: 'Inter', fontWeight: FontWeight.w600);
  static const TextStyle biteTextHighlightPurple = TextStyle(color: Color(0xFF883C93), fontSize: 16, fontFamily: 'Inter', fontWeight: FontWeight.w600);
  static const TextStyle biteTextHighlightNavy = TextStyle(color: Color(0xFF3853B7), fontSize: 16, fontFamily: 'Inter', fontWeight: FontWeight.w600);

  // ==========================================
  // Spotlight Program
  // ==========================================
  // كبرنا التاج لـ 11، العنوان لـ 34، الوصف لـ 16
  static const TextStyle spotlightTag = TextStyle(color: Colors.white, fontSize: 11, fontFamily: 'Inter', fontWeight: FontWeight.w900, height: 1.50, letterSpacing: 0.90);
  static const TextStyle spotlightTitle = TextStyle(color: Colors.white, fontSize: 34, fontStyle: FontStyle.italic, fontFamily: 'Inter', fontWeight: FontWeight.w800, height: 1.25, letterSpacing: -0.75);
  static const TextStyle spotlightDesc = TextStyle(color: Colors.white70, fontSize: 16, fontFamily: 'Inter', fontWeight: FontWeight.w400, height: 1.38);
  static const TextStyle spotlightBtn = TextStyle(color: Color(0xFF2D2E33), fontSize: 14, fontFamily: 'Inter', fontWeight: FontWeight.w800, height: 1.33, letterSpacing: 1.20);
  // AppBar & Header
  static const TextStyle coachName = TextStyle(color: Color(0xFF0058BB), fontSize: 18, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.56, letterSpacing: -0.45);
  static const TextStyle onlineStatus = TextStyle(color: Color(0xFF5B5B60), fontSize: 10, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.50, letterSpacing: 1);
  static const TextStyle datePill = TextStyle(color: Color(0xFF76767B), fontSize: 10, fontFamily: 'Inter', fontWeight: FontWeight.w900, height: 1.50, letterSpacing: 1.50);

  // Messages
  static const TextStyle aiMessage = TextStyle(color: Color(0xFF2D2E33), fontSize: 16, fontFamily: 'Inter', fontWeight: FontWeight.w400, height: 1.63);
  static const TextStyle userMessage = TextStyle(color: Color(0xFFF0F2FF), fontSize: 16, fontFamily: 'Inter', fontWeight: FontWeight.w400, height: 1.63);
  static const TextStyle timestamp = TextStyle(color: Color(0xFFADACB2), fontSize: 10, fontFamily: 'Inter', fontWeight: FontWeight.w500, height: 1.50);

  // Custom Delta Card (Volume & Intensity)
  static const TextStyle cardLabel = TextStyle(color: Color(0xFFADACB2), fontSize: 10, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.50);
  static const TextStyle cardValueVolume = TextStyle(color: Color(0xFF0058BB), fontSize: 24, fontFamily: 'Inter', fontWeight: FontWeight.w900, height: 1.33, letterSpacing: -1.20);
  static const TextStyle cardUnit = TextStyle(color: Color(0xFF76767B), fontSize: 10, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.50);
  static const TextStyle cardValueShift = TextStyle(color: Color(0xFF2D2E33), fontSize: 18, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.56, letterSpacing: -0.45);

  // Bottom Elements
  static const TextStyle suggestionChip = TextStyle(color: Color(0xFF0058BB), fontSize: 12, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.33, letterSpacing: -0.30);
  static const TextStyle inputHint = TextStyle(color: Color(0xFFADACB2), fontSize: 14, fontFamily: 'Inter', fontWeight: FontWeight.w500);
  // AppBar
  static const TextStyle kineticLogo = TextStyle(color: Color(0xFF1D4ED8), fontSize: 20, fontStyle: FontStyle.italic, fontFamily: 'Inter', fontWeight: FontWeight.w900, height: 1.40, letterSpacing: -1);

  // Hero Section
  static const TextStyle neuralLink = TextStyle(color: Colors.white, fontSize: 10, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.50, letterSpacing: 1.50);
  static const TextStyle meetCoach = TextStyle(color: Colors.white, fontSize: 36, fontFamily: 'Inter', fontWeight: FontWeight.w400, height: 1, letterSpacing: -1.80);
  static const TextStyle coachDesc = TextStyle(color: Color(0xCCEFF6FF), fontSize: 16, fontFamily: 'Inter', fontWeight: FontWeight.w400, height: 1.50);
  static const TextStyle startSessionBtn = TextStyle(color: Color(0xFF0058BB), fontSize: 18, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.56);

  // Mini Stats
  static const TextStyle miniStatLabel = TextStyle(color: Color(0xFF5B5B60), fontSize: 10, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1, letterSpacing: 1);
  static const TextStyle miniStatValue = TextStyle(color: Color(0xFF2D2E33), fontSize: 16, fontFamily: 'Inter', fontWeight: FontWeight.w900, height: 1);

  // Section Headers
  //static const TextStyle sectionTitle = TextStyle(color: Color(0xFF2D2E33), fontSize: 24, fontFamily: 'Inter', fontWeight: FontWeight.w800, height: 1.33, letterSpacing: -0.60);
  static const TextStyle recommended = TextStyle(color: Color(0xFF0058BB), fontSize: 12, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.33, letterSpacing: 1.20);

  // Smart Workout Card
  static const TextStyle nextBest = TextStyle(color: Color(0xFF0058BB), fontSize: 10, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.50, letterSpacing: 1);
  static const TextStyle workoutTitle = TextStyle(color: Color(0xFF2D2E33), fontSize: 30, fontFamily: 'Inter', fontWeight: FontWeight.w900, height: 1.25, letterSpacing: -1.50);
  static const TextStyle statNum = TextStyle(color: Color(0xFF2D2E33), fontSize: 24, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.33);
  static const TextStyle statUnit = TextStyle(color: Color(0xFF5B5B60), fontSize: 10, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.50, letterSpacing: 1);
  static const TextStyle viewDetailsBtn = TextStyle(color: Color(0xFF2D2E33), fontSize: 14, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.43);

  // AI Analysis Card
  static const TextStyle analysisLabel = TextStyle(color: Color(0xFF0058BB), fontSize: 10, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.50, letterSpacing: 1);
  static const TextStyle analysisTitle = TextStyle(color: Color(0xFF2D2E33), fontSize: 20, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.40, letterSpacing: -0.50);
  static const TextStyle analysisDescNormal = TextStyle(color: Color(0xFF5B5B60), fontSize: 14, fontFamily: 'Inter', fontWeight: FontWeight.w400, height: 1.63);
  static const TextStyle analysisDescBold = TextStyle(color: Color(0xFF2D2E33), fontSize: 14, fontFamily: 'Inter', fontWeight: FontWeight.w400);

  // Grid Cards (Insights & Tools)
  static const TextStyle gridCardLabel = TextStyle(color: Color(0xFF5B5B60), fontSize: 14, fontFamily: 'Inter', fontWeight: FontWeight.w400, height: 1.43, letterSpacing: 1.40);
  static const TextStyle gridCardValue = TextStyle(color: Color(0xFF2D2E33), fontSize: 24, fontFamily: 'Inter', fontWeight: FontWeight.w400, height: 1.33, letterSpacing: -1.20);
  static const TextStyle gridCardTitle = TextStyle(color: Color(0xFF2D2E33), fontSize: 18, fontFamily: 'Inter', fontWeight: FontWeight.w400, height: 1.25);
  static const TextStyle gridCardSub = TextStyle(color: Color(0xFF94A3B8), fontSize: 10, fontFamily: 'Inter', fontWeight: FontWeight.w400, height: 1.50);

  // Weekly Pulse
  static const TextStyle pulseTitle = TextStyle(color: Color(0xFF2D2E33), fontSize: 18, fontFamily: 'Inter', fontWeight: FontWeight.w400, height: 1.56, letterSpacing: -0.45);
  static const TextStyle pulseDay = TextStyle(color: Color(0xFF94A3B8), fontSize: 10, fontFamily: 'Inter', fontWeight: FontWeight.w700, height: 1.50);
  static const TextStyle summaryLabel = TextStyle(color: Color(0xFF2D2E33), fontSize: 12, fontFamily: 'Inter', fontWeight: FontWeight.w400, height: 1.63);
  static const TextStyle summaryText = TextStyle(color: Color(0xFF2D2E33), fontSize: 12, fontFamily: 'Inter', fontWeight: FontWeight.w400);
}