import 'package:flutter/material.dart';
import 'package:kinetic/features/coaching/models/feed_model.dart';


class FeedProvider extends ChangeNotifier {
  bool isLoading = false;
  List<FeedPostModel> posts = [];

  Future<void> fetchFeedPosts() async {
    isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1)); // محاكاة الـ API

    posts = [
      FeedPostModel(
        id: '1',
        type: PostType.workout,
        userName: 'Marcus Chen',
        userAvatar: 'https://randomuser.me/api/portraits/men/32.jpg',
        timeAgo: '2h ago',
        postTitle: 'Upper Body Power A',
        likes: 42,
        comments: 12,
        stat1Label: 'duration',
        stat1Value: '55m',
        stat2Label: 'volume',
        stat2Value: '12,400kg',
        stat3Label: 'sets',
        stat3Value: '18',
        exercises: ['Bench Press (Barbell)', 'Incline Dumbbell Fly', 'Weighted Pull-Ups'],
        personalRecordText: '140kg Bench Press x 3 Reps',
      ),
      FeedPostModel(
        id: '2',
        type: PostType.endurance,
        userName: 'Elena Rodriguez',
        userAvatar: 'https://randomuser.me/api/portraits/women/44.jpg',
        timeAgo: '4h ago',
        postTitle: 'Riverside Evening Run',
        likes: 85,
        comments: 7,
        stat1Label: 'time',
        stat1Value: '42m',
        stat2Label: 'dist',
        stat2Value: '8.2km',
        stat3Label: 'pace',
        stat3Value: "5'08\"",
        mapImageUrl: 'https://images.unsplash.com/photo-1524661135-423995f22d0b?q=80&w=600&auto=format&fit=crop', // صورة للشارع/الخريطة
        locationName: 'Lakeshore Trail',
      ),
    ];

    isLoading = false;
    notifyListeners();
  }
}