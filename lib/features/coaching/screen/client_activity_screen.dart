import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/coaching/provider/feed_provider.dart';
import 'package:kinetic/features/coaching/widgets/client_activity_widgets.dart';
import 'package:provider/provider.dart';


class ClientActivityScreen extends StatefulWidget {
  const ClientActivityScreen({Key? key}) : super(key: key);

  @override
  State<ClientActivityScreen> createState() => _ClientActivityScreenState();
}

class _ClientActivityScreenState extends State<ClientActivityScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<FeedProvider>().fetchFeedPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final provider = context.watch<FeedProvider>();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: AppColors.primary),
          onPressed: () {},
        ),
        title: Text('KINETIC', style: AppTextStyles.trainAppBar20.copyWith(color: AppColors.primary)),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: AppColors.darkCharcoal),
            onPressed: () {},
          ),
          const Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              radius: 16,
              backgroundImage: NetworkImage('https://randomuser.me/api/portraits/men/11.jpg'),
            ),
          ),
        ],
      ),
      body: provider.isLoading
          ? const Center(child: CircularProgressIndicator(color: AppColors.primary))
          : ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              children: [
                Text(l10n.communityFeed, style: AppTextStyles.sectionLabel),
                const SizedBox(height: 4),
                Text(l10n.clientActivity, style: AppTextStyles.heading36Black.copyWith(fontSize: 32)),
                const SizedBox(height: 24),
                
                // عرض البوستات بناءً على نوعها
                ...provider.posts.map((post) => FeedPostCard(post: post, l10n: l10n)).toList(),
                
                const SizedBox(height: 80), // مساحة علشان الـ FAB والـ Bottom Nav
              ],
            ),
      
      // الزر العائم الأزرق
     // الزر العائم (دائري بتدرج لوني)
      floatingActionButton: Container(
        width: 64, // عرض الزرار
        height: 64, // طول الزرار عشان يبقى دائرة مثالية
        decoration: BoxDecoration(
          shape: BoxShape.circle, // الشكل الدائري
          gradient: const LinearGradient(
            colors: [Color(0xFF3B82F6), Color(0xFF60A5FA)], // التدرج اللوني الساطع
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.4), // ظل خفيف بنفس لون الزرار
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.transparent, // شفاف عشان التدرج اللوني اللي وراه يظهر
          elevation: 0, // لغينا الظل الافتراضي واستخدمنا ظل الـ Container الأجمل
          highlightElevation: 0,
          child: const Icon(Icons.add, color: Colors.white, size: 32),
        ),
      ),
      
    
    );
  }
}