import 'package:flutter/material.dart';
import 'package:kinetic/features/coaching/models/client_model.dart';


class ClientProvider extends ChangeNotifier {
  bool isLoading = false;
  ClientDashboardModel? dashboardData;

  Future<void> fetchClientsData() async {
    isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1)); // محاكاة API

    dashboardData = ClientDashboardModel(
      activeClientsCount: 12,
      activeClientsSub: 'thisMonth', // Key
      pendingReviewsCount: 4,
      pendingReviewsSub: 'updatesWaiting', // Key
      clients: [
        ClientModel(
          id: '1',
          name: 'Alex Johnson',
          avatarUrl: 'https://randomuser.me/api/portraits/men/33.jpg',
          status: ClientStatus.needsReview,
          hasAlert: true,
          latestActivityTitle: 'Finished Upper Body A',
          timeAgo: '2h ago',
          progress: 0.8, // 80% progress
          consistency: ConsistencyLevel.high,
        ),
        ClientModel(
          id: '2',
          name: 'Marcus Reid',
          avatarUrl: 'https://randomuser.me/api/portraits/men/45.jpg',
          status: ClientStatus.onTrack,
          hasAlert: false,
          latestActivityTitle: 'Rest Day - Recovery Walk',
          timeAgo: 'Yesterday',
          progress: null, // لا يوجد شريط تقدم هنا
          consistency: ConsistencyLevel.stable,
        ),
        ClientModel(
          id: '3',
          name: 'Sarah Chen',
          avatarUrl: 'https://randomuser.me/api/portraits/women/68.jpg',
          status: ClientStatus.inactive,
          hasAlert: false,
          latestActivityTitle: '',
          timeAgo: '',
          consistency: ConsistencyLevel.low, // كمثال لـ Inactive
        ),
      ],
    );

    isLoading = false;
    notifyListeners();
  }
}