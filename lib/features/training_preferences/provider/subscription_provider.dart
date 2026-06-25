import 'package:flutter/material.dart';
import 'package:kinetic/features/training_preferences/models/subscription_plan_model.dart';


class SubscriptionProvider extends ChangeNotifier {
  bool isLoading = false;
  List<SubscriptionPlanModel> plans = [];
  SubscriptionPlanModel? selectedPlan;

  // دالة لجلب الباقات من API
  Future<void> fetchPlans() async {
    isLoading = true;
    notifyListeners();

    try {
      // محاكاة الاتصال بالـ API
      await Future.delayed(const Duration(seconds: 1));
      
      // الداتا الراجعة من API
      plans = [
        SubscriptionPlanModel(
          id: '1',
          titleKey: 'yearlyPlan',
          trialTextKey: 'freeTrialIncluded',
          price: 59.99,
          pricePerMonth: 4.99,
          isBestValue: true,
        ),
      ];
      if (plans.isNotEmpty) selectedPlan = plans.first;
    } catch (e) {
      debugPrint("Error fetching plans: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void selectPlan(SubscriptionPlanModel plan) {
    selectedPlan = plan;
    notifyListeners();
  }

  // دالة الشراء (إرسال للـ API)
  Future<void> processSubscription() async {
    if (selectedPlan == null) return;
    
    isLoading = true;
    notifyListeners();

    try {
      // هنا تضع كود الإرسال للـ API أو كود in-app purchase
      // final payload = selectedPlan!.toJson();
      await Future.delayed(const Duration(seconds: 2)); 
      
    } catch (e) {
      debugPrint("Subscription error: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}