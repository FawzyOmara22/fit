import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kinetic/features/coaching/models/session_review_model.dart';


class SessionReviewProvider with ChangeNotifier {
  SessionReviewModel? sessionData;
  bool isLoading = true;
  bool isSubmitting = false;
  String? errorMessage;
  
  bool isCriticalReview = false;
  final TextEditingController feedbackController = TextEditingController();

  // Fetch data from API
  Future<void> fetchSessionData(String sessionId) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      // TODO: Replace with your actual API endpoint
      // final response = await http.get(Uri.parse('YOUR_API_URL/sessions/$sessionId'));
      // if (response.statusCode == 200) {
      //   sessionData = SessionReviewModel.fromJson(json.decode(response.body));
      // } else { ... }

      // MOCK DATA FOR UI TESTING
      await Future.delayed(const Duration(seconds: 1)); 
      sessionData = SessionReviewModel(
        clientName: "Marcus Chen",
        programName: "UPPER BODY POWER A",
        avatarUrl: "https://via.placeholder.com/150",
        durationMins: 64,
        volumeK: 8.4,
        avgRpe: 8.5,
        volumeTrendPercentage: 12.0,
        defaultFeedback: "Great intensity today, Marcus! Your bench press volume is trending up nicely. Let's watch the shoulder stability on that second set.",
        exercises: [
          ExerciseModel(
            name: "Barbell Bench Press",
            isPrAchieved: true,
            sets: [
              SetModel(setNumber: 1, weight: 100, reps: 5, rpe: 7),
              SetModel(setNumber: 2, weight: 105, reps: 5, rpe: 9, isPr: true),
              SetModel(setNumber: 3, weight: 100, reps: 5, rpe: 8),
            ],
          ),
          ExerciseModel(
            name: "Incline DB Row",
            isPrAchieved: false,
            sets: [
              SetModel(setNumber: 1, weight: 34, reps: 10, rpe: 8),
              SetModel(setNumber: 2, weight: 34, reps: 10, rpe: 8.5),
            ],
          ),
        ],
        insights: [
          InsightModel(type: 'trend', text: "3.2% increase in total volume since previous Monday."),
          InsightModel(type: 'time', text: "Workout tempo was consistent with a focus on eccentric control."),
        ],
      );
      feedbackController.text = sessionData!.defaultFeedback;

    } catch (e) {
      errorMessage = "Failed to load session data.";
    }

    isLoading = false;
    notifyListeners();
  }

  void toggleCriticalReview(bool? value) {
    isCriticalReview = value ?? false;
    notifyListeners();
  }

  // Post data to API
  Future<bool> submitReview() async {
    isSubmitting = true;
    notifyListeners();

    try {
      final payload = {
        "feedback": feedbackController.text,
        "isCritical": isCriticalReview,
        // include other session identifiers
      };

      // TODO: Replace with actual POST request
      // final response = await http.post(
      //   Uri.parse('YOUR_API_URL/sessions/review'),
      //   body: json.encode(payload),
      //   headers: {'Content-Type': 'application/json'},
      // );
      
      await Future.delayed(const Duration(seconds: 2)); // Mock network delay
      
      isSubmitting = false;
      notifyListeners();
      return true; // Success
    } catch (e) {
      isSubmitting = false;
      notifyListeners();
      return false; // Failed
    }
  }
  
  @override
  void dispose() {
    feedbackController.dispose();
    super.dispose();
  }
}