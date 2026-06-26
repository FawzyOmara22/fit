import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/coaching/provider/coaching_provider.dart';
import 'package:kinetic/features/coaching/widgets/coaching_widgets.dart';
import 'package:provider/provider.dart';


class CoachingScreen extends StatefulWidget {
  const CoachingScreen({Key? key}) : super(key: key);

  @override
  State<CoachingScreen> createState() => _CoachingScreenState();
}

class _CoachingScreenState extends State<CoachingScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CoachingProvider>().fetchCoachingData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final provider = context.watch<CoachingProvider>();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: true,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://randomuser.me/api/portraits/men/11.jpg'), // صورة المستخدم
          ),
        ),
        title: Text(
          l10n.kineticCoaching,
          style: AppTextStyles.trainAppBar20.copyWith(color: AppColors.primary, fontWeight: FontWeight.w900),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined, color: AppColors.darkCharcoal),
            onPressed: () {},
          ),
        ],
      ),
      body: provider.isLoading || provider.coachingData == null
          ? const Center(child: CircularProgressIndicator(color: AppColors.primary))
          : SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ActiveChatBanner(l10n: l10n),
                  const SizedBox(height: 32),
                  
                  MyCoachesSection(coaches: provider.coachingData!.myCoaches, l10n: l10n),
                  const SizedBox(height: 32),
                  
                  ExploreCoachesSection(coaches: provider.coachingData!.exploreCoaches, l10n: l10n),
                  const SizedBox(height: 32),
                  
                  SignatureProgramsSection(programs: provider.coachingData!.programs, l10n: l10n),
                  const SizedBox(height: 32),
                  
                  KineticEdgeSection(features: provider.coachingData!.edgeFeatures, l10n: l10n),
                  const SizedBox(height: 32), // مساحة مريحة في الأسفل
                ],
              ),
            ),
    );
  }
}