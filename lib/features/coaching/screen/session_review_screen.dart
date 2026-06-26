import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/coaching/provider/session_review_provider.dart';
import 'package:kinetic/features/coaching/widgets/session_review_widgets.dart';
import 'package:provider/provider.dart';

class SessionReviewScreen extends StatefulWidget {
  final String sessionId;
  const SessionReviewScreen({Key? key, required this.sessionId}) : super(key: key);

  @override
  State<SessionReviewScreen> createState() => _SessionReviewScreenState();
}

class _SessionReviewScreenState extends State<SessionReviewScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SessionReviewProvider>().fetchSessionData(widget.sessionId);
    });
  }

  @override
  Widget build(BuildContext context) {
    // تعريف الـ l10n
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.darkCharcoal),
          onPressed: () => Navigator.pop(context),
        ),
        // استخدام l10n للعنوان
        title: Text(l10n.sessionReview, style: AppTextStyles.appBarTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: AppColors.darkCharcoal),
            onPressed: () {},
          )
        ],
      ),
      body: Consumer<SessionReviewProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator(color: AppColors.primary));
          }
          if (provider.errorMessage != null) {
            return Center(child: Text(provider.errorMessage!, style: AppTextStyles.body16));
          }

          final data = provider.sessionData!;

          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderWidget(data: data),
                const SizedBox(height: 20),
                StatsRowWidget(data: data),
                const SizedBox(height: 20),
                VolumeTrendWidget(data: data),
                const SizedBox(height: 24),
                PerformanceLogWidget(data: data),
                const SizedBox(height: 20),
                CoachInsightsWidget(data: data),
                const SizedBox(height: 20),
                FeedbackCardWidget(provider: provider),
                const SizedBox(height: 20),
                const BottomActionsWidget(),
                const SizedBox(height: 40),
              ],
            ),
          );
        },
      ),
    );
  }
}