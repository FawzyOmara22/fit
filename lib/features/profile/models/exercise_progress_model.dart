class ExerciseProgressModel {
  final String exerciseName;
  final double estimated1RM;
  final double percentageIncrease;
  final String totalVolume3Mo;
  final String unit;
  
  final HighlightStat bestWeight;
  final HighlightStat bestVolume;
  final HighlightStat bestSets;
  
  final List<WorkoutHistorySession> history;

  ExerciseProgressModel({
    required this.exerciseName,
    required this.estimated1RM,
    required this.percentageIncrease,
    required this.totalVolume3Mo,
    required this.unit,
    required this.bestWeight,
    required this.bestVolume,
    required this.bestSets,
    required this.history,
  });

  // توليد بيانات وهمية للمشروع لحد ما يتربط بالـ API
  factory ExerciseProgressModel.mockData() {
    return ExerciseProgressModel(
      exerciseName: 'Squat Progress',
      estimated1RM: 145,
      percentageIncrease: 12.0,
      totalVolume3Mo: '145,200',
      unit: 'kg',
      bestWeight: HighlightStat(value: '140', unit: 'kg', subValue: '2'),
      bestVolume: HighlightStat(value: '3500', unit: 'kg', subValue: ''),
      bestSets: HighlightStat(value: '5 x 5', unit: '', subValue: '125'),
      history: [
        WorkoutHistorySession(
          date: 'Oct 24, 2023',
          title: 'Leg Day A',
          isNewPR: true,
          sets: [
            SetRecord(setNum: 1, weight: 140, reps: 2, rpe: 9.5),
            SetRecord(setNum: 2, weight: 135, reps: 3, rpe: 9.0),
            SetRecord(setNum: 3, weight: 130, reps: 5, rpe: 8.5),
          ],
        ),
        WorkoutHistorySession(
          date: 'Oct 21, 2023',
          title: 'Lower Strength',
          isNewPR: false,
          sets: [
            SetRecord(setNum: 1, weight: 130, reps: 5, rpe: 8.5),
            SetRecord(setNum: 2, weight: 130, reps: 5, rpe: 9.0),
          ],
        ),
      ],
    );
  }
}

class HighlightStat {
  final String value;
  final String unit;
  final String subValue;

  HighlightStat({required this.value, required this.unit, required this.subValue});
}

class WorkoutHistorySession {
  final String date;
  final String title;
  final bool isNewPR;
  final List<SetRecord> sets;

  WorkoutHistorySession({
    required this.date,
    required this.title,
    required this.isNewPR,
    required this.sets,
  });
}

class SetRecord {
  final int setNum;
  final double weight;
  final int reps;
  final double rpe;

  SetRecord({required this.setNum, required this.weight, required this.reps, required this.rpe});
}