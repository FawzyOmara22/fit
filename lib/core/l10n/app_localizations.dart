import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @kinetic.
  ///
  /// In en, this message translates to:
  /// **'KINETIC'**
  String get kinetic;

  /// No description provided for @tagline.
  ///
  /// In en, this message translates to:
  /// **'FOR THE EDITORIAL LIFTER'**
  String get tagline;

  /// No description provided for @onb_heading1_part1.
  ///
  /// In en, this message translates to:
  /// **'FAST.\nRELIABLE.\n'**
  String get onb_heading1_part1;

  /// No description provided for @onb_heading1_part2.
  ///
  /// In en, this message translates to:
  /// **'KINETIC.'**
  String get onb_heading1_part2;

  /// No description provided for @onb_heading2.
  ///
  /// In en, this message translates to:
  /// **'PUSH YOUR LIMITS'**
  String get onb_heading2;

  /// No description provided for @onb_body.
  ///
  /// In en, this message translates to:
  /// **'Track every rep with precision.\nAdvanced analytics for high-\nperformance athletes ready to evolve.'**
  String get onb_body;

  /// No description provided for @onb_card1_tag.
  ///
  /// In en, this message translates to:
  /// **'99.9% ACCURACY'**
  String get onb_card1_tag;

  /// No description provided for @onb_card1_title.
  ///
  /// In en, this message translates to:
  /// **'Elite Tracking'**
  String get onb_card1_title;

  /// No description provided for @onb_card1_body.
  ///
  /// In en, this message translates to:
  /// **'Precision logging for maximum\nperformance output.'**
  String get onb_card1_body;

  /// No description provided for @button_continue.
  ///
  /// In en, this message translates to:
  /// **'CONTINUE'**
  String get button_continue;

  /// No description provided for @login_prompt.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? Log in'**
  String get login_prompt;

  /// No description provided for @button_start_journey.
  ///
  /// In en, this message translates to:
  /// **'START YOUR JOURNEY'**
  String get button_start_journey;

  /// No description provided for @step_1_of_14.
  ///
  /// In en, this message translates to:
  /// **'STEP 1 OF 14'**
  String get step_1_of_14;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'SKIP'**
  String get skip;

  /// No description provided for @onb_step1_title_p1.
  ///
  /// In en, this message translates to:
  /// **'What is your\n'**
  String get onb_step1_title_p1;

  /// No description provided for @onb_step1_title_p2.
  ///
  /// In en, this message translates to:
  /// **'primary'**
  String get onb_step1_title_p2;

  /// No description provided for @onb_step1_title_p3.
  ///
  /// In en, this message translates to:
  /// **' goal?'**
  String get onb_step1_title_p3;

  /// No description provided for @onb_step1_subtitle.
  ///
  /// In en, this message translates to:
  /// **'This helps us tailor your protocol for\nmaximum performance.'**
  String get onb_step1_subtitle;

  /// No description provided for @goal_build_muscle_title.
  ///
  /// In en, this message translates to:
  /// **'Build Muscle'**
  String get goal_build_muscle_title;

  /// No description provided for @goal_build_muscle_desc.
  ///
  /// In en, this message translates to:
  /// **'Focus on hypertrophy and aesthetics.'**
  String get goal_build_muscle_desc;

  /// No description provided for @goal_inc_strength_title.
  ///
  /// In en, this message translates to:
  /// **'Increase Strength'**
  String get goal_inc_strength_title;

  /// No description provided for @goal_inc_strength_desc.
  ///
  /// In en, this message translates to:
  /// **'Prioritize power and compound lifts.'**
  String get goal_inc_strength_desc;

  /// No description provided for @goal_lose_weight_title.
  ///
  /// In en, this message translates to:
  /// **'Lose Weight'**
  String get goal_lose_weight_title;

  /// No description provided for @goal_lose_weight_desc.
  ///
  /// In en, this message translates to:
  /// **'Optimize for fat loss and metabolic health.'**
  String get goal_lose_weight_desc;

  /// No description provided for @goal_improve_endurance_title.
  ///
  /// In en, this message translates to:
  /// **'Improve Endurance'**
  String get goal_improve_endurance_title;

  /// No description provided for @goal_improve_endurance_desc.
  ///
  /// In en, this message translates to:
  /// **'Build stamina and capacity.'**
  String get goal_improve_endurance_desc;

  /// No description provided for @protocol_engine_active.
  ///
  /// In en, this message translates to:
  /// **'PROTOCOL ENGINE ACTIVE'**
  String get protocol_engine_active;

  /// No description provided for @step_2_of_14.
  ///
  /// In en, this message translates to:
  /// **'STEP 2 OF 14'**
  String get step_2_of_14;

  /// No description provided for @biometrics.
  ///
  /// In en, this message translates to:
  /// **'BIOMETRICS'**
  String get biometrics;

  /// No description provided for @what_is_your_age_p1.
  ///
  /// In en, this message translates to:
  /// **'What is your '**
  String get what_is_your_age_p1;

  /// No description provided for @what_is_your_age_p2.
  ///
  /// In en, this message translates to:
  /// **'age'**
  String get what_is_your_age_p2;

  /// No description provided for @what_is_your_age_p3.
  ///
  /// In en, this message translates to:
  /// **'?'**
  String get what_is_your_age_p3;

  /// No description provided for @age_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Precision metrics start with\naccurate data.'**
  String get age_subtitle;

  /// No description provided for @metabolic_data_title.
  ///
  /// In en, this message translates to:
  /// **'METABOLIC DATA'**
  String get metabolic_data_title;

  /// No description provided for @metabolic_data_desc.
  ///
  /// In en, this message translates to:
  /// **'We use your age to calculate target\nheart rate zones and personalized\nmetabolic intensity.'**
  String get metabolic_data_desc;

  /// No description provided for @step_3_of_14.
  ///
  /// In en, this message translates to:
  /// **'STEP 3 OF 14'**
  String get step_3_of_14;

  /// No description provided for @what_is_your_gender_p1.
  ///
  /// In en, this message translates to:
  /// **'What is your '**
  String get what_is_your_gender_p1;

  /// No description provided for @what_is_your_gender_p2.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get what_is_your_gender_p2;

  /// No description provided for @what_is_your_gender_p3.
  ///
  /// In en, this message translates to:
  /// **' ?'**
  String get what_is_your_gender_p3;

  /// No description provided for @gender_subtitle.
  ///
  /// In en, this message translates to:
  /// **'This helps us provide accurate physiological\ninsights based on your baseline biology.'**
  String get gender_subtitle;

  /// No description provided for @male.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get male;

  /// No description provided for @female.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get female;

  /// No description provided for @physiological.
  ///
  /// In en, this message translates to:
  /// **'PHYSIOLOGICAL'**
  String get physiological;

  /// No description provided for @privacy_policy_p1.
  ///
  /// In en, this message translates to:
  /// **'Your data is handled according to our '**
  String get privacy_policy_p1;

  /// No description provided for @privacy_policy_p2.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacy_policy_p2;

  /// No description provided for @privacy_policy_p3.
  ///
  /// In en, this message translates to:
  /// **'.'**
  String get privacy_policy_p3;

  /// No description provided for @step_4_of_14.
  ///
  /// In en, this message translates to:
  /// **'STEP 4 OF 14'**
  String get step_4_of_14;

  /// No description provided for @what_is_your_current_weight_p1.
  ///
  /// In en, this message translates to:
  /// **'What is your\ncurrent '**
  String get what_is_your_current_weight_p1;

  /// No description provided for @what_is_your_current_weight_p2.
  ///
  /// In en, this message translates to:
  /// **'weight'**
  String get what_is_your_current_weight_p2;

  /// No description provided for @what_is_your_current_weight_p3.
  ///
  /// In en, this message translates to:
  /// **'?'**
  String get what_is_your_current_weight_p3;

  /// No description provided for @kg.
  ///
  /// In en, this message translates to:
  /// **'KG'**
  String get kg;

  /// No description provided for @lb.
  ///
  /// In en, this message translates to:
  /// **'LB'**
  String get lb;

  /// No description provided for @metabolic_calibration_title.
  ///
  /// In en, this message translates to:
  /// **'Metabolic Calibration'**
  String get metabolic_calibration_title;

  /// No description provided for @metabolic_calibration_desc_p1.
  ///
  /// In en, this message translates to:
  /// **'Your weight is a key anchor for\nour algorithm. We use it to\ncalculate your '**
  String get metabolic_calibration_desc_p1;

  /// No description provided for @metabolic_calibration_desc_p2.
  ///
  /// In en, this message translates to:
  /// **'Basal Metabolic\nRate'**
  String get metabolic_calibration_desc_p2;

  /// No description provided for @metabolic_calibration_desc_p3.
  ///
  /// In en, this message translates to:
  /// **' (BMR) and precisely tune the\nintensity of your kinetic sessions.'**
  String get metabolic_calibration_desc_p3;

  /// No description provided for @step_5_of_14.
  ///
  /// In en, this message translates to:
  /// **'STEP 5 OF 14'**
  String get step_5_of_14;

  /// No description provided for @personal_metrics.
  ///
  /// In en, this message translates to:
  /// **'PERSONAL METRICS'**
  String get personal_metrics;

  /// No description provided for @what_is_your_current_height_p1.
  ///
  /// In en, this message translates to:
  /// **'What is your\ncurrent '**
  String get what_is_your_current_height_p1;

  /// No description provided for @what_is_your_current_height_p2.
  ///
  /// In en, this message translates to:
  /// **'height'**
  String get what_is_your_current_height_p2;

  /// No description provided for @what_is_your_current_height_p3.
  ///
  /// In en, this message translates to:
  /// **'?'**
  String get what_is_your_current_height_p3;

  /// No description provided for @cm.
  ///
  /// In en, this message translates to:
  /// **'cm'**
  String get cm;

  /// No description provided for @ft_in.
  ///
  /// In en, this message translates to:
  /// **'ft/in'**
  String get ft_in;

  /// No description provided for @height_calibration_title.
  ///
  /// In en, this message translates to:
  /// **'Metabolic Calibration'**
  String get height_calibration_title;

  /// No description provided for @height_calibration_desc.
  ///
  /// In en, this message translates to:
  /// **'Your height is used to provide precise\nmetabolic insights and will not be\nshared.'**
  String get height_calibration_desc;

  /// No description provided for @onboarding_label.
  ///
  /// In en, this message translates to:
  /// **'ONBOARDING'**
  String get onboarding_label;

  /// No description provided for @step_6_of_14.
  ///
  /// In en, this message translates to:
  /// **'STEP 6 OF 14'**
  String get step_6_of_14;

  /// No description provided for @whats_your_experience_p1.
  ///
  /// In en, this message translates to:
  /// **'What\'s your\n'**
  String get whats_your_experience_p1;

  /// No description provided for @whats_your_experience_p2.
  ///
  /// In en, this message translates to:
  /// **'experience'**
  String get whats_your_experience_p2;

  /// No description provided for @whats_your_experience_p3.
  ///
  /// In en, this message translates to:
  /// **' level?'**
  String get whats_your_experience_p3;

  /// No description provided for @experience_subtitle.
  ///
  /// In en, this message translates to:
  /// **'We\'ll tailor your training program based on\nyour background and familiarity with lifting.'**
  String get experience_subtitle;

  /// No description provided for @beginner.
  ///
  /// In en, this message translates to:
  /// **'Beginner'**
  String get beginner;

  /// No description provided for @beginner_desc.
  ///
  /// In en, this message translates to:
  /// **'Just starting out. Focus on learning\nthe basics and proper form.'**
  String get beginner_desc;

  /// No description provided for @intermediate.
  ///
  /// In en, this message translates to:
  /// **'Intermediate'**
  String get intermediate;

  /// No description provided for @intermediate_desc.
  ///
  /// In en, this message translates to:
  /// **'Consistent training for 1-2 years.\nComfortable with main lifts.'**
  String get intermediate_desc;

  /// No description provided for @advanced.
  ///
  /// In en, this message translates to:
  /// **'ADVANCED'**
  String get advanced;

  /// No description provided for @advanced_desc.
  ///
  /// In en, this message translates to:
  /// **'Regular training for 3+ years.\nLooking to optimize performance.'**
  String get advanced_desc;

  /// No description provided for @elite.
  ///
  /// In en, this message translates to:
  /// **'ELITE'**
  String get elite;

  /// No description provided for @elite_desc.
  ///
  /// In en, this message translates to:
  /// **'Competitive lifter or athlete.\nFocused on peak results.'**
  String get elite_desc;

  /// No description provided for @step_7_of_14.
  ///
  /// In en, this message translates to:
  /// **'STEP 7 OF 14'**
  String get step_7_of_14;

  /// No description provided for @physical_constraints_label.
  ///
  /// In en, this message translates to:
  /// **'PHYSICAL CONSTRAINTS'**
  String get physical_constraints_label;

  /// No description provided for @identify_constraints_p1.
  ///
  /// In en, this message translates to:
  /// **'Identify your\n'**
  String get identify_constraints_p1;

  /// No description provided for @identify_constraints_p2.
  ///
  /// In en, this message translates to:
  /// **'physical'**
  String get identify_constraints_p2;

  /// No description provided for @identify_constraints_p3.
  ///
  /// In en, this message translates to:
  /// **' constraints?'**
  String get identify_constraints_p3;

  /// No description provided for @constraints_subtitle.
  ///
  /// In en, this message translates to:
  /// **'We\'ll adjust your workout intensity and suggest safe\nexercise alternatives.'**
  String get constraints_subtitle;

  /// No description provided for @none_no_injuries.
  ///
  /// In en, this message translates to:
  /// **'None / No Injuries'**
  String get none_no_injuries;

  /// No description provided for @ready_for_full_intensity.
  ///
  /// In en, this message translates to:
  /// **'READY FOR FULL INTENSITY'**
  String get ready_for_full_intensity;

  /// No description provided for @select_affected_areas.
  ///
  /// In en, this message translates to:
  /// **'SELECT AFFECTED AREAS'**
  String get select_affected_areas;

  /// No description provided for @lower_back.
  ///
  /// In en, this message translates to:
  /// **'Lower Back'**
  String get lower_back;

  /// No description provided for @knees.
  ///
  /// In en, this message translates to:
  /// **'Knees'**
  String get knees;

  /// No description provided for @shoulders.
  ///
  /// In en, this message translates to:
  /// **'Shoulders'**
  String get shoulders;

  /// No description provided for @wrists.
  ///
  /// In en, this message translates to:
  /// **'Wrists'**
  String get wrists;

  /// No description provided for @ankles.
  ///
  /// In en, this message translates to:
  /// **'Ankles'**
  String get ankles;

  /// No description provided for @neck.
  ///
  /// In en, this message translates to:
  /// **'Neck'**
  String get neck;

  /// No description provided for @more_info_injuries.
  ///
  /// In en, this message translates to:
  /// **'MORE INFO (SURGERIES OR RECOMMENDATIONS)'**
  String get more_info_injuries;

  /// No description provided for @injury_notes_hint.
  ///
  /// In en, this message translates to:
  /// **'Specific surgeries or doctor advice...'**
  String get injury_notes_hint;

  /// No description provided for @ai_adaptive_planning.
  ///
  /// In en, this message translates to:
  /// **'AI Adaptive Planning'**
  String get ai_adaptive_planning;

  /// No description provided for @ai_adaptive_planning_desc.
  ///
  /// In en, this message translates to:
  /// **'Our engine automatically swaps\nmovements with safer alternatives.\nSweat without the strain.'**
  String get ai_adaptive_planning_desc;

  /// No description provided for @step_8_of_14.
  ///
  /// In en, this message translates to:
  /// **'STEP 8 OF 14'**
  String get step_8_of_14;

  /// No description provided for @define_your_p1.
  ///
  /// In en, this message translates to:
  /// **'Define your\n'**
  String get define_your_p1;

  /// No description provided for @define_your_p2.
  ///
  /// In en, this message translates to:
  /// **'schedule'**
  String get define_your_p2;

  /// No description provided for @define_your_p3.
  ///
  /// In en, this message translates to:
  /// **'?'**
  String get define_your_p3;

  /// No description provided for @frequency_label.
  ///
  /// In en, this message translates to:
  /// **'FREQUENCY'**
  String get frequency_label;

  /// No description provided for @how_many_days.
  ///
  /// In en, this message translates to:
  /// **'How many days per week?'**
  String get how_many_days;

  /// No description provided for @start_of_week_label.
  ///
  /// In en, this message translates to:
  /// **'START OF WEEK'**
  String get start_of_week_label;

  /// No description provided for @monday.
  ///
  /// In en, this message translates to:
  /// **'Monday'**
  String get monday;

  /// No description provided for @sunday.
  ///
  /// In en, this message translates to:
  /// **'Sunday'**
  String get sunday;

  /// No description provided for @typical_session_length.
  ///
  /// In en, this message translates to:
  /// **'TYPICAL SESSION LENGTH'**
  String get typical_session_length;

  /// No description provided for @express.
  ///
  /// In en, this message translates to:
  /// **'EXPRESS'**
  String get express;

  /// No description provided for @standard.
  ///
  /// In en, this message translates to:
  /// **'STANDARD'**
  String get standard;

  /// No description provided for @performance.
  ///
  /// In en, this message translates to:
  /// **'PERFORMANCE'**
  String get performance;

  /// No description provided for @endurance.
  ///
  /// In en, this message translates to:
  /// **'ENDURANCE'**
  String get endurance;

  /// No description provided for @min_30.
  ///
  /// In en, this message translates to:
  /// **'30 MIN'**
  String get min_30;

  /// No description provided for @min_45.
  ///
  /// In en, this message translates to:
  /// **'45 MIN'**
  String get min_45;

  /// No description provided for @min_60.
  ///
  /// In en, this message translates to:
  /// **'60 MIN'**
  String get min_60;

  /// No description provided for @min_90_plus.
  ///
  /// In en, this message translates to:
  /// **'90+ MIN'**
  String get min_90_plus;

  /// No description provided for @kinetic_insight.
  ///
  /// In en, this message translates to:
  /// **'KINETIC INSIGHT'**
  String get kinetic_insight;

  /// No description provided for @insight_desc_p1.
  ///
  /// In en, this message translates to:
  /// **'Consistency beats intensity. Aim for a schedule\nyou can maintain for '**
  String get insight_desc_p1;

  /// No description provided for @insight_desc_p2.
  ///
  /// In en, this message translates to:
  /// **'12 weeks'**
  String get insight_desc_p2;

  /// No description provided for @insight_desc_p3.
  ///
  /// In en, this message translates to:
  /// **'.'**
  String get insight_desc_p3;

  /// No description provided for @step_9_of_14.
  ///
  /// In en, this message translates to:
  /// **'Step 9 of 14'**
  String get step_9_of_14;

  /// No description provided for @equip_your_p1.
  ///
  /// In en, this message translates to:
  /// **'Equip your\n'**
  String get equip_your_p1;

  /// No description provided for @equip_your_p2.
  ///
  /// In en, this message translates to:
  /// **'environment.'**
  String get equip_your_p2;

  /// No description provided for @equip_your_desc.
  ///
  /// In en, this message translates to:
  /// **'We\'ll adjust your workout intensity and suggest safe\nexercise alternatives.'**
  String get equip_your_desc;

  /// No description provided for @equipment_barbells.
  ///
  /// In en, this message translates to:
  /// **'Barbells'**
  String get equipment_barbells;

  /// No description provided for @equipment_barbells_desc.
  ///
  /// In en, this message translates to:
  /// **'OLYMPIC STANDARD'**
  String get equipment_barbells_desc;

  /// No description provided for @equipment_dumbbells.
  ///
  /// In en, this message translates to:
  /// **'Dumbbells'**
  String get equipment_dumbbells;

  /// No description provided for @equipment_dumbbells_desc.
  ///
  /// In en, this message translates to:
  /// **'FREE WEIGHTS'**
  String get equipment_dumbbells_desc;

  /// No description provided for @equipment_kettlebells.
  ///
  /// In en, this message translates to:
  /// **'Kettlebells'**
  String get equipment_kettlebells;

  /// No description provided for @equipment_kettlebells_desc.
  ///
  /// In en, this message translates to:
  /// **'DYNAMIC STRENGTH'**
  String get equipment_kettlebells_desc;

  /// No description provided for @equipment_machines.
  ///
  /// In en, this message translates to:
  /// **'Machines'**
  String get equipment_machines;

  /// No description provided for @equipment_machines_desc.
  ///
  /// In en, this message translates to:
  /// **'CABLE & PLATE'**
  String get equipment_machines_desc;

  /// No description provided for @equipment_plates.
  ///
  /// In en, this message translates to:
  /// **'Plates'**
  String get equipment_plates;

  /// No description provided for @equipment_plates_desc.
  ///
  /// In en, this message translates to:
  /// **'STANDARD WEIGHTS'**
  String get equipment_plates_desc;

  /// No description provided for @equipment_bands.
  ///
  /// In en, this message translates to:
  /// **'Bands'**
  String get equipment_bands;

  /// No description provided for @equipment_bands_desc.
  ///
  /// In en, this message translates to:
  /// **'TENSION BASED'**
  String get equipment_bands_desc;

  /// No description provided for @equipment_suspension.
  ///
  /// In en, this message translates to:
  /// **'Suspension'**
  String get equipment_suspension;

  /// No description provided for @equipment_suspension_desc.
  ///
  /// In en, this message translates to:
  /// **'BODYWEIGHT'**
  String get equipment_suspension_desc;

  /// No description provided for @equipment_others.
  ///
  /// In en, this message translates to:
  /// **'Others'**
  String get equipment_others;

  /// No description provided for @equipment_others_desc.
  ///
  /// In en, this message translates to:
  /// **'SPECIALTY GEAR'**
  String get equipment_others_desc;

  /// No description provided for @add_cardio_finishers.
  ///
  /// In en, this message translates to:
  /// **'Add Cardio Finishers'**
  String get add_cardio_finishers;

  /// No description provided for @add_cardio_finishers_desc.
  ///
  /// In en, this message translates to:
  /// **'Append 5-10 min HIIT to every session'**
  String get add_cardio_finishers_desc;

  /// No description provided for @step_10_of_14.
  ///
  /// In en, this message translates to:
  /// **'Step 10 of 14'**
  String get step_10_of_14;

  /// No description provided for @set_your_units_p1.
  ///
  /// In en, this message translates to:
  /// **'Set your '**
  String get set_your_units_p1;

  /// No description provided for @set_your_units_p2.
  ///
  /// In en, this message translates to:
  /// **'units'**
  String get set_your_units_p2;

  /// No description provided for @set_your_units_desc.
  ///
  /// In en, this message translates to:
  /// **'Choose how you want to track\nyour progress.'**
  String get set_your_units_desc;

  /// No description provided for @weight_label.
  ///
  /// In en, this message translates to:
  /// **'WEIGHT'**
  String get weight_label;

  /// No description provided for @kilograms.
  ///
  /// In en, this message translates to:
  /// **'Kilograms'**
  String get kilograms;

  /// No description provided for @kg_abbr.
  ///
  /// In en, this message translates to:
  /// **'KG'**
  String get kg_abbr;

  /// No description provided for @pounds.
  ///
  /// In en, this message translates to:
  /// **'Pounds'**
  String get pounds;

  /// No description provided for @lbs_abbr.
  ///
  /// In en, this message translates to:
  /// **'LBS'**
  String get lbs_abbr;

  /// No description provided for @distance_label.
  ///
  /// In en, this message translates to:
  /// **'DISTANCE'**
  String get distance_label;

  /// No description provided for @kilometers.
  ///
  /// In en, this message translates to:
  /// **'Kilometers'**
  String get kilometers;

  /// No description provided for @km_abbr.
  ///
  /// In en, this message translates to:
  /// **'KM'**
  String get km_abbr;

  /// No description provided for @miles.
  ///
  /// In en, this message translates to:
  /// **'Miles'**
  String get miles;

  /// No description provided for @mi_abbr.
  ///
  /// In en, this message translates to:
  /// **'MI'**
  String get mi_abbr;

  /// No description provided for @units_info_desc.
  ///
  /// In en, this message translates to:
  /// **'You can change these anytime in\nyour Account Settings after\ncompleting the setup.'**
  String get units_info_desc;

  /// No description provided for @neural_engine_active.
  ///
  /// In en, this message translates to:
  /// **'NEURAL ENGINE ACTIVE'**
  String get neural_engine_active;

  /// No description provided for @finalizing_strategy.
  ///
  /// In en, this message translates to:
  /// **'Finalizing Your\nStrategy'**
  String get finalizing_strategy;

  /// No description provided for @percent_complete.
  ///
  /// In en, this message translates to:
  /// **'84% COMPLETE'**
  String get percent_complete;

  /// No description provided for @current_process.
  ///
  /// In en, this message translates to:
  /// **'CURRENT PROCESS'**
  String get current_process;

  /// No description provided for @optimizing_recovery.
  ///
  /// In en, this message translates to:
  /// **'Optimizing Recovery\nCurves...'**
  String get optimizing_recovery;

  /// No description provided for @analyzing_biometrics.
  ///
  /// In en, this message translates to:
  /// **'Analyzing\nBio-metrics'**
  String get analyzing_biometrics;

  /// No description provided for @movement_selection.
  ///
  /// In en, this message translates to:
  /// **'Movement\nSelection'**
  String get movement_selection;

  /// No description provided for @calibrating_overload.
  ///
  /// In en, this message translates to:
  /// **'Calibrating Progressive Overload'**
  String get calibrating_overload;

  /// No description provided for @next_step.
  ///
  /// In en, this message translates to:
  /// **'NEXT'**
  String get next_step;

  /// No description provided for @ai_processing_desc.
  ///
  /// In en, this message translates to:
  /// **'Our proprietary Kinetic AI is cross-referencing\nyour metabolic profile with 4,000+ movement\npatterns to ensure maximum hyper-trophy.'**
  String get ai_processing_desc;

  /// No description provided for @protocol_alpha.
  ///
  /// In en, this message translates to:
  /// **'PROTOCOL\nALPHA 1.0'**
  String get protocol_alpha;

  /// No description provided for @hypertrophy_focus.
  ///
  /// In en, this message translates to:
  /// **'HYPERTROPHY FOCUS'**
  String get hypertrophy_focus;

  /// No description provided for @active_week.
  ///
  /// In en, this message translates to:
  /// **'ACTIVE WEEK'**
  String get active_week;

  /// No description provided for @duration_label.
  ///
  /// In en, this message translates to:
  /// **'DURATION'**
  String get duration_label;

  /// No description provided for @duration_val.
  ///
  /// In en, this message translates to:
  /// **'8 Wks'**
  String get duration_val;

  /// No description provided for @freq_label.
  ///
  /// In en, this message translates to:
  /// **'FREQ.'**
  String get freq_label;

  /// No description provided for @freq_val.
  ///
  /// In en, this message translates to:
  /// **'4x /Wk'**
  String get freq_val;

  /// No description provided for @volume_label.
  ///
  /// In en, this message translates to:
  /// **'VOLUME'**
  String get volume_label;

  /// No description provided for @volume_val.
  ///
  /// In en, this message translates to:
  /// **'24.5k'**
  String get volume_val;

  /// No description provided for @weekly_rhythm.
  ///
  /// In en, this message translates to:
  /// **'WEEKLY RHYTHM'**
  String get weekly_rhythm;

  /// No description provided for @day_m.
  ///
  /// In en, this message translates to:
  /// **'M'**
  String get day_m;

  /// No description provided for @day_t.
  ///
  /// In en, this message translates to:
  /// **'T'**
  String get day_t;

  /// No description provided for @day_w.
  ///
  /// In en, this message translates to:
  /// **'W'**
  String get day_w;

  /// No description provided for @day_th.
  ///
  /// In en, this message translates to:
  /// **'T'**
  String get day_th;

  /// No description provided for @day_f.
  ///
  /// In en, this message translates to:
  /// **'F'**
  String get day_f;

  /// No description provided for @day_s.
  ///
  /// In en, this message translates to:
  /// **'S'**
  String get day_s;

  /// No description provided for @day_su.
  ///
  /// In en, this message translates to:
  /// **'S'**
  String get day_su;

  /// No description provided for @stimulus_balance.
  ///
  /// In en, this message translates to:
  /// **'STIMULUS BALANCE'**
  String get stimulus_balance;

  /// No description provided for @optional_flow.
  ///
  /// In en, this message translates to:
  /// **'OPTIONAL FLOW'**
  String get optional_flow;

  /// No description provided for @push.
  ///
  /// In en, this message translates to:
  /// **'PUSH'**
  String get push;

  /// No description provided for @pull.
  ///
  /// In en, this message translates to:
  /// **'PULL'**
  String get pull;

  /// No description provided for @legs.
  ///
  /// In en, this message translates to:
  /// **'LEGS'**
  String get legs;

  /// No description provided for @coach_insight.
  ///
  /// In en, this message translates to:
  /// **'COACH INSIGHT'**
  String get coach_insight;

  /// No description provided for @coach_insight_p1.
  ///
  /// In en, this message translates to:
  /// **'Week 1 emphasizes '**
  String get coach_insight_p1;

  /// No description provided for @coach_insight_p2.
  ///
  /// In en, this message translates to:
  /// **'progressive overload priming'**
  String get coach_insight_p2;

  /// No description provided for @coach_insight_p3.
  ///
  /// In en, this message translates to:
  /// **'. We\'re\nestablishing structural integrity with\nhigher RPE targets to set the\nfoundation for Month 1 growth.'**
  String get coach_insight_p3;

  /// No description provided for @daily_protocols.
  ///
  /// In en, this message translates to:
  /// **'DAILY PROTOCOLS'**
  String get daily_protocols;

  /// No description provided for @upcoming.
  ///
  /// In en, this message translates to:
  /// **'UPCOMING'**
  String get upcoming;

  /// No description provided for @day1_mon.
  ///
  /// In en, this message translates to:
  /// **'DAY 1 • MON'**
  String get day1_mon;

  /// No description provided for @pull_and_core.
  ///
  /// In en, this message translates to:
  /// **'PULL & CORE'**
  String get pull_and_core;

  /// No description provided for @pull_and_core_desc.
  ///
  /// In en, this message translates to:
  /// **'Vertical and horizontal pulls focused on back\ndensity and core stability.'**
  String get pull_and_core_desc;

  /// No description provided for @day2_tue.
  ///
  /// In en, this message translates to:
  /// **'DAY 2 • TUE'**
  String get day2_tue;

  /// No description provided for @push_power.
  ///
  /// In en, this message translates to:
  /// **'PUSH POWER'**
  String get push_power;

  /// No description provided for @push_power_desc.
  ///
  /// In en, this message translates to:
  /// **'Explosive chest and shoulder movements for\npeak force production.'**
  String get push_power_desc;

  /// No description provided for @day3_wed.
  ///
  /// In en, this message translates to:
  /// **'DAY 3 • WED'**
  String get day3_wed;

  /// No description provided for @active_recovery.
  ///
  /// In en, this message translates to:
  /// **'ACTIVE\nRECOVERY'**
  String get active_recovery;

  /// No description provided for @rest.
  ///
  /// In en, this message translates to:
  /// **'REST'**
  String get rest;

  /// No description provided for @day4_thu.
  ///
  /// In en, this message translates to:
  /// **'DAY 4 • THU'**
  String get day4_thu;

  /// No description provided for @legs_hypertrophy.
  ///
  /// In en, this message translates to:
  /// **'LEGS & HYPERTROPHY'**
  String get legs_hypertrophy;

  /// No description provided for @legs_hypertrophy_desc.
  ///
  /// In en, this message translates to:
  /// **'High volume quad and glute focus.\nMechanical tension priority.'**
  String get legs_hypertrophy_desc;

  /// No description provided for @locked.
  ///
  /// In en, this message translates to:
  /// **'LOCKED'**
  String get locked;

  /// No description provided for @nav_plan.
  ///
  /// In en, this message translates to:
  /// **'PLAN'**
  String get nav_plan;

  /// No description provided for @nav_explore.
  ///
  /// In en, this message translates to:
  /// **'EXPLORE'**
  String get nav_explore;

  /// No description provided for @nav_stats.
  ///
  /// In en, this message translates to:
  /// **'STATS'**
  String get nav_stats;

  /// No description provided for @nav_profile.
  ///
  /// In en, this message translates to:
  /// **'PROFILE'**
  String get nav_profile;

  /// No description provided for @login_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Your elite performance journey begins\nhere.'**
  String get login_subtitle;

  /// No description provided for @continue_apple.
  ///
  /// In en, this message translates to:
  /// **'Continue with Apple'**
  String get continue_apple;

  /// No description provided for @continue_google.
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get continue_google;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'OR'**
  String get or;

  /// No description provided for @email_address.
  ///
  /// In en, this message translates to:
  /// **'EMAIL ADDRESS'**
  String get email_address;

  /// No description provided for @email_hint.
  ///
  /// In en, this message translates to:
  /// **'coach@kinetic.app'**
  String get email_hint;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'PASSWORD'**
  String get password;

  /// No description provided for @forgot_password.
  ///
  /// In en, this message translates to:
  /// **'FORGOT PASSWORD?'**
  String get forgot_password;

  /// No description provided for @password_hint.
  ///
  /// In en, this message translates to:
  /// **'••••••••'**
  String get password_hint;

  /// No description provided for @log_in.
  ///
  /// In en, this message translates to:
  /// **'Log In'**
  String get log_in;

  /// No description provided for @dont_have_account.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? '**
  String get dont_have_account;

  /// No description provided for @sign_up.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get sign_up;

  /// No description provided for @full_name.
  ///
  /// In en, this message translates to:
  /// **'FULL NAME'**
  String get full_name;

  /// No description provided for @full_name_hint.
  ///
  /// In en, this message translates to:
  /// **'Coach Name'**
  String get full_name_hint;

  /// No description provided for @create_account.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get create_account;

  /// No description provided for @already_have_account.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? '**
  String get already_have_account;

  /// No description provided for @log_in_text.
  ///
  /// In en, this message translates to:
  /// **'Log In'**
  String get log_in_text;

  /// No description provided for @reset_password.
  ///
  /// In en, this message translates to:
  /// **'RESET PASSWORD'**
  String get reset_password;

  /// No description provided for @locked_out.
  ///
  /// In en, this message translates to:
  /// **'Locked Out?'**
  String get locked_out;

  /// No description provided for @reset_instructions.
  ///
  /// In en, this message translates to:
  /// **'Enter your email address and we\'ll send you a secure link to reset your password.'**
  String get reset_instructions;

  /// No description provided for @send_reset_link.
  ///
  /// In en, this message translates to:
  /// **'Send Reset Link'**
  String get send_reset_link;

  /// No description provided for @back_to_login.
  ///
  /// In en, this message translates to:
  /// **'BACK TO LOGIN'**
  String get back_to_login;

  /// No description provided for @join_athletes.
  ///
  /// In en, this message translates to:
  /// **'JOIN 12,000+ ATHLETES'**
  String get join_athletes;

  /// No description provided for @need_help.
  ///
  /// In en, this message translates to:
  /// **'Need more help? Contact '**
  String get need_help;

  /// No description provided for @kinetic_support.
  ///
  /// In en, this message translates to:
  /// **'Kinetic Support'**
  String get kinetic_support;

  /// No description provided for @security_first.
  ///
  /// In en, this message translates to:
  /// **'SECURITY FIRST'**
  String get security_first;

  /// No description provided for @secure_account.
  ///
  /// In en, this message translates to:
  /// **'Secure Your\nAccount'**
  String get secure_account;

  /// No description provided for @secure_desc.
  ///
  /// In en, this message translates to:
  /// **'Create a strong password to protect\nyour fitness data and progress.'**
  String get secure_desc;

  /// No description provided for @new_password.
  ///
  /// In en, this message translates to:
  /// **'NEW PASSWORD'**
  String get new_password;

  /// No description provided for @confirm_password.
  ///
  /// In en, this message translates to:
  /// **'CONFIRM PASSWORD'**
  String get confirm_password;

  /// No description provided for @security_req.
  ///
  /// In en, this message translates to:
  /// **'SECURITY REQUIREMENTS'**
  String get security_req;

  /// No description provided for @min_8_chars.
  ///
  /// In en, this message translates to:
  /// **'Minimum 8 characters'**
  String get min_8_chars;

  /// No description provided for @special_symbol.
  ///
  /// In en, this message translates to:
  /// **'At least one special symbol'**
  String get special_symbol;

  /// No description provided for @uppercase_letter.
  ///
  /// In en, this message translates to:
  /// **'One uppercase letter'**
  String get uppercase_letter;

  /// No description provided for @match_password.
  ///
  /// In en, this message translates to:
  /// **'Passwords must match'**
  String get match_password;

  /// No description provided for @update_password.
  ///
  /// In en, this message translates to:
  /// **'Update Password'**
  String get update_password;

  /// No description provided for @return_to_login.
  ///
  /// In en, this message translates to:
  /// **'Return to Login'**
  String get return_to_login;

  /// No description provided for @profileTitle.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileTitle;

  /// No description provided for @profileProMember.
  ///
  /// In en, this message translates to:
  /// **'PRO MEMBER'**
  String get profileProMember;

  /// No description provided for @profileFollowers.
  ///
  /// In en, this message translates to:
  /// **'FOLLOWERS'**
  String get profileFollowers;

  /// No description provided for @profileFollowing.
  ///
  /// In en, this message translates to:
  /// **'FOLLOWING'**
  String get profileFollowing;

  /// No description provided for @profileTotalVolume.
  ///
  /// In en, this message translates to:
  /// **'TOTAL VOLUME'**
  String get profileTotalVolume;

  /// No description provided for @profileWorkouts.
  ///
  /// In en, this message translates to:
  /// **'WORKOUTS'**
  String get profileWorkouts;

  /// No description provided for @profileDayStreak.
  ///
  /// In en, this message translates to:
  /// **'DAY STREAK'**
  String get profileDayStreak;

  /// No description provided for @profileTrainingConsistency.
  ///
  /// In en, this message translates to:
  /// **'TRAINING\nCONSISTENCY'**
  String get profileTrainingConsistency;

  /// No description provided for @profileLast6Months.
  ///
  /// In en, this message translates to:
  /// **'Last 6\nMonths'**
  String get profileLast6Months;

  /// No description provided for @profileLibrary.
  ///
  /// In en, this message translates to:
  /// **'LIBRARY'**
  String get profileLibrary;

  /// No description provided for @profileMyRoutines.
  ///
  /// In en, this message translates to:
  /// **'My Routines'**
  String get profileMyRoutines;

  /// No description provided for @profilePersonalRecords.
  ///
  /// In en, this message translates to:
  /// **'Personal Records'**
  String get profilePersonalRecords;

  /// No description provided for @profileExercisesLogged.
  ///
  /// In en, this message translates to:
  /// **'Exercises Logged'**
  String get profileExercisesLogged;

  /// No description provided for @profileRecentBadges.
  ///
  /// In en, this message translates to:
  /// **'RECENT BADGES'**
  String get profileRecentBadges;

  /// No description provided for @profileViewAll.
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get profileViewAll;

  /// No description provided for @profileEarlyBird.
  ///
  /// In en, this message translates to:
  /// **'EARLY BIRD'**
  String get profileEarlyBird;

  /// No description provided for @profileCentury.
  ///
  /// In en, this message translates to:
  /// **'CENTURY'**
  String get profileCentury;

  /// No description provided for @profileLocked.
  ///
  /// In en, this message translates to:
  /// **'LOCKED'**
  String get profileLocked;

  /// No description provided for @navBarHome.
  ///
  /// In en, this message translates to:
  /// **'HOME'**
  String get navBarHome;

  /// No description provided for @navBarPrograms.
  ///
  /// In en, this message translates to:
  /// **'TRAIN'**
  String get navBarPrograms;

  /// No description provided for @navBarAiHub.
  ///
  /// In en, this message translates to:
  /// **'AI HUB'**
  String get navBarAiHub;

  /// No description provided for @navBarProfile.
  ///
  /// In en, this message translates to:
  /// **'PROFILE'**
  String get navBarProfile;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @settingsEditProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile >'**
  String get settingsEditProfile;

  /// No description provided for @settingsWorkoutSettings.
  ///
  /// In en, this message translates to:
  /// **'WORKOUT SETTINGS'**
  String get settingsWorkoutSettings;

  /// No description provided for @settingsRestTimer.
  ///
  /// In en, this message translates to:
  /// **'Rest Timer'**
  String get settingsRestTimer;

  /// No description provided for @settingsDefault90s.
  ///
  /// In en, this message translates to:
  /// **'Default: 90s'**
  String get settingsDefault90s;

  /// No description provided for @settingsWeightUnits.
  ///
  /// In en, this message translates to:
  /// **'Weight Units'**
  String get settingsWeightUnits;

  /// No description provided for @settingsPlateCalculator.
  ///
  /// In en, this message translates to:
  /// **'Plate Calculator'**
  String get settingsPlateCalculator;

  /// No description provided for @settingsLockScreen.
  ///
  /// In en, this message translates to:
  /// **'Lock Screen Controls'**
  String get settingsLockScreen;

  /// No description provided for @settingsPreferences.
  ///
  /// In en, this message translates to:
  /// **'PREFERENCES'**
  String get settingsPreferences;

  /// No description provided for @settingsAppearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get settingsAppearance;

  /// No description provided for @settingsSystemDefault.
  ///
  /// In en, this message translates to:
  /// **'System Default'**
  String get settingsSystemDefault;

  /// No description provided for @settingsLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLanguage;

  /// No description provided for @settingsEnglishUS.
  ///
  /// In en, this message translates to:
  /// **'English (US)'**
  String get settingsEnglishUS;

  /// No description provided for @settingsNotifications.
  ///
  /// In en, this message translates to:
  /// **'NOTIFICATIONS'**
  String get settingsNotifications;

  /// No description provided for @settingsPushNotif.
  ///
  /// In en, this message translates to:
  /// **'Push Notifications'**
  String get settingsPushNotif;

  /// No description provided for @settingsWorkoutReminders.
  ///
  /// In en, this message translates to:
  /// **'Workout Reminders'**
  String get settingsWorkoutReminders;

  /// No description provided for @settingsCoachMessages.
  ///
  /// In en, this message translates to:
  /// **'Coach Messages'**
  String get settingsCoachMessages;

  /// No description provided for @settingsSocialActivity.
  ///
  /// In en, this message translates to:
  /// **'Social Activity'**
  String get settingsSocialActivity;

  /// No description provided for @settingsSupportLegal.
  ///
  /// In en, this message translates to:
  /// **'SUPPORT & LEGAL'**
  String get settingsSupportLegal;

  /// No description provided for @settingsHelpCenter.
  ///
  /// In en, this message translates to:
  /// **'Help Center'**
  String get settingsHelpCenter;

  /// No description provided for @settingsPrivacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get settingsPrivacyPolicy;

  /// No description provided for @settingsRateKinetic.
  ///
  /// In en, this message translates to:
  /// **'Rate Kinetic'**
  String get settingsRateKinetic;

  /// No description provided for @settingsLogOut.
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get settingsLogOut;

  /// No description provided for @settingsAppVersion.
  ///
  /// In en, this message translates to:
  /// **'KINETIC V4.2.0 • BUILD 1994'**
  String get settingsAppVersion;

  /// No description provided for @trainTitle.
  ///
  /// In en, this message translates to:
  /// **'TRAIN'**
  String get trainTitle;

  /// No description provided for @trainCurrentStreak.
  ///
  /// In en, this message translates to:
  /// **'CURRENT\nSTREAK'**
  String get trainCurrentStreak;

  /// No description provided for @trainDays.
  ///
  /// In en, this message translates to:
  /// **'Days'**
  String get trainDays;

  /// No description provided for @trainBestStreak.
  ///
  /// In en, this message translates to:
  /// **'BEST: 14 DAYS'**
  String get trainBestStreak;

  /// No description provided for @trainMonthlyVolume.
  ///
  /// In en, this message translates to:
  /// **'MONTHLY\nVOLUME'**
  String get trainMonthlyVolume;

  /// No description provided for @trainLbs.
  ///
  /// In en, this message translates to:
  /// **'LBS'**
  String get trainLbs;

  /// No description provided for @trainStartEmptyWorkout.
  ///
  /// In en, this message translates to:
  /// **'Start Empty Workout'**
  String get trainStartEmptyWorkout;

  /// No description provided for @trainLogFreeForm.
  ///
  /// In en, this message translates to:
  /// **'Log a free-form session'**
  String get trainLogFreeForm;

  /// No description provided for @trainFolders.
  ///
  /// In en, this message translates to:
  /// **'Folders'**
  String get trainFolders;

  /// No description provided for @trainSeeAll.
  ///
  /// In en, this message translates to:
  /// **'SEE ALL'**
  String get trainSeeAll;

  /// No description provided for @trainNewFolder.
  ///
  /// In en, this message translates to:
  /// **'+ New Folder'**
  String get trainNewFolder;

  /// No description provided for @trainMyRoutines.
  ///
  /// In en, this message translates to:
  /// **'MY ROUTINES'**
  String get trainMyRoutines;

  /// No description provided for @sessionActive.
  ///
  /// In en, this message translates to:
  /// **'ACTIVE SESSION'**
  String get sessionActive;

  /// No description provided for @sessionFinish.
  ///
  /// In en, this message translates to:
  /// **'Finish'**
  String get sessionFinish;

  /// No description provided for @sessionMorning.
  ///
  /// In en, this message translates to:
  /// **'MONDAY MORNING'**
  String get sessionMorning;

  /// No description provided for @sessionLegDay.
  ///
  /// In en, this message translates to:
  /// **'Leg Day '**
  String get sessionLegDay;

  /// No description provided for @sessionFocus.
  ///
  /// In en, this message translates to:
  /// **'Focus'**
  String get sessionFocus;

  /// No description provided for @sessionKcal.
  ///
  /// In en, this message translates to:
  /// **'KCAL'**
  String get sessionKcal;

  /// No description provided for @sessionSet.
  ///
  /// In en, this message translates to:
  /// **'SET'**
  String get sessionSet;

  /// No description provided for @sessionPrevious.
  ///
  /// In en, this message translates to:
  /// **'PREVIOUS'**
  String get sessionPrevious;

  /// No description provided for @sessionKg.
  ///
  /// In en, this message translates to:
  /// **'KG'**
  String get sessionKg;

  /// No description provided for @sessionReps.
  ///
  /// In en, this message translates to:
  /// **'REPS'**
  String get sessionReps;

  /// No description provided for @sessionAddSet.
  ///
  /// In en, this message translates to:
  /// **'+ Add Set'**
  String get sessionAddSet;

  /// No description provided for @sessionAddExercise.
  ///
  /// In en, this message translates to:
  /// **'Add Exercise '**
  String get sessionAddExercise;

  /// No description provided for @sessionResting.
  ///
  /// In en, this message translates to:
  /// **'Resting'**
  String get sessionResting;

  /// No description provided for @sessionNextSet.
  ///
  /// In en, this message translates to:
  /// **'NEXT: SET '**
  String get sessionNextSet;

  /// No description provided for @dialogDiscardTitle.
  ///
  /// In en, this message translates to:
  /// **'Discard Workout?'**
  String get dialogDiscardTitle;

  /// No description provided for @dialogDiscardBody1.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to discard\nthis workout? All progress from\nthis session will be '**
  String get dialogDiscardBody1;

  /// No description provided for @dialogDiscardBodyBold.
  ///
  /// In en, this message translates to:
  /// **'lost forever'**
  String get dialogDiscardBodyBold;

  /// No description provided for @dialogDiscardBody2.
  ///
  /// In en, this message translates to:
  /// **'.'**
  String get dialogDiscardBody2;

  /// No description provided for @dialogBtnDiscard.
  ///
  /// In en, this message translates to:
  /// **'Discard'**
  String get dialogBtnDiscard;

  /// No description provided for @dialogBtnKeepTraining.
  ///
  /// In en, this message translates to:
  /// **'Keep Training'**
  String get dialogBtnKeepTraining;

  /// No description provided for @sumSession.
  ///
  /// In en, this message translates to:
  /// **'SESSION SUMMARY'**
  String get sumSession;

  /// No description provided for @sumCrushed.
  ///
  /// In en, this message translates to:
  /// **'YOU CRUSHED IT.'**
  String get sumCrushed;

  /// No description provided for @sumDuration.
  ///
  /// In en, this message translates to:
  /// **'DURATION'**
  String get sumDuration;

  /// No description provided for @sumTotalSets.
  ///
  /// In en, this message translates to:
  /// **'TOTAL SETS'**
  String get sumTotalSets;

  /// No description provided for @sumIntensity.
  ///
  /// In en, this message translates to:
  /// **'INTENSITY'**
  String get sumIntensity;

  /// No description provided for @sumTotalVolume.
  ///
  /// In en, this message translates to:
  /// **'TOTAL VOLUME'**
  String get sumTotalVolume;

  /// No description provided for @sumPersonalRecords.
  ///
  /// In en, this message translates to:
  /// **'Personal Records'**
  String get sumPersonalRecords;

  /// No description provided for @sumVolumeTrend.
  ///
  /// In en, this message translates to:
  /// **'Volume Trend'**
  String get sumVolumeTrend;

  /// No description provided for @sumExercisesBreakdown.
  ///
  /// In en, this message translates to:
  /// **'Exercises Breakdown'**
  String get sumExercisesBreakdown;

  /// No description provided for @sumShareResults.
  ///
  /// In en, this message translates to:
  /// **'SHARE RESULTS'**
  String get sumShareResults;

  /// No description provided for @sumDone.
  ///
  /// In en, this message translates to:
  /// **'DONE'**
  String get sumDone;

  /// No description provided for @restSettingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Rest Settings'**
  String get restSettingsTitle;

  /// No description provided for @defaultRestTime.
  ///
  /// In en, this message translates to:
  /// **'Default Rest Time'**
  String get defaultRestTime;

  /// No description provided for @activeTag.
  ///
  /// In en, this message translates to:
  /// **'ACTIVE'**
  String get activeTag;

  /// No description provided for @minutesSeconds.
  ///
  /// In en, this message translates to:
  /// **'MINUTES : SECONDS'**
  String get minutesSeconds;

  /// No description provided for @saveAction.
  ///
  /// In en, this message translates to:
  /// **'SAVE'**
  String get saveAction;

  /// No description provided for @timerBehavior.
  ///
  /// In en, this message translates to:
  /// **'Timer Behavior'**
  String get timerBehavior;

  /// No description provided for @autoStartTimer.
  ///
  /// In en, this message translates to:
  /// **'Auto-Start Timer'**
  String get autoStartTimer;

  /// No description provided for @autoStartTimerDesc.
  ///
  /// In en, this message translates to:
  /// **'Begin countdown after logging a set.'**
  String get autoStartTimerDesc;

  /// No description provided for @soundAlerts.
  ///
  /// In en, this message translates to:
  /// **'Sound Alerts'**
  String get soundAlerts;

  /// No description provided for @soundAlertsDesc.
  ///
  /// In en, this message translates to:
  /// **'Chime when rest period ends.'**
  String get soundAlertsDesc;

  /// No description provided for @hapticFeedback.
  ///
  /// In en, this message translates to:
  /// **'Haptic Feedback'**
  String get hapticFeedback;

  /// No description provided for @hapticFeedbackDesc.
  ///
  /// In en, this message translates to:
  /// **'Vibrate when rest period ends.'**
  String get hapticFeedbackDesc;

  /// No description provided for @whyRestMatters.
  ///
  /// In en, this message translates to:
  /// **'Why Rest Matters'**
  String get whyRestMatters;

  /// No description provided for @hypertrophyFocusTitle.
  ///
  /// In en, this message translates to:
  /// **'HYPERTROPHY FOCUS'**
  String get hypertrophyFocusTitle;

  /// No description provided for @hypertrophyFocusDesc.
  ///
  /// In en, this message translates to:
  /// **'Optimal muscle growth research suggests rest periods of 60 to 90 seconds to maintain metabolic stress.'**
  String get hypertrophyFocusDesc;

  /// No description provided for @strengthFocusTitle.
  ///
  /// In en, this message translates to:
  /// **'STRENGTH FOCUS'**
  String get strengthFocusTitle;

  /// No description provided for @strengthFocusDesc.
  ///
  /// In en, this message translates to:
  /// **'Heavy lifting requires greater neurological recovery. Aim for 3 to 5 minutes between maximal effort sets.'**
  String get strengthFocusDesc;

  /// No description provided for @newPrTitle.
  ///
  /// In en, this message translates to:
  /// **'New Personal Record'**
  String get newPrTitle;

  /// No description provided for @congratulations.
  ///
  /// In en, this message translates to:
  /// **'CONGRATULATIONS'**
  String get congratulations;

  /// No description provided for @newPrBadge.
  ///
  /// In en, this message translates to:
  /// **'NEW PR'**
  String get newPrBadge;

  /// No description provided for @repMaxImproved.
  ///
  /// In en, this message translates to:
  /// **'1 Rep Max • Improved by 4.3%'**
  String get repMaxImproved;

  /// No description provided for @previousLabel.
  ///
  /// In en, this message translates to:
  /// **'PREVIOUS'**
  String get previousLabel;

  /// No description provided for @increaseLabel.
  ///
  /// In en, this message translates to:
  /// **'INCREASE'**
  String get increaseLabel;

  /// No description provided for @activityComparison.
  ///
  /// In en, this message translates to:
  /// **'ACTIVITY COMPARISON'**
  String get activityComparison;

  /// No description provided for @topLifters.
  ///
  /// In en, this message translates to:
  /// **'Top 1% of lifters in your age group'**
  String get topLifters;

  /// No description provided for @growthCurve.
  ///
  /// In en, this message translates to:
  /// **'Growth Curve'**
  String get growthCurve;

  /// No description provided for @last6Months.
  ///
  /// In en, this message translates to:
  /// **'LAST 6 MONTHS'**
  String get last6Months;

  /// No description provided for @prTag.
  ///
  /// In en, this message translates to:
  /// **'PR'**
  String get prTag;

  /// No description provided for @awesomeBtn.
  ///
  /// In en, this message translates to:
  /// **'Awesome!'**
  String get awesomeBtn;

  /// No description provided for @viewHistoryBtn.
  ///
  /// In en, this message translates to:
  /// **'View History'**
  String get viewHistoryBtn;

  /// No description provided for @exerciseOptions.
  ///
  /// In en, this message translates to:
  /// **'EXERCISE OPTIONS'**
  String get exerciseOptions;

  /// No description provided for @swapExercise.
  ///
  /// In en, this message translates to:
  /// **'Swap Exercise'**
  String get swapExercise;

  /// No description provided for @warmUpCalculator.
  ///
  /// In en, this message translates to:
  /// **'Warm-up Calculator'**
  String get warmUpCalculator;

  /// No description provided for @readyToLift.
  ///
  /// In en, this message translates to:
  /// **'Ready to lift'**
  String get readyToLift;

  /// No description provided for @plateCalculator.
  ///
  /// In en, this message translates to:
  /// **'Plate Calculator'**
  String get plateCalculator;

  /// No description provided for @config60kg.
  ///
  /// In en, this message translates to:
  /// **'60kg configuration'**
  String get config60kg;

  /// No description provided for @restTimerSettings.
  ///
  /// In en, this message translates to:
  /// **'Rest Timer Settings'**
  String get restTimerSettings;

  /// No description provided for @currently90s.
  ///
  /// In en, this message translates to:
  /// **'Currently: 90s'**
  String get currently90s;

  /// No description provided for @addNote.
  ///
  /// In en, this message translates to:
  /// **'Add Note'**
  String get addNote;

  /// No description provided for @removeExercise.
  ///
  /// In en, this message translates to:
  /// **'Remove Exercise'**
  String get removeExercise;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @addExerciseTitle.
  ///
  /// In en, this message translates to:
  /// **'Add Exercise'**
  String get addExerciseTitle;

  /// No description provided for @searchExercises.
  ///
  /// In en, this message translates to:
  /// **'Search exercises...'**
  String get searchExercises;

  /// No description provided for @filters.
  ///
  /// In en, this message translates to:
  /// **'Filters'**
  String get filters;

  /// No description provided for @recommended.
  ///
  /// In en, this message translates to:
  /// **'Recommended'**
  String get recommended;

  /// No description provided for @seeAll.
  ///
  /// In en, this message translates to:
  /// **'See All >'**
  String get seeAll;

  /// No description provided for @addNExercises.
  ///
  /// In en, this message translates to:
  /// **'ADD {count} EXERCISES'**
  String addNExercises(Object count);

  /// No description provided for @shareMilestoneTitle.
  ///
  /// In en, this message translates to:
  /// **'Share Milestone'**
  String get shareMilestoneTitle;

  /// No description provided for @shareMilestoneSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Inspire your crew.'**
  String get shareMilestoneSubtitle;

  /// No description provided for @shareIgStory.
  ///
  /// In en, this message translates to:
  /// **'IG Story'**
  String get shareIgStory;

  /// No description provided for @shareWhatsapp.
  ///
  /// In en, this message translates to:
  /// **'WhatsApp'**
  String get shareWhatsapp;

  /// No description provided for @shareSaveImage.
  ///
  /// In en, this message translates to:
  /// **'Save Image'**
  String get shareSaveImage;

  /// No description provided for @shareCopyLink.
  ///
  /// In en, this message translates to:
  /// **'Copy Link'**
  String get shareCopyLink;

  /// No description provided for @shareMessages.
  ///
  /// In en, this message translates to:
  /// **'Messages'**
  String get shareMessages;

  /// No description provided for @shareMoreApps.
  ///
  /// In en, this message translates to:
  /// **'More Apps'**
  String get shareMoreApps;

  /// No description provided for @exDetailTitle.
  ///
  /// In en, this message translates to:
  /// **'Exercise Detail'**
  String get exDetailTitle;

  /// No description provided for @exDetailVideo.
  ///
  /// In en, this message translates to:
  /// **'EXERCISE VIDEO'**
  String get exDetailVideo;

  /// No description provided for @exDetailCategory.
  ///
  /// In en, this message translates to:
  /// **'STRENGTH TRAINING'**
  String get exDetailCategory;

  /// No description provided for @exDetailLogBtn.
  ///
  /// In en, this message translates to:
  /// **'Log Workout'**
  String get exDetailLogBtn;

  /// No description provided for @exDetailPersonalBest.
  ///
  /// In en, this message translates to:
  /// **'PERSONAL BEST'**
  String get exDetailPersonalBest;

  /// No description provided for @exDetailLbs.
  ///
  /// In en, this message translates to:
  /// **'LBS'**
  String get exDetailLbs;

  /// No description provided for @exDetailAchieved.
  ///
  /// In en, this message translates to:
  /// **'Achieved Oct 24, 2023'**
  String get exDetailAchieved;

  /// No description provided for @exDetailTargetedMuscles.
  ///
  /// In en, this message translates to:
  /// **'TARGETED MUSCLES'**
  String get exDetailTargetedMuscles;

  /// No description provided for @exDetailPrimary.
  ///
  /// In en, this message translates to:
  /// **'PRIMARY'**
  String get exDetailPrimary;

  /// No description provided for @exDetailSecondary.
  ///
  /// In en, this message translates to:
  /// **'SECONDARY'**
  String get exDetailSecondary;

  /// No description provided for @exDetailHowToPerform.
  ///
  /// In en, this message translates to:
  /// **'HOW TO PERFORM'**
  String get exDetailHowToPerform;

  /// No description provided for @exDetailProTips.
  ///
  /// In en, this message translates to:
  /// **'Pro Form Tips'**
  String get exDetailProTips;

  /// No description provided for @calcTitle.
  ///
  /// In en, this message translates to:
  /// **'Plate Calculator'**
  String get calcTitle;

  /// No description provided for @calcTargetTotal.
  ///
  /// In en, this message translates to:
  /// **'TARGET TOTAL WEIGHT'**
  String get calcTargetTotal;

  /// No description provided for @calcEditWeight.
  ///
  /// In en, this message translates to:
  /// **'Edit Weight'**
  String get calcEditWeight;

  /// No description provided for @calcOneSide.
  ///
  /// In en, this message translates to:
  /// **'ONE SIDE'**
  String get calcOneSide;

  /// No description provided for @calcBarbellWeight.
  ///
  /// In en, this message translates to:
  /// **'BARBELL WEIGHT'**
  String get calcBarbellWeight;

  /// No description provided for @calcStandard.
  ///
  /// In en, this message translates to:
  /// **'STANDARD'**
  String get calcStandard;

  /// No description provided for @calcWomens.
  ///
  /// In en, this message translates to:
  /// **'WOMEN\'S'**
  String get calcWomens;

  /// No description provided for @calcTechnique.
  ///
  /// In en, this message translates to:
  /// **'TECHNIQUE'**
  String get calcTechnique;

  /// No description provided for @calcPlatesNeeded.
  ///
  /// In en, this message translates to:
  /// **'PLATES NEEDED (PER SIDE)'**
  String get calcPlatesNeeded;

  /// No description provided for @calcPlate.
  ///
  /// In en, this message translates to:
  /// **'Plate'**
  String get calcPlate;

  /// No description provided for @calcStandardBlue.
  ///
  /// In en, this message translates to:
  /// **'STANDARD BLUE'**
  String get calcStandardBlue;

  /// No description provided for @calcOlympicGreen.
  ///
  /// In en, this message translates to:
  /// **'OLYMPIC GREEN'**
  String get calcOlympicGreen;

  /// No description provided for @calcFractionalChrome.
  ///
  /// In en, this message translates to:
  /// **'FRACTIONAL CHROME'**
  String get calcFractionalChrome;

  /// No description provided for @calcAvailableInventory.
  ///
  /// In en, this message translates to:
  /// **'Available Inventory'**
  String get calcAvailableInventory;

  /// No description provided for @calcCustomizeInventory.
  ///
  /// In en, this message translates to:
  /// **'Customize your gym\'s plate set'**
  String get calcCustomizeInventory;

  /// No description provided for @calcCollarWeight.
  ///
  /// In en, this message translates to:
  /// **'Collar Weight'**
  String get calcCollarWeight;

  /// No description provided for @calcIncludeCollars.
  ///
  /// In en, this message translates to:
  /// **'Include 2.5kg collars in total'**
  String get calcIncludeCollars;

  /// No description provided for @calcKg.
  ///
  /// In en, this message translates to:
  /// **'KG'**
  String get calcKg;

  /// No description provided for @addNoteTitle.
  ///
  /// In en, this message translates to:
  /// **'Add Note'**
  String get addNoteTitle;

  /// No description provided for @addNoteHint.
  ///
  /// In en, this message translates to:
  /// **'E.g., Felt strong on the last set. Keep torso more upright next time.'**
  String get addNoteHint;

  /// No description provided for @tagLeftLegWeaker.
  ///
  /// In en, this message translates to:
  /// **'Left Leg Weaker'**
  String get tagLeftLegWeaker;

  /// No description provided for @tagIncreaseWeight.
  ///
  /// In en, this message translates to:
  /// **'Increase Weight'**
  String get tagIncreaseWeight;

  /// No description provided for @saveNoteBtn.
  ///
  /// In en, this message translates to:
  /// **'Save Note'**
  String get saveNoteBtn;

  /// No description provided for @warmUpCalcTitle.
  ///
  /// In en, this message translates to:
  /// **'Warm-up Calculator'**
  String get warmUpCalcTitle;

  /// No description provided for @warmUpTargetWeight.
  ///
  /// In en, this message translates to:
  /// **'TARGET WORKING WEIGHT'**
  String get warmUpTargetWeight;

  /// No description provided for @warmUpStandard.
  ///
  /// In en, this message translates to:
  /// **'Standard'**
  String get warmUpStandard;

  /// No description provided for @warmUpQuick.
  ///
  /// In en, this message translates to:
  /// **'Quick'**
  String get warmUpQuick;

  /// No description provided for @warmUpPowerlifting.
  ///
  /// In en, this message translates to:
  /// **'Powerlifting'**
  String get warmUpPowerlifting;

  /// No description provided for @warmUpCalculatedSteps.
  ///
  /// In en, this message translates to:
  /// **'CALCULATED WARM-UP STEPS'**
  String get warmUpCalculatedSteps;

  /// No description provided for @warmUpEmptyBar.
  ///
  /// In en, this message translates to:
  /// **'Empty Bar · 10 Reps'**
  String get warmUpEmptyBar;

  /// No description provided for @warmUpLight.
  ///
  /// In en, this message translates to:
  /// **'Light Loading · 8 Reps'**
  String get warmUpLight;

  /// No description provided for @warmUpVelocity.
  ///
  /// In en, this message translates to:
  /// **'Working Velocity · 5 Reps'**
  String get warmUpVelocity;

  /// No description provided for @warmUpNeural.
  ///
  /// In en, this message translates to:
  /// **'Neural Activation · 3 Reps'**
  String get warmUpNeural;

  /// No description provided for @warmUpBloodFlow.
  ///
  /// In en, this message translates to:
  /// **'BLOOD FLOW'**
  String get warmUpBloodFlow;

  /// No description provided for @warmUpPrep.
  ///
  /// In en, this message translates to:
  /// **'PREP'**
  String get warmUpPrep;

  /// No description provided for @warmUpFeeler.
  ///
  /// In en, this message translates to:
  /// **'FEELER'**
  String get warmUpFeeler;

  /// No description provided for @warmUpFinal.
  ///
  /// In en, this message translates to:
  /// **'FINAL STEP'**
  String get warmUpFinal;

  /// No description provided for @warmUpProTip.
  ///
  /// In en, this message translates to:
  /// **'Pro Tip'**
  String get warmUpProTip;

  /// No description provided for @warmUpProTipDesc.
  ///
  /// In en, this message translates to:
  /// **'Warm-up sets should feel crisp and fast. If the 80% set feels heavy, you might need an extra 2-minute rest before your first working set.'**
  String get warmUpProTipDesc;

  /// No description provided for @removeExerciseQuestion.
  ///
  /// In en, this message translates to:
  /// **'Remove EXERCISE_NAME?'**
  String get removeExerciseQuestion;

  /// No description provided for @removeExerciseBody.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to remove this exercise? All sets recorded for this exercise in the current session will be permanently lost.'**
  String get removeExerciseBody;

  /// No description provided for @filterTitle.
  ///
  /// In en, this message translates to:
  /// **'Filters'**
  String get filterTitle;

  /// No description provided for @filterMuscleGroup.
  ///
  /// In en, this message translates to:
  /// **'MUSCLE GROUP'**
  String get filterMuscleGroup;

  /// No description provided for @filterEquipment.
  ///
  /// In en, this message translates to:
  /// **'EQUIPMENT'**
  String get filterEquipment;

  /// No description provided for @filterAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get filterAll;

  /// No description provided for @filterChest.
  ///
  /// In en, this message translates to:
  /// **'Chest'**
  String get filterChest;

  /// No description provided for @filterBack.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get filterBack;

  /// No description provided for @filterLegs.
  ///
  /// In en, this message translates to:
  /// **'Legs'**
  String get filterLegs;

  /// No description provided for @filterShoulders.
  ///
  /// In en, this message translates to:
  /// **'Shoulders'**
  String get filterShoulders;

  /// No description provided for @filterArms.
  ///
  /// In en, this message translates to:
  /// **'Arms'**
  String get filterArms;

  /// No description provided for @filterBarbell.
  ///
  /// In en, this message translates to:
  /// **'Barbell'**
  String get filterBarbell;

  /// No description provided for @filterDumbbell.
  ///
  /// In en, this message translates to:
  /// **'Dumbbell'**
  String get filterDumbbell;

  /// No description provided for @filterMachine.
  ///
  /// In en, this message translates to:
  /// **'Machine'**
  String get filterMachine;

  /// No description provided for @filterCables.
  ///
  /// In en, this message translates to:
  /// **'Cables'**
  String get filterCables;

  /// No description provided for @filterBodyweight.
  ///
  /// In en, this message translates to:
  /// **'Bodyweight'**
  String get filterBodyweight;

  /// No description provided for @filterClearAll.
  ///
  /// In en, this message translates to:
  /// **'CLEAR ALL'**
  String get filterClearAll;

  /// No description provided for @filterApply.
  ///
  /// In en, this message translates to:
  /// **'APPLY FILTERS'**
  String get filterApply;

  /// No description provided for @discover_title.
  ///
  /// In en, this message translates to:
  /// **'DISCOVER'**
  String get discover_title;

  /// No description provided for @discover_search_hint.
  ///
  /// In en, this message translates to:
  /// **'Search exercises, routines, or creators...'**
  String get discover_search_hint;

  /// No description provided for @discover_featured.
  ///
  /// In en, this message translates to:
  /// **'FEATURED'**
  String get discover_featured;

  /// No description provided for @discover_trending_programs.
  ///
  /// In en, this message translates to:
  /// **'Trending Programs'**
  String get discover_trending_programs;

  /// No description provided for @discover_view_all.
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get discover_view_all;

  /// No description provided for @discover_weeks.
  ///
  /// In en, this message translates to:
  /// **'WEEKS'**
  String get discover_weeks;

  /// No description provided for @discover_days_per_week.
  ///
  /// In en, this message translates to:
  /// **'DAYS/WEEK'**
  String get discover_days_per_week;

  /// No description provided for @discover_library.
  ///
  /// In en, this message translates to:
  /// **'LIBRARY'**
  String get discover_library;

  /// No description provided for @discover_categories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get discover_categories;

  /// No description provided for @discover_category_chest.
  ///
  /// In en, this message translates to:
  /// **'CHEST'**
  String get discover_category_chest;

  /// No description provided for @discover_category_back.
  ///
  /// In en, this message translates to:
  /// **'BACK'**
  String get discover_category_back;

  /// No description provided for @discover_category_legs.
  ///
  /// In en, this message translates to:
  /// **'LEGS'**
  String get discover_category_legs;

  /// No description provided for @discover_category_cardio.
  ///
  /// In en, this message translates to:
  /// **'CARDIO'**
  String get discover_category_cardio;

  /// No description provided for @discover_community.
  ///
  /// In en, this message translates to:
  /// **'COMMUNITY'**
  String get discover_community;

  /// No description provided for @discover_popular_routines.
  ///
  /// In en, this message translates to:
  /// **'Popular Routines'**
  String get discover_popular_routines;

  /// No description provided for @discover_exercises.
  ///
  /// In en, this message translates to:
  /// **'EXERCISES'**
  String get discover_exercises;

  /// No description provided for @discover_est_min.
  ///
  /// In en, this message translates to:
  /// **'EST. {time} MIN'**
  String discover_est_min(Object time);

  /// No description provided for @feed_tab_all.
  ///
  /// In en, this message translates to:
  /// **'All Activity'**
  String get feed_tab_all;

  /// No description provided for @feed_tab_personal_bests.
  ///
  /// In en, this message translates to:
  /// **'Personal Bests'**
  String get feed_tab_personal_bests;

  /// No description provided for @feed_tab_following.
  ///
  /// In en, this message translates to:
  /// **'Following'**
  String get feed_tab_following;

  /// No description provided for @feed_new_pr.
  ///
  /// In en, this message translates to:
  /// **'NEW PR'**
  String get feed_new_pr;

  /// No description provided for @feed_duration_label.
  ///
  /// In en, this message translates to:
  /// **'DURATION (M)'**
  String get feed_duration_label;

  /// No description provided for @feed_volume_label.
  ///
  /// In en, this message translates to:
  /// **'VOLUME (KG)'**
  String get feed_volume_label;

  /// No description provided for @feed_sets_label.
  ///
  /// In en, this message translates to:
  /// **'TOTAL SETS'**
  String get feed_sets_label;

  /// No description provided for @ai_intelligence_engine.
  ///
  /// In en, this message translates to:
  /// **'INTELLIGENCE ENGINE'**
  String get ai_intelligence_engine;

  /// No description provided for @ai_welcome_to.
  ///
  /// In en, this message translates to:
  /// **'Welcome to\n'**
  String get ai_welcome_to;

  /// No description provided for @ai_kinetic.
  ///
  /// In en, this message translates to:
  /// **'Kinetic AI.'**
  String get ai_kinetic;

  /// No description provided for @ai_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Your intelligent training partner.'**
  String get ai_subtitle;

  /// No description provided for @ai_start_briefing.
  ///
  /// In en, this message translates to:
  /// **'Start Daily Briefing'**
  String get ai_start_briefing;

  /// No description provided for @ai_core_systems.
  ///
  /// In en, this message translates to:
  /// **'CORE SYSTEMS'**
  String get ai_core_systems;

  /// No description provided for @ai_quick_actions.
  ///
  /// In en, this message translates to:
  /// **'Quick Actions'**
  String get ai_quick_actions;

  /// No description provided for @ai_qa_coach_title.
  ///
  /// In en, this message translates to:
  /// **'AI Coach Chat'**
  String get ai_qa_coach_title;

  /// No description provided for @ai_qa_coach_desc.
  ///
  /// In en, this message translates to:
  /// **'Personalized training\nadvice.'**
  String get ai_qa_coach_desc;

  /// No description provided for @ai_qa_form_title.
  ///
  /// In en, this message translates to:
  /// **'Form Analysis'**
  String get ai_qa_form_title;

  /// No description provided for @ai_qa_form_desc.
  ///
  /// In en, this message translates to:
  /// **'Real-time technique\nfeedback.'**
  String get ai_qa_form_desc;

  /// No description provided for @ai_qa_smart_title.
  ///
  /// In en, this message translates to:
  /// **'Smart\nGenerator'**
  String get ai_qa_smart_title;

  /// No description provided for @ai_qa_smart_desc.
  ///
  /// In en, this message translates to:
  /// **'Create a workout in\nseconds.'**
  String get ai_qa_smart_desc;

  /// No description provided for @ai_qa_predict_title.
  ///
  /// In en, this message translates to:
  /// **'Predictions'**
  String get ai_qa_predict_title;

  /// No description provided for @ai_qa_predict_desc.
  ///
  /// In en, this message translates to:
  /// **'Track your strength\ntrends.'**
  String get ai_qa_predict_desc;

  /// No description provided for @ai_neural_insights.
  ///
  /// In en, this message translates to:
  /// **'NEURAL INSIGHTS'**
  String get ai_neural_insights;

  /// No description provided for @ai_recent_bites.
  ///
  /// In en, this message translates to:
  /// **'Recent Bites'**
  String get ai_recent_bites;

  /// No description provided for @ai_bite_movement_iq.
  ///
  /// In en, this message translates to:
  /// **'MOVEMENT IQ'**
  String get ai_bite_movement_iq;

  /// No description provided for @ai_bite_movement_text1.
  ///
  /// In en, this message translates to:
  /// **'Your '**
  String get ai_bite_movement_text1;

  /// No description provided for @ai_bite_movement_text2.
  ///
  /// In en, this message translates to:
  /// **'Squat technique'**
  String get ai_bite_movement_text2;

  /// No description provided for @ai_bite_movement_text3.
  ///
  /// In en, this message translates to:
  /// **' improved\nby '**
  String get ai_bite_movement_text3;

  /// No description provided for @ai_bite_movement_text4.
  ///
  /// In en, this message translates to:
  /// **'5%'**
  String get ai_bite_movement_text4;

  /// No description provided for @ai_bite_movement_text5.
  ///
  /// In en, this message translates to:
  /// **' this week. Focus on hip\ndrive.'**
  String get ai_bite_movement_text5;

  /// No description provided for @ai_bite_strength_proj.
  ///
  /// In en, this message translates to:
  /// **'STRENGTH PROJECTION'**
  String get ai_bite_strength_proj;

  /// No description provided for @ai_bite_strength_text1.
  ///
  /// In en, this message translates to:
  /// **'Predicted '**
  String get ai_bite_strength_text1;

  /// No description provided for @ai_bite_strength_text2.
  ///
  /// In en, this message translates to:
  /// **'Bench Press 1RM'**
  String get ai_bite_strength_text2;

  /// No description provided for @ai_bite_strength_text3.
  ///
  /// In en, this message translates to:
  /// **':\n'**
  String get ai_bite_strength_text3;

  /// No description provided for @ai_bite_strength_text4.
  ///
  /// In en, this message translates to:
  /// **'105kg'**
  String get ai_bite_strength_text4;

  /// No description provided for @ai_bite_strength_text5.
  ///
  /// In en, this message translates to:
  /// **' (+2kg increase since\nTuesday).'**
  String get ai_bite_strength_text5;

  /// No description provided for @ai_recommended_path.
  ///
  /// In en, this message translates to:
  /// **'RECOMMENDED PATH'**
  String get ai_recommended_path;

  /// No description provided for @ai_program_spotlight.
  ///
  /// In en, this message translates to:
  /// **'AI Program Spotlight'**
  String get ai_program_spotlight;

  /// No description provided for @ai_spotlight_tag.
  ///
  /// In en, this message translates to:
  /// **'HIGH INTENSITY'**
  String get ai_spotlight_tag;

  /// No description provided for @ai_spotlight_title.
  ///
  /// In en, this message translates to:
  /// **'THE ADAPTIVE\nHYPERTROPHY\nPLAN'**
  String get ai_spotlight_title;

  /// No description provided for @ai_spotlight_desc.
  ///
  /// In en, this message translates to:
  /// **'Our neural network analyzed your last 14\nsessions to craft this custom 6-week\nblock. Optimized for rapid muscle\nrecruitment.'**
  String get ai_spotlight_desc;

  /// No description provided for @ai_preview_program.
  ///
  /// In en, this message translates to:
  /// **'PREVIEW PROGRAM'**
  String get ai_preview_program;

  /// No description provided for @chat_today.
  ///
  /// In en, this message translates to:
  /// **'TODAY'**
  String get chat_today;

  /// No description provided for @chat_coach_name.
  ///
  /// In en, this message translates to:
  /// **'Coach Marcus'**
  String get chat_coach_name;

  /// No description provided for @chat_online.
  ///
  /// In en, this message translates to:
  /// **'ONLINE'**
  String get chat_online;

  /// No description provided for @chat_sent.
  ///
  /// In en, this message translates to:
  /// **'Sent'**
  String get chat_sent;

  /// No description provided for @chat_weekly_volume.
  ///
  /// In en, this message translates to:
  /// **'WEEKLY VOLUME'**
  String get chat_weekly_volume;

  /// No description provided for @chat_kg.
  ///
  /// In en, this message translates to:
  /// **'KG'**
  String get chat_kg;

  /// No description provided for @chat_intensity_shift.
  ///
  /// In en, this message translates to:
  /// **'INTENSITY SHIFT'**
  String get chat_intensity_shift;

  /// No description provided for @chat_hint.
  ///
  /// In en, this message translates to:
  /// **'Ask Marcus anything...'**
  String get chat_hint;

  /// No description provided for @chat_sugg_1.
  ///
  /// In en, this message translates to:
  /// **'Analyze my Squat'**
  String get chat_sugg_1;

  /// No description provided for @chat_sugg_2.
  ///
  /// In en, this message translates to:
  /// **'Recommend a deload'**
  String get chat_sugg_2;

  /// No description provided for @chat_sugg_3.
  ///
  /// In en, this message translates to:
  /// **'How is my recovery?'**
  String get chat_sugg_3;

  /// No description provided for @mock_ai_msg_1.
  ///
  /// In en, this message translates to:
  /// **'Welcome back! I’ve analyzed your last three leg sessions. Your squat volume is up 12%—great progress. Ready to crush today\'s Push workout, or should we refine your form first?'**
  String get mock_ai_msg_1;

  /// No description provided for @mock_user_msg_1.
  ///
  /// In en, this message translates to:
  /// **'How is my overall training volume looking this week compared to last month? I feel a bit more fatigued than usual.'**
  String get mock_user_msg_1;

  /// No description provided for @mock_ai_msg_2_p1.
  ///
  /// In en, this message translates to:
  /// **'I noticed that. Your total volume has spiked significantly. Let\'s look at the delta:'**
  String get mock_ai_msg_2_p1;

  /// No description provided for @mock_ai_msg_2_p2.
  ///
  /// In en, this message translates to:
  /// **'You\'re in the \'Overreaching\' zone. I recommend a deload session today. Instead of heavy push, we\'ll focus on mobility and dynamic recovery. Shall I update your schedule?'**
  String get mock_ai_msg_2_p2;

  /// No description provided for @hub_neural_link.
  ///
  /// In en, this message translates to:
  /// **'NEURAL LINK ACTIVE'**
  String get hub_neural_link;

  /// No description provided for @hub_meet_coach.
  ///
  /// In en, this message translates to:
  /// **'Meet Your AI\nCoach'**
  String get hub_meet_coach;

  /// No description provided for @hub_coach_desc.
  ///
  /// In en, this message translates to:
  /// **'Ready for today\'s session?\nI\'ve analyzed your sleep and\nprevious volume to optimize\nyour flow.'**
  String get hub_coach_desc;

  /// No description provided for @hub_start_session.
  ///
  /// In en, this message translates to:
  /// **'Start AI Session'**
  String get hub_start_session;

  /// No description provided for @hub_weekly_intensity.
  ///
  /// In en, this message translates to:
  /// **'WEEKLY INTENSITY'**
  String get hub_weekly_intensity;

  /// No description provided for @hub_recovery_gap.
  ///
  /// In en, this message translates to:
  /// **'RECOVERY GAP'**
  String get hub_recovery_gap;

  /// No description provided for @hub_smart_workouts.
  ///
  /// In en, this message translates to:
  /// **'Smart Workouts'**
  String get hub_smart_workouts;

  /// No description provided for @hub_recommended.
  ///
  /// In en, this message translates to:
  /// **'RECOMMENDED'**
  String get hub_recommended;

  /// No description provided for @hub_next_best.
  ///
  /// In en, this message translates to:
  /// **'NEXT BEST SESSION'**
  String get hub_next_best;

  /// No description provided for @hub_mins.
  ///
  /// In en, this message translates to:
  /// **'MINS'**
  String get hub_mins;

  /// No description provided for @hub_kcal.
  ///
  /// In en, this message translates to:
  /// **'KCAL'**
  String get hub_kcal;

  /// No description provided for @hub_view_details.
  ///
  /// In en, this message translates to:
  /// **'View Details'**
  String get hub_view_details;

  /// No description provided for @hub_ai_analysis.
  ///
  /// In en, this message translates to:
  /// **'AI ANALYSIS'**
  String get hub_ai_analysis;

  /// No description provided for @hub_form_check.
  ///
  /// In en, this message translates to:
  /// **'Form Check & Path'**
  String get hub_form_check;

  /// No description provided for @hub_form_desc_1.
  ///
  /// In en, this message translates to:
  /// **'Squat depth increased by '**
  String get hub_form_desc_1;

  /// No description provided for @hub_form_desc_2.
  ///
  /// In en, this message translates to:
  /// **'. Knee drift\nidentified at set 4. Corrective path\nsuggested.'**
  String get hub_form_desc_2;

  /// No description provided for @hub_insights.
  ///
  /// In en, this message translates to:
  /// **'INSIGHTS'**
  String get hub_insights;

  /// No description provided for @hub_tool.
  ///
  /// In en, this message translates to:
  /// **'TOOL'**
  String get hub_tool;

  /// No description provided for @hub_predicted_1rm.
  ///
  /// In en, this message translates to:
  /// **'Predicted 1RM\n(Deadlift)'**
  String get hub_predicted_1rm;

  /// No description provided for @hub_draft_plan.
  ///
  /// In en, this message translates to:
  /// **'Draft New\nPlan'**
  String get hub_draft_plan;

  /// No description provided for @hub_ai_generator.
  ///
  /// In en, this message translates to:
  /// **'AI Program Generator'**
  String get hub_ai_generator;

  /// No description provided for @hub_weekly_pulse.
  ///
  /// In en, this message translates to:
  /// **'Weekly Pulse'**
  String get hub_weekly_pulse;

  /// No description provided for @hub_summary_label.
  ///
  /// In en, this message translates to:
  /// **'Summary:'**
  String get hub_summary_label;

  /// No description provided for @hub_summary_text.
  ///
  /// In en, this message translates to:
  /// **' Consistency is up 12%\ncompared to last week. You are hitting\npeak metabolic rate between 10am-12pm.\nPlan your heavy sets there.'**
  String get hub_summary_text;

  /// No description provided for @hub_kinetic.
  ///
  /// In en, this message translates to:
  /// **'KINETIC'**
  String get hub_kinetic;

  /// No description provided for @library.
  ///
  /// In en, this message translates to:
  /// **'Library'**
  String get library;

  /// No description provided for @search_hint.
  ///
  /// In en, this message translates to:
  /// **'Search programs, coaches, or goals...'**
  String get search_hint;

  /// No description provided for @all_programs.
  ///
  /// In en, this message translates to:
  /// **'All Programs'**
  String get all_programs;

  /// No description provided for @strength.
  ///
  /// In en, this message translates to:
  /// **'Strength'**
  String get strength;

  /// No description provided for @hypertrophy.
  ///
  /// In en, this message translates to:
  /// **'Hypertrophy'**
  String get hypertrophy;

  /// No description provided for @elite_foundations.
  ///
  /// In en, this message translates to:
  /// **'ELITE FOUNDATIONS'**
  String get elite_foundations;

  /// No description provided for @get_strong.
  ///
  /// In en, this message translates to:
  /// **'Get Strong'**
  String get get_strong;

  /// No description provided for @view_all.
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get view_all;

  /// No description provided for @browse_all.
  ///
  /// In en, this message translates to:
  /// **'Browse All'**
  String get browse_all;

  /// No description provided for @frequency.
  ///
  /// In en, this message translates to:
  /// **'FREQUENCY'**
  String get frequency;

  /// No description provided for @level.
  ///
  /// In en, this message translates to:
  /// **'LEVEL'**
  String get level;

  /// No description provided for @start_program.
  ///
  /// In en, this message translates to:
  /// **'Start Program'**
  String get start_program;

  /// No description provided for @weeks.
  ///
  /// In en, this message translates to:
  /// **'WEEKS'**
  String get weeks;

  /// No description provided for @all_levels.
  ///
  /// In en, this message translates to:
  /// **'ALL LEVELS'**
  String get all_levels;

  /// No description provided for @hypertrophy_series.
  ///
  /// In en, this message translates to:
  /// **'HYPERTROPHY SERIES'**
  String get hypertrophy_series;

  /// No description provided for @build_muscle.
  ///
  /// In en, this message translates to:
  /// **'Build Muscle'**
  String get build_muscle;

  /// No description provided for @duration.
  ///
  /// In en, this message translates to:
  /// **'DURATION'**
  String get duration;

  /// No description provided for @days.
  ///
  /// In en, this message translates to:
  /// **'DAYS'**
  String get days;

  /// No description provided for @view_details.
  ///
  /// In en, this message translates to:
  /// **'View Details'**
  String get view_details;

  /// No description provided for @no_gym_needed.
  ///
  /// In en, this message translates to:
  /// **'NO GYM NEEDED'**
  String get no_gym_needed;

  /// No description provided for @train_at_home.
  ///
  /// In en, this message translates to:
  /// **'Train at Home'**
  String get train_at_home;

  /// No description provided for @editors_choice.
  ///
  /// In en, this message translates to:
  /// **'EDITOR\'S CHOICE'**
  String get editors_choice;

  /// No description provided for @explore_program.
  ///
  /// In en, this message translates to:
  /// **'Explore Program'**
  String get explore_program;

  /// No description provided for @permissions_title.
  ///
  /// In en, this message translates to:
  /// **'Permissions'**
  String get permissions_title;

  /// No description provided for @unlock_the.
  ///
  /// In en, this message translates to:
  /// **'Unlock the '**
  String get unlock_the;

  /// No description provided for @full_experience.
  ///
  /// In en, this message translates to:
  /// **'Full\nExperience'**
  String get full_experience;

  /// No description provided for @permissions_subtitle.
  ///
  /// In en, this message translates to:
  /// **'To help you reach your goals, Kinetic\nneeds a few permissions.'**
  String get permissions_subtitle;

  /// No description provided for @perm_camera.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get perm_camera;

  /// No description provided for @perm_camera_desc.
  ///
  /// In en, this message translates to:
  /// **'For real-time form analysis\nduring your lifts.'**
  String get perm_camera_desc;

  /// No description provided for @perm_health.
  ///
  /// In en, this message translates to:
  /// **'Health Data'**
  String get perm_health;

  /// No description provided for @perm_health_desc.
  ///
  /// In en, this message translates to:
  /// **'To sync your workouts and\ntrack calories burned.'**
  String get perm_health_desc;

  /// No description provided for @perm_notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get perm_notifications;

  /// No description provided for @perm_notifications_desc.
  ///
  /// In en, this message translates to:
  /// **'For rest timers and training\nreminders.'**
  String get perm_notifications_desc;

  /// No description provided for @trust_score_label.
  ///
  /// In en, this message translates to:
  /// **'TRUST SCORE'**
  String get trust_score_label;

  /// No description provided for @trust_score_value.
  ///
  /// In en, this message translates to:
  /// **'99.8%'**
  String get trust_score_value;

  /// No description provided for @allow_access.
  ///
  /// In en, this message translates to:
  /// **'Allow Access'**
  String get allow_access;

  /// No description provided for @change_in_settings.
  ///
  /// In en, this message translates to:
  /// **'YOU CAN CHANGE THESE IN SETTINGS AT ANY TIME'**
  String get change_in_settings;

  /// No description provided for @select_exercise_title.
  ///
  /// In en, this message translates to:
  /// **'Select Exercise'**
  String get select_exercise_title;

  /// No description provided for @search_exercise_hint.
  ///
  /// In en, this message translates to:
  /// **'Search exercise name or equipment...'**
  String get search_exercise_hint;

  /// No description provided for @target_area.
  ///
  /// In en, this message translates to:
  /// **'TARGET AREA'**
  String get target_area;

  /// No description provided for @form_mode_active.
  ///
  /// In en, this message translates to:
  /// **'FORM MODE ACTIVE'**
  String get form_mode_active;

  /// No description provided for @form_mode_desc_p1.
  ///
  /// In en, this message translates to:
  /// **'Select exercises with the '**
  String get form_mode_desc_p1;

  /// No description provided for @ai_analysis_badge.
  ///
  /// In en, this message translates to:
  /// **'AI Analysis'**
  String get ai_analysis_badge;

  /// No description provided for @form_mode_desc_p2.
  ///
  /// In en, this message translates to:
  /// **' badge for real-time posture correction.'**
  String get form_mode_desc_p2;

  /// No description provided for @most_popular.
  ///
  /// In en, this message translates to:
  /// **'Most Popular'**
  String get most_popular;

  /// No description provided for @ex_detail_header.
  ///
  /// In en, this message translates to:
  /// **'Exercise Detail'**
  String get ex_detail_header;

  /// No description provided for @current_movement.
  ///
  /// In en, this message translates to:
  /// **'CURRENT MOVEMENT'**
  String get current_movement;

  /// No description provided for @core_cues.
  ///
  /// In en, this message translates to:
  /// **'CORE CUES'**
  String get core_cues;

  /// No description provided for @points_of_focus.
  ///
  /// In en, this message translates to:
  /// **'4 Points of Focus'**
  String get points_of_focus;

  /// No description provided for @setup_guide.
  ///
  /// In en, this message translates to:
  /// **'SETUP GUIDE'**
  String get setup_guide;

  /// No description provided for @setup_step1_title.
  ///
  /// In en, this message translates to:
  /// **'Bar Placement'**
  String get setup_step1_title;

  /// No description provided for @setup_step1_desc.
  ///
  /// In en, this message translates to:
  /// **'Position the bar across your upper traps. Squeeze shoulder blades to create a muscular shelf.'**
  String get setup_step1_desc;

  /// No description provided for @setup_step2_title.
  ///
  /// In en, this message translates to:
  /// **'Stance Width'**
  String get setup_step2_title;

  /// No description provided for @setup_step2_desc.
  ///
  /// In en, this message translates to:
  /// **'Set foot shoulder-width apart, toes slightly pointed out (15-30 degrees).'**
  String get setup_step2_desc;

  /// No description provided for @setup_step3_title.
  ///
  /// In en, this message translates to:
  /// **'The Unrack'**
  String get setup_step3_title;

  /// No description provided for @setup_step3_desc.
  ///
  /// In en, this message translates to:
  /// **'Step back with two solid steps. Settle into your final stance and inhale deeply.'**
  String get setup_step3_desc;

  /// No description provided for @common_mistakes_title.
  ///
  /// In en, this message translates to:
  /// **'COMMON MISTAKES'**
  String get common_mistakes_title;

  /// No description provided for @mistake1_title.
  ///
  /// In en, this message translates to:
  /// **'Hips and knees move together'**
  String get mistake1_title;

  /// No description provided for @mistake1_desc.
  ///
  /// In en, this message translates to:
  /// **'Simultaneous descent ensures balance and maximum quad engagement.'**
  String get mistake1_desc;

  /// No description provided for @mistake2_title.
  ///
  /// In en, this message translates to:
  /// **'Knees caving inward (Valgus)'**
  String get mistake2_title;

  /// No description provided for @mistake2_desc.
  ///
  /// In en, this message translates to:
  /// **'Excessive inward pressure puts stress on the ACL. Push knees out.'**
  String get mistake2_desc;

  /// No description provided for @mistake3_title.
  ///
  /// In en, this message translates to:
  /// **'Rounding the lower back'**
  String get mistake3_title;

  /// No description provided for @mistake3_desc.
  ///
  /// In en, this message translates to:
  /// **'Keep a neutral spine throughout the entire range of motion.'**
  String get mistake3_desc;

  /// No description provided for @pro_insight.
  ///
  /// In en, this message translates to:
  /// **'PRO INSIGHT'**
  String get pro_insight;

  /// No description provided for @pro_insight_title.
  ///
  /// In en, this message translates to:
  /// **'The Valsalva Maneuver'**
  String get pro_insight_title;

  /// No description provided for @pro_insight_desc.
  ///
  /// In en, this message translates to:
  /// **'Inhale at the top and hold your breath to create intra-abdominal pressure. This stabilizes your spine better than any belt ever could. Exhale only once you clear the sticking point on the way up.'**
  String get pro_insight_desc;

  /// No description provided for @start_ai_analysis.
  ///
  /// In en, this message translates to:
  /// **'Start AI Analysis'**
  String get start_ai_analysis;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @muscles.
  ///
  /// In en, this message translates to:
  /// **'Targeted Muscles'**
  String get muscles;

  /// No description provided for @tags.
  ///
  /// In en, this message translates to:
  /// **'Tags'**
  String get tags;

  /// No description provided for @exercise.
  ///
  /// In en, this message translates to:
  /// **'Exercise'**
  String get exercise;

  /// No description provided for @cue1_title.
  ///
  /// In en, this message translates to:
  /// **'Drive Heels'**
  String get cue1_title;

  /// No description provided for @cue1_desc.
  ///
  /// In en, this message translates to:
  /// **'Weight mid-foot to heel.'**
  String get cue1_desc;

  /// No description provided for @cue2_title.
  ///
  /// In en, this message translates to:
  /// **'Chest Up'**
  String get cue2_title;

  /// No description provided for @cue2_desc.
  ///
  /// In en, this message translates to:
  /// **'Keep torso proud and tall.'**
  String get cue2_desc;

  /// No description provided for @cue3_title.
  ///
  /// In en, this message translates to:
  /// **'Brace Core'**
  String get cue3_title;

  /// No description provided for @cue3_desc.
  ///
  /// In en, this message translates to:
  /// **'Fill belly with air, tighten.'**
  String get cue3_desc;

  /// No description provided for @cue4_title.
  ///
  /// In en, this message translates to:
  /// **'Knees Out'**
  String get cue4_title;

  /// No description provided for @cue4_desc.
  ///
  /// In en, this message translates to:
  /// **'Track over second toe.'**
  String get cue4_desc;

  /// No description provided for @common_mistakes.
  ///
  /// In en, this message translates to:
  /// **'COMMON MISTAKES'**
  String get common_mistakes;

  /// No description provided for @form_analysis_title.
  ///
  /// In en, this message translates to:
  /// **'FORM ANALYSIS'**
  String get form_analysis_title;

  /// No description provided for @live.
  ///
  /// In en, this message translates to:
  /// **'LIVE'**
  String get live;

  /// No description provided for @depth_label.
  ///
  /// In en, this message translates to:
  /// **'DEPTH'**
  String get depth_label;

  /// No description provided for @rep_count_label.
  ///
  /// In en, this message translates to:
  /// **'REP COUNT'**
  String get rep_count_label;

  /// No description provided for @rep_value.
  ///
  /// In en, this message translates to:
  /// **'REP '**
  String get rep_value;

  /// No description provided for @skeleton_toggle.
  ///
  /// In en, this message translates to:
  /// **'SKELETON'**
  String get skeleton_toggle;

  /// No description provided for @bar_path_toggle.
  ///
  /// In en, this message translates to:
  /// **'BAR PATH'**
  String get bar_path_toggle;

  /// No description provided for @flash_toggle.
  ///
  /// In en, this message translates to:
  /// **'FLASH'**
  String get flash_toggle;

  /// No description provided for @analyzing_processing.
  ///
  /// In en, this message translates to:
  /// **'PROCESSING'**
  String get analyzing_processing;

  /// No description provided for @analyzing_title.
  ///
  /// In en, this message translates to:
  /// **'Analyzing Your Form...'**
  String get analyzing_title;

  /// No description provided for @analyzing_uploaded.
  ///
  /// In en, this message translates to:
  /// **'UPLOADED'**
  String get analyzing_uploaded;

  /// No description provided for @analyzing_pro_insights.
  ///
  /// In en, this message translates to:
  /// **'Pro Insights'**
  String get analyzing_pro_insights;

  /// No description provided for @analyzing_form_focus.
  ///
  /// In en, this message translates to:
  /// **'FORM FOCUS'**
  String get analyzing_form_focus;

  /// No description provided for @analyzing_wait_time.
  ///
  /// In en, this message translates to:
  /// **'WAIT TIME'**
  String get analyzing_wait_time;

  /// No description provided for @analyzing_seconds.
  ///
  /// In en, this message translates to:
  /// **'Seconds'**
  String get analyzing_seconds;

  /// No description provided for @analyzing_did_you_know.
  ///
  /// In en, this message translates to:
  /// **'DID YOU KNOW?'**
  String get analyzing_did_you_know;

  /// No description provided for @analyzing_form_checks_fact.
  ///
  /// In en, this message translates to:
  /// **'Form checks reduce injury by 40%'**
  String get analyzing_form_checks_fact;

  /// No description provided for @exercise_label.
  ///
  /// In en, this message translates to:
  /// **'EXERCISE'**
  String get exercise_label;

  /// No description provided for @great_form.
  ///
  /// In en, this message translates to:
  /// **'GREAT FORM'**
  String get great_form;

  /// No description provided for @metric_depth.
  ///
  /// In en, this message translates to:
  /// **'DEPTH'**
  String get metric_depth;

  /// No description provided for @metric_bar_path.
  ///
  /// In en, this message translates to:
  /// **'BAR PATH'**
  String get metric_bar_path;

  /// No description provided for @metric_back_angle.
  ///
  /// In en, this message translates to:
  /// **'BACK ANGLE'**
  String get metric_back_angle;

  /// No description provided for @ai_technique_cues.
  ///
  /// In en, this message translates to:
  /// **'AI Technique Cues'**
  String get ai_technique_cues;

  /// No description provided for @coach_tip_label.
  ///
  /// In en, this message translates to:
  /// **'COACH TIP'**
  String get coach_tip_label;

  /// No description provided for @re_record_set.
  ///
  /// In en, this message translates to:
  /// **'Re-record Set'**
  String get re_record_set;

  /// No description provided for @barbell_squat.
  ///
  /// In en, this message translates to:
  /// **'Barbell Squat'**
  String get barbell_squat;

  /// No description provided for @peak_technique.
  ///
  /// In en, this message translates to:
  /// **'Peak Technique'**
  String get peak_technique;

  /// No description provided for @top_5_percent.
  ///
  /// In en, this message translates to:
  /// **'Top 5% for this weight class'**
  String get top_5_percent;

  /// No description provided for @parallel_102.
  ///
  /// In en, this message translates to:
  /// **'Parallel (102°)'**
  String get parallel_102;

  /// No description provided for @stable_linear.
  ///
  /// In en, this message translates to:
  /// **'Stable & Linear'**
  String get stable_linear;

  /// No description provided for @slightly_forward.
  ///
  /// In en, this message translates to:
  /// **'Slightly Forward'**
  String get slightly_forward;

  /// No description provided for @ai_cue_1.
  ///
  /// In en, this message translates to:
  /// **'Drive from your heels more on the ascent.'**
  String get ai_cue_1;

  /// No description provided for @ai_cue_2.
  ///
  /// In en, this message translates to:
  /// **'Maintain a more upright torso to reduce lower back strain.'**
  String get ai_cue_2;

  /// No description provided for @coach_marcus.
  ///
  /// In en, this message translates to:
  /// **'Marcus'**
  String get coach_marcus;

  /// No description provided for @coach_tip_text.
  ///
  /// In en, this message translates to:
  /// **'Your eccentric control is excellent. Focus on explosive power on the way up!'**
  String get coach_tip_text;

  /// No description provided for @editorial_analysis.
  ///
  /// In en, this message translates to:
  /// **'EDITORIAL ANALYSIS'**
  String get editorial_analysis;

  /// No description provided for @weekly_technique_summary.
  ///
  /// In en, this message translates to:
  /// **'Weekly Technique Summary'**
  String get weekly_technique_summary;

  /// No description provided for @global_rank.
  ///
  /// In en, this message translates to:
  /// **'GLOBAL RANK'**
  String get global_rank;

  /// No description provided for @chronological_checks.
  ///
  /// In en, this message translates to:
  /// **'CHRONOLOGICAL CHECKS'**
  String get chronological_checks;

  /// No description provided for @filter_all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get filter_all;

  /// No description provided for @filter_squat.
  ///
  /// In en, this message translates to:
  /// **'Squat'**
  String get filter_squat;

  /// No description provided for @filter_deadlift.
  ///
  /// In en, this message translates to:
  /// **'Deadlift'**
  String get filter_deadlift;

  /// No description provided for @filter_bench_press.
  ///
  /// In en, this message translates to:
  /// **'Bench Press'**
  String get filter_bench_press;

  /// No description provided for @status_elite.
  ///
  /// In en, this message translates to:
  /// **'ELITE\nSTATUS'**
  String get status_elite;

  /// No description provided for @status_good.
  ///
  /// In en, this message translates to:
  /// **'GOOD'**
  String get status_good;

  /// No description provided for @status_needs_work.
  ///
  /// In en, this message translates to:
  /// **'NEEDS WORK'**
  String get status_needs_work;

  /// No description provided for @sets_analyzed.
  ///
  /// In en, this message translates to:
  /// **'SETS ANALYZED'**
  String get sets_analyzed;

  /// No description provided for @date_oct.
  ///
  /// In en, this message translates to:
  /// **'OCT'**
  String get date_oct;

  /// No description provided for @score_format.
  ///
  /// In en, this message translates to:
  /// **'{score}%'**
  String score_format(Object score);

  /// No description provided for @sets_analyzed_format.
  ///
  /// In en, this message translates to:
  /// **'{date} • {count} Sets Analyzed'**
  String sets_analyzed_format(Object count, Object date);

  /// No description provided for @bicep_curls.
  ///
  /// In en, this message translates to:
  /// **'Bicep Curls'**
  String get bicep_curls;

  /// No description provided for @finish_btn.
  ///
  /// In en, this message translates to:
  /// **'FINISH'**
  String get finish_btn;

  /// No description provided for @reps_completed.
  ///
  /// In en, this message translates to:
  /// **'REPS COMPLETED'**
  String get reps_completed;

  /// No description provided for @set_label.
  ///
  /// In en, this message translates to:
  /// **'SET'**
  String get set_label;

  /// No description provided for @rest_label.
  ///
  /// In en, this message translates to:
  /// **'REST'**
  String get rest_label;

  /// No description provided for @kg_unit.
  ///
  /// In en, this message translates to:
  /// **'KG'**
  String get kg_unit;

  /// No description provided for @add_reps.
  ///
  /// In en, this message translates to:
  /// **'REPS'**
  String get add_reps;

  /// No description provided for @set_complete_btn.
  ///
  /// In en, this message translates to:
  /// **'SET COMPLETE'**
  String get set_complete_btn;

  /// No description provided for @workout_tab.
  ///
  /// In en, this message translates to:
  /// **'WORKOUT'**
  String get workout_tab;

  /// No description provided for @log_tab.
  ///
  /// In en, this message translates to:
  /// **'LOG'**
  String get log_tab;

  /// No description provided for @timer_tab.
  ///
  /// In en, this message translates to:
  /// **'TIMER'**
  String get timer_tab;

  /// No description provided for @music_tab.
  ///
  /// In en, this message translates to:
  /// **'MUSIC'**
  String get music_tab;

  /// No description provided for @form_check_title.
  ///
  /// In en, this message translates to:
  /// **'Form Check'**
  String get form_check_title;

  /// No description provided for @kntk_label.
  ///
  /// In en, this message translates to:
  /// **'KNTK'**
  String get kntk_label;

  /// No description provided for @drag_drop_upload.
  ///
  /// In en, this message translates to:
  /// **'Drag and drop or tap to upload'**
  String get drag_drop_upload;

  /// No description provided for @upload_subtext.
  ///
  /// In en, this message translates to:
  /// **'(MP4, MOV up to 250MB)'**
  String get upload_subtext;

  /// No description provided for @select_video_btn.
  ///
  /// In en, this message translates to:
  /// **'Select Video'**
  String get select_video_btn;

  /// No description provided for @squat_high_bar.
  ///
  /// In en, this message translates to:
  /// **'Squat (High Bar)'**
  String get squat_high_bar;

  /// No description provided for @intensity_rpe_label.
  ///
  /// In en, this message translates to:
  /// **'INTENSITY (RPE)'**
  String get intensity_rpe_label;

  /// No description provided for @coach_notes_label.
  ///
  /// In en, this message translates to:
  /// **'COACH NOTES'**
  String get coach_notes_label;

  /// No description provided for @coach_notes_hint.
  ///
  /// In en, this message translates to:
  /// **'Felt a pinch in my lower back at the bottom of the rep. Should I narrow my stance?'**
  String get coach_notes_hint;

  /// No description provided for @filming_tips_label.
  ///
  /// In en, this message translates to:
  /// **'Filming Tips'**
  String get filming_tips_label;

  /// No description provided for @level_label.
  ///
  /// In en, this message translates to:
  /// **'LEVEL'**
  String get level_label;

  /// No description provided for @eye_level.
  ///
  /// In en, this message translates to:
  /// **'Eye Level'**
  String get eye_level;

  /// No description provided for @angle_label.
  ///
  /// In en, this message translates to:
  /// **'ANGLE'**
  String get angle_label;

  /// No description provided for @angle_45_profile.
  ///
  /// In en, this message translates to:
  /// **'45° Profile'**
  String get angle_45_profile;

  /// No description provided for @submit_review_btn.
  ///
  /// In en, this message translates to:
  /// **'Submit for Review'**
  String get submit_review_btn;

  /// No description provided for @review_disclaimer.
  ///
  /// In en, this message translates to:
  /// **'A certified coach will review your form within 24 hours.'**
  String get review_disclaimer;

  /// No description provided for @training_calendar_title.
  ///
  /// In en, this message translates to:
  /// **'TRAINING CALENDAR'**
  String get training_calendar_title;

  /// No description provided for @current_streak.
  ///
  /// In en, this message translates to:
  /// **'CURRENT STREAK'**
  String get current_streak;

  /// No description provided for @todays_session.
  ///
  /// In en, this message translates to:
  /// **'TODAY\'S SESSION'**
  String get todays_session;

  /// No description provided for @start_time.
  ///
  /// In en, this message translates to:
  /// **'START TIME'**
  String get start_time;

  /// No description provided for @volume.
  ///
  /// In en, this message translates to:
  /// **'VOLUME'**
  String get volume;

  /// No description provided for @avg_hr.
  ///
  /// In en, this message translates to:
  /// **'AVG HR'**
  String get avg_hr;

  /// No description provided for @monthly_performance.
  ///
  /// In en, this message translates to:
  /// **'MONTHLY PERFORMANCE'**
  String get monthly_performance;

  /// No description provided for @total_workouts.
  ///
  /// In en, this message translates to:
  /// **'TOTAL WORKOUTS'**
  String get total_workouts;

  /// No description provided for @total_time.
  ///
  /// In en, this message translates to:
  /// **'TOTAL TIME'**
  String get total_time;

  /// No description provided for @cumulative_volume.
  ///
  /// In en, this message translates to:
  /// **'CUMULATIVE VOLUME'**
  String get cumulative_volume;

  /// No description provided for @tons.
  ///
  /// In en, this message translates to:
  /// **'tons'**
  String get tons;

  /// No description provided for @min.
  ///
  /// In en, this message translates to:
  /// **'MIN'**
  String get min;

  /// No description provided for @hours_unit.
  ///
  /// In en, this message translates to:
  /// **'H'**
  String get hours_unit;

  /// No description provided for @bpm.
  ///
  /// In en, this message translates to:
  /// **'BPM'**
  String get bpm;

  /// No description provided for @mon.
  ///
  /// In en, this message translates to:
  /// **'MON'**
  String get mon;

  /// No description provided for @tue.
  ///
  /// In en, this message translates to:
  /// **'TUE'**
  String get tue;

  /// No description provided for @wed.
  ///
  /// In en, this message translates to:
  /// **'WED'**
  String get wed;

  /// No description provided for @thu.
  ///
  /// In en, this message translates to:
  /// **'THU'**
  String get thu;

  /// No description provided for @fri.
  ///
  /// In en, this message translates to:
  /// **'FRI'**
  String get fri;

  /// No description provided for @sat.
  ///
  /// In en, this message translates to:
  /// **'SAT'**
  String get sat;

  /// No description provided for @sun.
  ///
  /// In en, this message translates to:
  /// **'SUN'**
  String get sun;

  /// No description provided for @tag_hypertrophy.
  ///
  /// In en, this message translates to:
  /// **'HYPERTROPHY'**
  String get tag_hypertrophy;

  /// No description provided for @tag_lower_body.
  ///
  /// In en, this message translates to:
  /// **'LOWER BODY'**
  String get tag_lower_body;

  /// No description provided for @squat_progress.
  ///
  /// In en, this message translates to:
  /// **'Squat Progress'**
  String get squat_progress;

  /// No description provided for @estimated_1rm.
  ///
  /// In en, this message translates to:
  /// **'ESTIMATED 1RM'**
  String get estimated_1rm;

  /// No description provided for @total_volume_3mo.
  ///
  /// In en, this message translates to:
  /// **'Total Volume (3mo)'**
  String get total_volume_3mo;

  /// No description provided for @best_weight.
  ///
  /// In en, this message translates to:
  /// **'BEST WEIGHT'**
  String get best_weight;

  /// No description provided for @best_volume.
  ///
  /// In en, this message translates to:
  /// **'BEST VOLUME'**
  String get best_volume;

  /// No description provided for @best_sets.
  ///
  /// In en, this message translates to:
  /// **'BEST SETS'**
  String get best_sets;

  /// No description provided for @workout_history.
  ///
  /// In en, this message translates to:
  /// **'Workout History'**
  String get workout_history;

  /// No description provided for @new_pr.
  ///
  /// In en, this message translates to:
  /// **'NEW PR'**
  String get new_pr;

  /// No description provided for @set_col.
  ///
  /// In en, this message translates to:
  /// **'SET'**
  String get set_col;

  /// No description provided for @weight_col.
  ///
  /// In en, this message translates to:
  /// **'WEIGHT'**
  String get weight_col;

  /// No description provided for @reps_col.
  ///
  /// In en, this message translates to:
  /// **'REPS'**
  String get reps_col;

  /// No description provided for @rpe_col.
  ///
  /// In en, this message translates to:
  /// **'RPE'**
  String get rpe_col;

  /// No description provided for @reps_unit.
  ///
  /// In en, this message translates to:
  /// **'reps'**
  String get reps_unit;

  /// No description provided for @single_session.
  ///
  /// In en, this message translates to:
  /// **'Single session'**
  String get single_session;

  /// No description provided for @at_weight.
  ///
  /// In en, this message translates to:
  /// **'At'**
  String get at_weight;

  /// No description provided for @workoutHistory.
  ///
  /// In en, this message translates to:
  /// **'Workout History'**
  String get workoutHistory;

  /// No description provided for @trainingStreak.
  ///
  /// In en, this message translates to:
  /// **'TRAINING STREAK'**
  String get trainingStreak;

  /// No description provided for @workoutsThisMonth.
  ///
  /// In en, this message translates to:
  /// **'WORKOUTS THIS MONTH'**
  String get workoutsThisMonth;

  /// No description provided for @totalTime.
  ///
  /// In en, this message translates to:
  /// **'TOTAL TIME'**
  String get totalTime;

  /// No description provided for @thisWeek.
  ///
  /// In en, this message translates to:
  /// **'This Week'**
  String get thisWeek;

  /// No description provided for @lastWeek.
  ///
  /// In en, this message translates to:
  /// **'Last Week'**
  String get lastWeek;

  /// No description provided for @sessions.
  ///
  /// In en, this message translates to:
  /// **'SESSIONS'**
  String get sessions;

  /// No description provided for @pro.
  ///
  /// In en, this message translates to:
  /// **'PRO'**
  String get pro;

  /// No description provided for @sets.
  ///
  /// In en, this message translates to:
  /// **'SETS'**
  String get sets;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'TODAY'**
  String get today;

  /// No description provided for @h.
  ///
  /// In en, this message translates to:
  /// **'h'**
  String get h;

  /// No description provided for @m.
  ///
  /// In en, this message translates to:
  /// **'m'**
  String get m;

  /// No description provided for @statistics.
  ///
  /// In en, this message translates to:
  /// **'Statistics'**
  String get statistics;

  /// No description provided for @training.
  ///
  /// In en, this message translates to:
  /// **'Training'**
  String get training;

  /// No description provided for @body.
  ///
  /// In en, this message translates to:
  /// **'Body'**
  String get body;

  /// No description provided for @totalVolume.
  ///
  /// In en, this message translates to:
  /// **'TOTAL VOLUME'**
  String get totalVolume;

  /// No description provided for @increaseFromLastMonth.
  ///
  /// In en, this message translates to:
  /// **'increase from last month'**
  String get increaseFromLastMonth;

  /// No description provided for @totalWorkouts.
  ///
  /// In en, this message translates to:
  /// **'TOTAL WORKOUTS'**
  String get totalWorkouts;

  /// No description provided for @totalReps.
  ///
  /// In en, this message translates to:
  /// **'TOTAL REPS'**
  String get totalReps;

  /// No description provided for @trainingVolume.
  ///
  /// In en, this message translates to:
  /// **'Training Volume'**
  String get trainingVolume;

  /// No description provided for @weeks12.
  ///
  /// In en, this message translates to:
  /// **'12 WEEKS'**
  String get weeks12;

  /// No description provided for @workoutFrequency.
  ///
  /// In en, this message translates to:
  /// **'Workout Frequency'**
  String get workoutFrequency;

  /// No description provided for @avgPerWeek.
  ///
  /// In en, this message translates to:
  /// **'avg / week'**
  String get avgPerWeek;

  /// No description provided for @onTrack.
  ///
  /// In en, this message translates to:
  /// **'On Track'**
  String get onTrack;

  /// No description provided for @muscleGroupSplit.
  ///
  /// In en, this message translates to:
  /// **'Muscle Group Split'**
  String get muscleGroupSplit;

  /// No description provided for @chest.
  ///
  /// In en, this message translates to:
  /// **'Chest'**
  String get chest;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'BACK'**
  String get back;

  /// No description provided for @arms.
  ///
  /// In en, this message translates to:
  /// **'Arms'**
  String get arms;

  /// No description provided for @oct24.
  ///
  /// In en, this message translates to:
  /// **'OCT 24'**
  String get oct24;

  /// No description provided for @nov24.
  ///
  /// In en, this message translates to:
  /// **'NOV 24'**
  String get nov24;

  /// No description provided for @dec24.
  ///
  /// In en, this message translates to:
  /// **'DEC 24'**
  String get dec24;

  /// No description provided for @compareProgress.
  ///
  /// In en, this message translates to:
  /// **'Compare Progress'**
  String get compareProgress;

  /// No description provided for @visualJourney.
  ///
  /// In en, this message translates to:
  /// **'VISUAL JOURNEY'**
  String get visualJourney;

  /// No description provided for @theEvolution.
  ///
  /// In en, this message translates to:
  /// **'THE EVOLUTION'**
  String get theEvolution;

  /// No description provided for @before.
  ///
  /// In en, this message translates to:
  /// **'BEFORE'**
  String get before;

  /// No description provided for @after.
  ///
  /// In en, this message translates to:
  /// **'AFTER'**
  String get after;

  /// No description provided for @lbs.
  ///
  /// In en, this message translates to:
  /// **'LBS'**
  String get lbs;

  /// No description provided for @totalWeightLoss.
  ///
  /// In en, this message translates to:
  /// **'TOTAL WEIGHT LOSS'**
  String get totalWeightLoss;

  /// No description provided for @bodyFatChange.
  ///
  /// In en, this message translates to:
  /// **'BODY FAT CHANGE'**
  String get bodyFatChange;

  /// No description provided for @consistencyScore.
  ///
  /// In en, this message translates to:
  /// **'CONSISTENCY SCORE'**
  String get consistencyScore;

  /// No description provided for @saveTransformation.
  ///
  /// In en, this message translates to:
  /// **'Save Transformation'**
  String get saveTransformation;

  /// No description provided for @shareCollage.
  ///
  /// In en, this message translates to:
  /// **'Share Collage'**
  String get shareCollage;

  /// No description provided for @photoLog.
  ///
  /// In en, this message translates to:
  /// **'PHOTO LOG'**
  String get photoLog;

  /// No description provided for @captureProgress.
  ///
  /// In en, this message translates to:
  /// **'Capture Progress'**
  String get captureProgress;

  /// No description provided for @frontSideBack.
  ///
  /// In en, this message translates to:
  /// **'Front, side, or back view'**
  String get frontSideBack;

  /// No description provided for @logDate.
  ///
  /// In en, this message translates to:
  /// **'LOG DATE'**
  String get logDate;

  /// No description provided for @todayOct24.
  ///
  /// In en, this message translates to:
  /// **'Today, Oct 24'**
  String get todayOct24;

  /// No description provided for @currentWeight.
  ///
  /// In en, this message translates to:
  /// **'CURRENT WEIGHT'**
  String get currentWeight;

  /// No description provided for @addWeightLbs.
  ///
  /// In en, this message translates to:
  /// **'Add weight (lbs)'**
  String get addWeightLbs;

  /// No description provided for @trainingNotes.
  ///
  /// In en, this message translates to:
  /// **'TRAINING NOTES'**
  String get trainingNotes;

  /// No description provided for @howAreYouFeeling.
  ///
  /// In en, this message translates to:
  /// **'How are you feeling today?'**
  String get howAreYouFeeling;

  /// No description provided for @recentHistory.
  ///
  /// In en, this message translates to:
  /// **'Recent History'**
  String get recentHistory;

  /// No description provided for @savePhoto.
  ///
  /// In en, this message translates to:
  /// **'Save Photo'**
  String get savePhoto;

  /// No description provided for @viewAll.
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get viewAll;

  /// No description provided for @logOutTitle.
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get logOutTitle;

  /// No description provided for @logOutConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to log out?\nYour workout data is synced and safe.'**
  String get logOutConfirmation;

  /// No description provided for @measurements.
  ///
  /// In en, this message translates to:
  /// **'Measurements'**
  String get measurements;

  /// No description provided for @current_weight.
  ///
  /// In en, this message translates to:
  /// **'CURRENT WEIGHT'**
  String get current_weight;

  /// No description provided for @since_last_entry.
  ///
  /// In en, this message translates to:
  /// **'since last entry'**
  String get since_last_entry;

  /// No description provided for @body_fat.
  ///
  /// In en, this message translates to:
  /// **'BODY FAT %'**
  String get body_fat;

  /// No description provided for @weight_trend.
  ///
  /// In en, this message translates to:
  /// **'Weight Trend'**
  String get weight_trend;

  /// No description provided for @past_30_days.
  ///
  /// In en, this message translates to:
  /// **'Past 30 Days'**
  String get past_30_days;

  /// No description provided for @view_full_chart.
  ///
  /// In en, this message translates to:
  /// **'VIEW FULL CHART'**
  String get view_full_chart;

  /// No description provided for @categories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categories;

  /// No description provided for @weight.
  ///
  /// In en, this message translates to:
  /// **'Weight'**
  String get weight;

  /// No description provided for @waist.
  ///
  /// In en, this message translates to:
  /// **'Waist'**
  String get waist;

  /// No description provided for @stay_consistent.
  ///
  /// In en, this message translates to:
  /// **'Stay Consistent'**
  String get stay_consistent;

  /// No description provided for @consistency_msg.
  ///
  /// In en, this message translates to:
  /// **'Users who log measurements weekly are 3x more likely to hit their target body composition.'**
  String get consistency_msg;

  /// No description provided for @yesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get yesterday;

  /// No description provided for @sinceLastEntry.
  ///
  /// In en, this message translates to:
  /// **'since last entry'**
  String get sinceLastEntry;

  /// No description provided for @bodyFat.
  ///
  /// In en, this message translates to:
  /// **'BODY FAT %'**
  String get bodyFat;

  /// No description provided for @weightTrend.
  ///
  /// In en, this message translates to:
  /// **'Weight Trend'**
  String get weightTrend;

  /// No description provided for @past30Days.
  ///
  /// In en, this message translates to:
  /// **'Past 30 Days'**
  String get past30Days;

  /// No description provided for @viewFullChart.
  ///
  /// In en, this message translates to:
  /// **'VIEW FULL CHART'**
  String get viewFullChart;

  /// No description provided for @stayConsistent.
  ///
  /// In en, this message translates to:
  /// **'Stay Consistent'**
  String get stayConsistent;

  /// No description provided for @consistencyMsg.
  ///
  /// In en, this message translates to:
  /// **'Users who log measurements weekly are 3x more likely to hit their target body composition.'**
  String get consistencyMsg;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @logMeasurement.
  ///
  /// In en, this message translates to:
  /// **'Log Measurement'**
  String get logMeasurement;

  /// No description provided for @metricType.
  ///
  /// In en, this message translates to:
  /// **'METRIC TYPE'**
  String get metricType;

  /// No description provided for @bodyWeight.
  ///
  /// In en, this message translates to:
  /// **'Body Weight'**
  String get bodyWeight;

  /// No description provided for @lastLog.
  ///
  /// In en, this message translates to:
  /// **'LAST LOG'**
  String get lastLog;

  /// No description provided for @sevenDayTrend.
  ///
  /// In en, this message translates to:
  /// **'7-DAY TREND'**
  String get sevenDayTrend;

  /// No description provided for @steadyProgress.
  ///
  /// In en, this message translates to:
  /// **'Steady progress'**
  String get steadyProgress;

  /// No description provided for @contextBtn.
  ///
  /// In en, this message translates to:
  /// **'CONTEXT'**
  String get contextBtn;

  /// No description provided for @optionalNotes.
  ///
  /// In en, this message translates to:
  /// **'OPTIONAL NOTES'**
  String get optionalNotes;

  /// No description provided for @notesHint.
  ///
  /// In en, this message translates to:
  /// **'How are you feeling? Add context about your hydration, time of day, etc.'**
  String get notesHint;

  /// No description provided for @personalRecords.
  ///
  /// In en, this message translates to:
  /// **'Personal Records'**
  String get personalRecords;

  /// No description provided for @chestAndTriceps.
  ///
  /// In en, this message translates to:
  /// **'CHEST & TRICEPS'**
  String get chestAndTriceps;

  /// No description provided for @benchPress.
  ///
  /// In en, this message translates to:
  /// **'Bench Press'**
  String get benchPress;

  /// No description provided for @est1RM.
  ///
  /// In en, this message translates to:
  /// **'EST. 1RM'**
  String get est1RM;

  /// No description provided for @currentPeakPerformance.
  ///
  /// In en, this message translates to:
  /// **'CURRENT PEAK PERFORMANCE'**
  String get currentPeakPerformance;

  /// No description provided for @reps.
  ///
  /// In en, this message translates to:
  /// **'REPS'**
  String get reps;

  /// No description provided for @top5Percent.
  ///
  /// In en, this message translates to:
  /// **'Top 5% of your age group'**
  String get top5Percent;

  /// No description provided for @maxWeight.
  ///
  /// In en, this message translates to:
  /// **'MAX WEIGHT'**
  String get maxWeight;

  /// No description provided for @bestVolume.
  ///
  /// In en, this message translates to:
  /// **'BEST VOLUME'**
  String get bestVolume;

  /// No description provided for @setOn.
  ///
  /// In en, this message translates to:
  /// **'Set on'**
  String get setOn;

  /// No description provided for @oneRMProgression.
  ///
  /// In en, this message translates to:
  /// **'1RM Progression'**
  String get oneRMProgression;

  /// No description provided for @sixMonths.
  ///
  /// In en, this message translates to:
  /// **'6M'**
  String get sixMonths;

  /// No description provided for @oneYear.
  ///
  /// In en, this message translates to:
  /// **'1Y'**
  String get oneYear;

  /// No description provided for @milestoneHistory.
  ///
  /// In en, this message translates to:
  /// **'Milestone History'**
  String get milestoneHistory;

  /// No description provided for @newPR.
  ///
  /// In en, this message translates to:
  /// **'NEW PR'**
  String get newPR;

  /// No description provided for @volumePR.
  ///
  /// In en, this message translates to:
  /// **'VOLUME PR'**
  String get volumePR;

  /// No description provided for @maxPR.
  ///
  /// In en, this message translates to:
  /// **'MAX PR'**
  String get maxPR;

  /// No description provided for @vsPrevious.
  ///
  /// In en, this message translates to:
  /// **'vs previous'**
  String get vsPrevious;

  /// No description provided for @reviewTitle.
  ///
  /// In en, this message translates to:
  /// **'2024 REVIEW'**
  String get reviewTitle;

  /// No description provided for @eliteAchievements.
  ///
  /// In en, this message translates to:
  /// **'ELITE ACHIEVEMENTS'**
  String get eliteAchievements;

  /// No description provided for @yearInReviewTitle.
  ///
  /// In en, this message translates to:
  /// **'2024 Year in\nReview'**
  String get yearInReviewTitle;

  /// No description provided for @topLiftersBadge.
  ///
  /// In en, this message translates to:
  /// **'You are in the top 5% of lifters'**
  String get topLiftersBadge;

  /// No description provided for @workouts.
  ///
  /// In en, this message translates to:
  /// **'WORKOUTS'**
  String get workouts;

  /// No description provided for @kgLifted.
  ///
  /// In en, this message translates to:
  /// **'KG LIFTED'**
  String get kgLifted;

  /// No description provided for @hoursTrained.
  ///
  /// In en, this message translates to:
  /// **'HOURS TRAINED'**
  String get hoursTrained;

  /// No description provided for @consistency.
  ///
  /// In en, this message translates to:
  /// **'CONSISTENCY'**
  String get consistency;

  /// No description provided for @dailyStreak.
  ///
  /// In en, this message translates to:
  /// **'DAILY STREAK:'**
  String get dailyStreak;

  /// No description provided for @mostImproved.
  ///
  /// In en, this message translates to:
  /// **'MOST IMPROVED'**
  String get mostImproved;

  /// No description provided for @personalBest.
  ///
  /// In en, this message translates to:
  /// **'PERSONAL BEST'**
  String get personalBest;

  /// No description provided for @topLifts.
  ///
  /// In en, this message translates to:
  /// **'TOP LIFTS'**
  String get topLifts;

  /// No description provided for @shareMyYear.
  ///
  /// In en, this message translates to:
  /// **'SHARE MY YEAR'**
  String get shareMyYear;

  /// No description provided for @generatedOn.
  ///
  /// In en, this message translates to:
  /// **'GENERATED ON DEC 31, 2024'**
  String get generatedOn;

  /// No description provided for @jan.
  ///
  /// In en, this message translates to:
  /// **'JAN 2024'**
  String get jan;

  /// No description provided for @dec.
  ///
  /// In en, this message translates to:
  /// **'DEC 2024'**
  String get dec;

  /// No description provided for @exerciseDetailTitle.
  ///
  /// In en, this message translates to:
  /// **'Exercise Detail'**
  String get exerciseDetailTitle;

  /// No description provided for @strengthTraining.
  ///
  /// In en, this message translates to:
  /// **'STRENGTH TRAINING'**
  String get strengthTraining;

  /// No description provided for @exerciseVideo.
  ///
  /// In en, this message translates to:
  /// **'EXERCISE VIDEO'**
  String get exerciseVideo;

  /// No description provided for @logWorkout.
  ///
  /// In en, this message translates to:
  /// **'Log Workout'**
  String get logWorkout;

  /// No description provided for @achievedDate.
  ///
  /// In en, this message translates to:
  /// **'Achieved Oct 24, 2023'**
  String get achievedDate;

  /// No description provided for @targetedMuscles.
  ///
  /// In en, this message translates to:
  /// **'TARGETED MUSCLES'**
  String get targetedMuscles;

  /// No description provided for @primaryMuscle.
  ///
  /// In en, this message translates to:
  /// **'PRIMARY'**
  String get primaryMuscle;

  /// No description provided for @secondaryMuscle.
  ///
  /// In en, this message translates to:
  /// **'SECONDARY'**
  String get secondaryMuscle;

  /// No description provided for @frontDeltoids.
  ///
  /// In en, this message translates to:
  /// **'Front Deltoids'**
  String get frontDeltoids;

  /// No description provided for @tricepsBrachii.
  ///
  /// In en, this message translates to:
  /// **'Triceps Brachii'**
  String get tricepsBrachii;

  /// No description provided for @howToPerform.
  ///
  /// In en, this message translates to:
  /// **'HOW TO PERFORM'**
  String get howToPerform;

  /// No description provided for @step1Num.
  ///
  /// In en, this message translates to:
  /// **'01'**
  String get step1Num;

  /// No description provided for @step1Title.
  ///
  /// In en, this message translates to:
  /// **'The Setup'**
  String get step1Title;

  /// No description provided for @step1Desc.
  ///
  /// In en, this message translates to:
  /// **'Stand with your mid-foot under the barbell. Bend over and grab the bar with a shoulder-width grip. Drop your hips until your shins touch the bar.'**
  String get step1Desc;

  /// No description provided for @step2Num.
  ///
  /// In en, this message translates to:
  /// **'02'**
  String get step2Num;

  /// No description provided for @step2Title.
  ///
  /// In en, this message translates to:
  /// **'Brace Your Core'**
  String get step2Title;

  /// No description provided for @step2Desc.
  ///
  /// In en, this message translates to:
  /// **'Take a deep breath, hold it, and brace your abs as if someone is about to punch you. Lift your chest and straighten your lower back.'**
  String get step2Desc;

  /// No description provided for @step3Num.
  ///
  /// In en, this message translates to:
  /// **'03'**
  String get step3Num;

  /// No description provided for @step3Title.
  ///
  /// In en, this message translates to:
  /// **'The Pull'**
  String get step3Title;

  /// No description provided for @step3Desc.
  ///
  /// In en, this message translates to:
  /// **'Pull the weight upward by driving your feet into the floor. Keep the bar in contact with your legs the entire time. Lock your hips at the top.'**
  String get step3Desc;

  /// No description provided for @proFormTips.
  ///
  /// In en, this message translates to:
  /// **'Pro Form Tips'**
  String get proFormTips;

  /// No description provided for @tip1.
  ///
  /// In en, this message translates to:
  /// **'Don\'t round your back. Keep a neutral spine throughout the entire lift to avoid lumbar injury.'**
  String get tip1;

  /// No description provided for @tip2.
  ///
  /// In en, this message translates to:
  /// **'Engage your lats. Imagine you\'re trying to squeeze oranges under your armpits before you pull.'**
  String get tip2;

  /// No description provided for @tip3.
  ///
  /// In en, this message translates to:
  /// **'Drive with the heels. The deadlift is a push followed by a pull. Push the earth away.'**
  String get tip3;

  /// No description provided for @training_prefs.
  ///
  /// In en, this message translates to:
  /// **'Training Preferences'**
  String get training_prefs;

  /// No description provided for @customization.
  ///
  /// In en, this message translates to:
  /// **'CUSTOMIZATION'**
  String get customization;

  /// No description provided for @precision_tuning.
  ///
  /// In en, this message translates to:
  /// **'Precision Tuning.'**
  String get precision_tuning;

  /// No description provided for @precision_desc.
  ///
  /// In en, this message translates to:
  /// **'Calibrate your training environment\nfor peak performance and minimal\nfriction.'**
  String get precision_desc;

  /// No description provided for @workout_settings.
  ///
  /// In en, this message translates to:
  /// **'Workout Settings'**
  String get workout_settings;

  /// No description provided for @general.
  ///
  /// In en, this message translates to:
  /// **'GENERAL'**
  String get general;

  /// No description provided for @default_rest_timer.
  ///
  /// In en, this message translates to:
  /// **'Default Rest Timer'**
  String get default_rest_timer;

  /// No description provided for @weight_units.
  ///
  /// In en, this message translates to:
  /// **'Weight Units'**
  String get weight_units;

  /// No description provided for @metric_vs_imperial.
  ///
  /// In en, this message translates to:
  /// **'Metric vs Imperial'**
  String get metric_vs_imperial;

  /// No description provided for @sound_effects.
  ///
  /// In en, this message translates to:
  /// **'Sound Effects'**
  String get sound_effects;

  /// No description provided for @automation.
  ///
  /// In en, this message translates to:
  /// **'Automation'**
  String get automation;

  /// No description provided for @workflow.
  ///
  /// In en, this message translates to:
  /// **'WORKFLOW'**
  String get workflow;

  /// No description provided for @auto_start_rest.
  ///
  /// In en, this message translates to:
  /// **'Auto-start Rest Timer'**
  String get auto_start_rest;

  /// No description provided for @auto_advance.
  ///
  /// In en, this message translates to:
  /// **'Auto-advance Exercises'**
  String get auto_advance;

  /// No description provided for @vibrate_completion.
  ///
  /// In en, this message translates to:
  /// **'Vibrate on Completion'**
  String get vibrate_completion;

  /// No description provided for @equipment.
  ///
  /// In en, this message translates to:
  /// **'Equipment'**
  String get equipment;

  /// No description provided for @hardware.
  ///
  /// In en, this message translates to:
  /// **'HARDWARE'**
  String get hardware;

  /// No description provided for @default_barbell.
  ///
  /// In en, this message translates to:
  /// **'DEFAULT BARBELL'**
  String get default_barbell;

  /// No description provided for @fractionals.
  ///
  /// In en, this message translates to:
  /// **'FRACTIONALS'**
  String get fractionals;

  /// No description provided for @enabled.
  ///
  /// In en, this message translates to:
  /// **'Enabled'**
  String get enabled;

  /// No description provided for @apple_health.
  ///
  /// In en, this message translates to:
  /// **'Apple Health'**
  String get apple_health;

  /// No description provided for @sync_workouts.
  ///
  /// In en, this message translates to:
  /// **'Sync Workouts to\nHealthKit'**
  String get sync_workouts;

  /// No description provided for @connected.
  ///
  /// In en, this message translates to:
  /// **'Connected'**
  String get connected;

  /// No description provided for @configure.
  ///
  /// In en, this message translates to:
  /// **'Configure'**
  String get configure;

  /// No description provided for @reset_prefs.
  ///
  /// In en, this message translates to:
  /// **'Reset All Preferences'**
  String get reset_prefs;

  /// No description provided for @reset_note.
  ///
  /// In en, this message translates to:
  /// **'Note: This will restore all workout settings to factory\ndefaults. This action cannot be undone.'**
  String get reset_note;

  /// No description provided for @integrations.
  ///
  /// In en, this message translates to:
  /// **'Integrations'**
  String get integrations;

  /// No description provided for @sync_ecosystem.
  ///
  /// In en, this message translates to:
  /// **'SYNC YOUR ECOSYSTEM'**
  String get sync_ecosystem;

  /// No description provided for @connect_sync.
  ///
  /// In en, this message translates to:
  /// **'Connect & Sync'**
  String get connect_sync;

  /// No description provided for @connect_sync_desc.
  ///
  /// In en, this message translates to:
  /// **'Power your training with data from your favorite apps and devices.'**
  String get connect_sync_desc;

  /// No description provided for @health_activity.
  ///
  /// In en, this message translates to:
  /// **'HEALTH & ACTIVITY'**
  String get health_activity;

  /// No description provided for @social_sharing.
  ///
  /// In en, this message translates to:
  /// **'SOCIAL & SHARING'**
  String get social_sharing;

  /// No description provided for @strava.
  ///
  /// In en, this message translates to:
  /// **'Strava'**
  String get strava;

  /// No description provided for @garmin_connect.
  ///
  /// In en, this message translates to:
  /// **'Garmin Connect'**
  String get garmin_connect;

  /// No description provided for @instagram.
  ///
  /// In en, this message translates to:
  /// **'Instagram'**
  String get instagram;

  /// No description provided for @whatsapp.
  ///
  /// In en, this message translates to:
  /// **'WhatsApp'**
  String get whatsapp;

  /// No description provided for @not_connected.
  ///
  /// In en, this message translates to:
  /// **'Not connected'**
  String get not_connected;

  /// No description provided for @connect_btn.
  ///
  /// In en, this message translates to:
  /// **'Connect'**
  String get connect_btn;

  /// No description provided for @data_privacy.
  ///
  /// In en, this message translates to:
  /// **'Data Privacy'**
  String get data_privacy;

  /// No description provided for @data_privacy_desc.
  ///
  /// In en, this message translates to:
  /// **'Your trust is our priority. We only sync data with your explicit permission. You can revoke access at any time through this dashboard or your device settings. We never sell your biometric data to third parties.'**
  String get data_privacy_desc;

  /// No description provided for @view_privacy_policy.
  ///
  /// In en, this message translates to:
  /// **'View Privacy Policy'**
  String get view_privacy_policy;

  /// No description provided for @dataManagement.
  ///
  /// In en, this message translates to:
  /// **'Data Management'**
  String get dataManagement;

  /// No description provided for @kineticEngine.
  ///
  /// In en, this message translates to:
  /// **'KINETIC ENGINE'**
  String get kineticEngine;

  /// No description provided for @yourTrainingEverywhere.
  ///
  /// In en, this message translates to:
  /// **'Your Training,\nEverywhere'**
  String get yourTrainingEverywhere;

  /// No description provided for @trainingEverywhereDesc.
  ///
  /// In en, this message translates to:
  /// **'Own your journey. Seamlessly move your workout history between platforms or keep a secure local archive.'**
  String get trainingEverywhereDesc;

  /// No description provided for @dataPortability.
  ///
  /// In en, this message translates to:
  /// **'Export to CSV for Data Portability'**
  String get dataPortability;

  /// No description provided for @availableFormats.
  ///
  /// In en, this message translates to:
  /// **'AVAILABLE FORMATS'**
  String get availableFormats;

  /// No description provided for @exportToCsv.
  ///
  /// In en, this message translates to:
  /// **'Export to CSV'**
  String get exportToCsv;

  /// No description provided for @exportCsvDesc.
  ///
  /// In en, this message translates to:
  /// **'Generate a spreadsheet-ready file of all sets, weights, and timestamps. Perfect for custom analysis.'**
  String get exportCsvDesc;

  /// No description provided for @downloadSpreadsheet.
  ///
  /// In en, this message translates to:
  /// **'Download Spreadsheet'**
  String get downloadSpreadsheet;

  /// No description provided for @exportToJson.
  ///
  /// In en, this message translates to:
  /// **'Export to JSON'**
  String get exportToJson;

  /// No description provided for @exportJsonDesc.
  ///
  /// In en, this message translates to:
  /// **'Developer-friendly format containing your entire workout metadata structure and personal records.'**
  String get exportJsonDesc;

  /// No description provided for @generateSchema.
  ///
  /// In en, this message translates to:
  /// **'Generate Schema'**
  String get generateSchema;

  /// No description provided for @migration.
  ///
  /// In en, this message translates to:
  /// **'MIGRATION'**
  String get migration;

  /// No description provided for @importFromApps.
  ///
  /// In en, this message translates to:
  /// **'Import from Hevy /\nStrong / Fitbod'**
  String get importFromApps;

  /// No description provided for @automaticParsing.
  ///
  /// In en, this message translates to:
  /// **'Automatic parsing for major apps'**
  String get automaticParsing;

  /// No description provided for @migrationQuote.
  ///
  /// In en, this message translates to:
  /// **'\"Moving platforms shouldn\'t mean losing years of progress. Our parser preserves your volume history and personal bests.\"'**
  String get migrationQuote;

  /// No description provided for @backup.
  ///
  /// In en, this message translates to:
  /// **'BACKUP'**
  String get backup;

  /// No description provided for @cloudSync.
  ///
  /// In en, this message translates to:
  /// **'Cloud Sync'**
  String get cloudSync;

  /// No description provided for @automatedStorage.
  ///
  /// In en, this message translates to:
  /// **'Automated encrypted storage'**
  String get automatedStorage;

  /// No description provided for @lastBackup.
  ///
  /// In en, this message translates to:
  /// **'Last backup: Today, 04:12 AM'**
  String get lastBackup;

  /// No description provided for @todayTime.
  ///
  /// In en, this message translates to:
  /// **'Today, 08:42 AM'**
  String get todayTime;

  /// No description provided for @backupNow.
  ///
  /// In en, this message translates to:
  /// **'Backup Now'**
  String get backupNow;

  /// No description provided for @privacyFirst.
  ///
  /// In en, this message translates to:
  /// **'Privacy First'**
  String get privacyFirst;

  /// No description provided for @privacyDesc.
  ///
  /// In en, this message translates to:
  /// **'Your data is encrypted and never sold to third parties. We believe your training metrics belong to you, and only you.'**
  String get privacyDesc;

  /// No description provided for @kineticProExperience.
  ///
  /// In en, this message translates to:
  /// **'KINETIC PRO EXPERIENCE'**
  String get kineticProExperience;

  /// No description provided for @unlockPeakPerformance.
  ///
  /// In en, this message translates to:
  /// **'UNLOCK YOUR PEAK\nPERFORMANCE'**
  String get unlockPeakPerformance;

  /// No description provided for @aiFormAnalysis.
  ///
  /// In en, this message translates to:
  /// **'AI Form Analysis'**
  String get aiFormAnalysis;

  /// No description provided for @aiFormAnalysisDesc.
  ///
  /// In en, this message translates to:
  /// **'Real-time technique correction with your camera.'**
  String get aiFormAnalysisDesc;

  /// No description provided for @personalAiCoach.
  ///
  /// In en, this message translates to:
  /// **'Personal AI Coach'**
  String get personalAiCoach;

  /// No description provided for @personalAiCoachDesc.
  ///
  /// In en, this message translates to:
  /// **'24/7 adaptive programming that learns from your sets.'**
  String get personalAiCoachDesc;

  /// No description provided for @advancedAnalytics.
  ///
  /// In en, this message translates to:
  /// **'Advanced Analytics'**
  String get advancedAnalytics;

  /// No description provided for @advancedAnalyticsDesc.
  ///
  /// In en, this message translates to:
  /// **'In-depth volume, 1RM, and fatigue tracking trends.'**
  String get advancedAnalyticsDesc;

  /// No description provided for @customWorkoutFolders.
  ///
  /// In en, this message translates to:
  /// **'Custom Workout Folders'**
  String get customWorkoutFolders;

  /// No description provided for @customWorkoutFoldersDesc.
  ///
  /// In en, this message translates to:
  /// **'Organize your routines exactly the way you train.'**
  String get customWorkoutFoldersDesc;

  /// No description provided for @unlimitedCustomRoutines.
  ///
  /// In en, this message translates to:
  /// **'Unlimited Custom Routines'**
  String get unlimitedCustomRoutines;

  /// No description provided for @selectYourPath.
  ///
  /// In en, this message translates to:
  /// **'SELECT YOUR PATH'**
  String get selectYourPath;

  /// No description provided for @yearlyPlan.
  ///
  /// In en, this message translates to:
  /// **'Yearly Plan'**
  String get yearlyPlan;

  /// No description provided for @freeTrialIncluded.
  ///
  /// In en, this message translates to:
  /// **'7-Day Free Trial included'**
  String get freeTrialIncluded;

  /// No description provided for @bestValue.
  ///
  /// In en, this message translates to:
  /// **'BEST VALUE'**
  String get bestValue;

  /// No description provided for @startFreeTrial.
  ///
  /// In en, this message translates to:
  /// **'START 7-DAY FREE TRIAL'**
  String get startFreeTrial;

  /// No description provided for @restorePurchase.
  ///
  /// In en, this message translates to:
  /// **'RESTORE PURCHASE'**
  String get restorePurchase;

  /// No description provided for @termsOfService.
  ///
  /// In en, this message translates to:
  /// **'TERMS OF SERVICE'**
  String get termsOfService;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'PRIVACY POLICY'**
  String get privacyPolicy;

  /// No description provided for @copyrightText.
  ///
  /// In en, this message translates to:
  /// **'© 2024 KINETIC EDITORIAL'**
  String get copyrightText;

  /// No description provided for @syncStatus.
  ///
  /// In en, this message translates to:
  /// **'Sync Status'**
  String get syncStatus;

  /// No description provided for @allSystemsUpToDate.
  ///
  /// In en, this message translates to:
  /// **'All systems up to date'**
  String get allSystemsUpToDate;

  /// No description provided for @lastFullSync.
  ///
  /// In en, this message translates to:
  /// **'Last full sync: Today, 10:42 AM'**
  String get lastFullSync;

  /// No description provided for @activeServices.
  ///
  /// In en, this message translates to:
  /// **'ACTIVE SERVICES'**
  String get activeServices;

  /// No description provided for @appleHealth.
  ///
  /// In en, this message translates to:
  /// **'Apple Health'**
  String get appleHealth;

  /// No description provided for @googleDriveBackup.
  ///
  /// In en, this message translates to:
  /// **'Google Drive Backup'**
  String get googleDriveBackup;

  /// No description provided for @syncedAgo.
  ///
  /// In en, this message translates to:
  /// **'Synced 2m ago'**
  String get syncedAgo;

  /// No description provided for @syncing.
  ///
  /// In en, this message translates to:
  /// **'Syncing...'**
  String get syncing;

  /// No description provided for @syncAllData.
  ///
  /// In en, this message translates to:
  /// **'Sync All Data'**
  String get syncAllData;

  /// No description provided for @recentActivity.
  ///
  /// In en, this message translates to:
  /// **'RECENT ACTIVITY'**
  String get recentActivity;

  /// No description provided for @exportedWorkoutStrava.
  ///
  /// In en, this message translates to:
  /// **'Exported Workout to Strava'**
  String get exportedWorkoutStrava;

  /// No description provided for @morningRun.
  ///
  /// In en, this message translates to:
  /// **'Morning Run • 10:45 AM'**
  String get morningRun;

  /// No description provided for @pulledHeartRate.
  ///
  /// In en, this message translates to:
  /// **'Pulled Heart Rate from Apple Health'**
  String get pulledHeartRate;

  /// No description provided for @backgroundSync.
  ///
  /// In en, this message translates to:
  /// **'Background Sync • 10:42 AM'**
  String get backgroundSync;

  /// No description provided for @autoBackupCompleted.
  ///
  /// In en, this message translates to:
  /// **'Automatic Backup Completed'**
  String get autoBackupCompleted;

  /// No description provided for @cloudStorage.
  ///
  /// In en, this message translates to:
  /// **'Cloud Storage • 04:12 AM'**
  String get cloudStorage;

  /// No description provided for @activity.
  ///
  /// In en, this message translates to:
  /// **'ACTIVITY'**
  String get activity;

  /// No description provided for @avgHeartRate.
  ///
  /// In en, this message translates to:
  /// **'AVG HEART RATE'**
  String get avgHeartRate;

  /// No description provided for @repeatThisWorkout.
  ///
  /// In en, this message translates to:
  /// **'REPEAT THIS WORKOUT'**
  String get repeatThisWorkout;

  /// No description provided for @exerciseLog.
  ///
  /// In en, this message translates to:
  /// **'EXERCISE LOG'**
  String get exerciseLog;

  /// No description provided for @set.
  ///
  /// In en, this message translates to:
  /// **'SET'**
  String get set;

  /// No description provided for @comments.
  ///
  /// In en, this message translates to:
  /// **'COMMENTS'**
  String get comments;

  /// No description provided for @reply.
  ///
  /// In en, this message translates to:
  /// **'REPLY'**
  String get reply;

  /// No description provided for @journey.
  ///
  /// In en, this message translates to:
  /// **'JOURNEY'**
  String get journey;

  /// No description provided for @workout.
  ///
  /// In en, this message translates to:
  /// **'WORKOUT'**
  String get workout;

  /// No description provided for @explore.
  ///
  /// In en, this message translates to:
  /// **'EXPLORE'**
  String get explore;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'PROFILE'**
  String get profile;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
