import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/coaching/models/feed_model.dart';

// ==========================================
// دالة مساعدة لترجمة النصوص (Keys) القادمة من الـ API
// ==========================================
String _translateStatLabel(String key, AppLocalizations l10n) {
  switch (key.toLowerCase()) {
    case 'duration': return l10n.duration;
    case 'volume': return l10n.volume;
    case 'sets': return l10n.sets;
    case 'time': return l10n.time;
    case 'dist': return l10n.dist;
    case 'pace': return l10n.pace;
    default: return key;
  }
}

// ==========================================
// 1. الكارت الرئيسي للمنشور (Feed Post Card)
// ==========================================
class FeedPostCard extends StatelessWidget {
  final FeedPostModel post;
  final AppLocalizations l10n;
  
  const FeedPostCard({Key? key, required this.post, required this.l10n}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isWorkout = post.type == PostType.workout;
    final tagText = isWorkout ? l10n.workout : l10n.endurance;
    
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 15, offset: const Offset(0, 5)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Header (User Info & Tag)
          Row(
            children: [
              CircleAvatar(radius: 20, backgroundImage: NetworkImage(post.userAvatar)),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(post.userName, style: AppTextStyles.feedUserName16),
                    Text(post.timeAgo, style: AppTextStyles.feedTimeAgo12),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(color: AppColors.lightBlueWhite, borderRadius: BorderRadius.circular(12)),
                child: Text(tagText, style: AppTextStyles.feedPrBadge10),
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          // 2. Title
          Text(post.postTitle, style: AppTextStyles.feedPostTitle24),
          const SizedBox(height: 16),
          
          // 3. Stats Row
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(color: AppColors.background, borderRadius: BorderRadius.circular(16)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _StatItem(label: _translateStatLabel(post.stat1Label, l10n), value: post.stat1Value),
                Container(width: 1, height: 40, color: AppColors.divider), // فاصل
                _StatItem(label: _translateStatLabel(post.stat2Label, l10n), value: post.stat2Value),
                Container(width: 1, height: 40, color: AppColors.divider), // فاصل
                _StatItem(label: _translateStatLabel(post.stat3Label, l10n), value: post.stat3Value),
              ],
            ),
          ),
          const SizedBox(height: 20),
          
          // 4. Dynamic Content (Exercises OR Map)
          if (isWorkout) ...[
            Text(l10n.exerciseSummary, style: AppTextStyles.addExSectionTitle),
            const SizedBox(height: 12),
            if (post.exercises != null)
              ...post.exercises!.map((ex) => Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  children: [
                    const Icon(Icons.check_circle_outline, color: AppColors.primary, size: 20),
                    const SizedBox(width: 8),
                    Text(ex, style: AppTextStyles.feedExName14),
                  ],
                ),
              )).toList(),
              
            const SizedBox(height: 16),
            if (post.personalRecordText != null)
              _PersonalRecordBanner(text: post.personalRecordText!, l10n: l10n),
          ] else if (!isWorkout && post.mapImageUrl != null) ...[
             // مسار الجري (الخريطة)
            Container(
              height: 140,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(image: NetworkImage(post.mapImageUrl!), fit: BoxFit.cover),
              ),
              alignment: Alignment.bottomLeft,
              child: Container(
                margin: const EdgeInsets.all(12),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(color: Colors.black.withOpacity(0.6), borderRadius: BorderRadius.circular(8)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.location_on_outlined, color: Colors.white, size: 14),
                    const SizedBox(width: 4),
                    Text(post.locationName ?? '', style: AppTextStyles.label10Blue.copyWith(color: Colors.white)),
                  ],
                ),
              ),
            ),
          ],
          
          const SizedBox(height: 20),
          
          // 5. Footer (Likes & Comments)
          Row(
            children: [
              const Icon(Icons.favorite_border, color: AppColors.iconGrey, size: 22),
              const SizedBox(width: 6),
              Text('${post.likes}', style: AppTextStyles.feedActionText14.copyWith(color: AppColors.textGrey)),
              const SizedBox(width: 24),
              const Icon(Icons.chat_bubble_outline, color: AppColors.iconGrey, size: 22),
              const SizedBox(width: 6),
              Text('${post.comments}', style: AppTextStyles.feedActionText14.copyWith(color: AppColors.textGrey)),
            ],
          ),
        ],
      ),
    );
  }
}

// عنصر إحصائية صغير (يستخدم داخل الـ Stats Row)
class _StatItem extends StatelessWidget {
  final String label, value;
  const _StatItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label.toUpperCase(), style: AppTextStyles.feedStatLabel10),
        const SizedBox(height: 4),
        Text(value, style: AppTextStyles.feedStatValue24),
      ],
    );
  }
}


// لافتة الرقم القياسي (Personal Record Banner)
class _PersonalRecordBanner extends StatelessWidget {
  final String text;
  final AppLocalizations l10n;
  const _PersonalRecordBanner({required this.text, required this.l10n});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Color(0xFF3B82F6), Color(0xFF60A5FA)]),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), shape: BoxShape.circle),
            child: const Icon(Icons.star, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(l10n.personalRecord, style: AppTextStyles.label10Blue.copyWith(color: Colors.white70)),
                const SizedBox(height: 2),
                Text(text, style: AppTextStyles.body14BlueNoHeight.copyWith(color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

