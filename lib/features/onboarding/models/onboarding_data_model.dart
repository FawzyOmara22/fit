class OnboardingDataModel {
  String? primaryGoal;
  int? birthYear;
  String? gender;
  double? weight;
  String weightUnit = 'KG';
  int? height; 
  String heightUnit = 'cm';
  String? experienceLevel; 
  bool hasNoInjuries = false; 
  List<String> affectedAreas = [];
  String? injuryNotes;
  int? daysPerWeek;
  String startOfWeek = 'Monday'; // الافتراضي يوم الاثنين
  String? sessionLength;
  List<String> availableEquipment = [];
  bool addCardioFinishers = false;
  String distanceUnit = 'KM';

  Map<String, dynamic> toJson() {
    return {
      'primary_goal': primaryGoal,
      'birth_year': birthYear,
      'gender': gender,
      'weight': weight,
      'weight_unit': weightUnit,
      'height': height,
      'height_unit': heightUnit,
      'experience_level': experienceLevel,
      'has_no_injuries': hasNoInjuries,
      'affected_areas': affectedAreas,
      'injury_notes': injuryNotes,
      'days_per_week': daysPerWeek,
      'start_of_week': startOfWeek,
      'session_length': sessionLength,
      'available_equipment': availableEquipment,
      'add_cardio_finishers': addCardioFinishers,
      'distance_unit': distanceUnit,
    };
  }
}