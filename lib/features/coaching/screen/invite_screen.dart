import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/coaching/provider/invite_provider.dart';
import 'package:kinetic/features/coaching/widgets/invite_widgets.dart';
import 'package:provider/provider.dart';


class InviteScreen extends StatelessWidget {
  const InviteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return ChangeNotifierProvider(
      create: (_) => InviteProvider(),
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
        appBar: AppBar(
          backgroundColor: AppColors.scaffoldBackground,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColors.darkCharcoal),
            onPressed: () => Navigator.pop(context),
          ),
          title: Row(
            children: [
              Text(l10n.inviteClients, style: AppTextStyles.appBarTitle),
              const Spacer(),
              Text('KINETIC', style: AppTextStyles.appBarTitle.copyWith(fontWeight: FontWeight.w900, letterSpacing: 1.0)),
            ],
          ),
        ),
        body: Consumer<InviteProvider>(
          builder: (context, provider, child) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header Section
                  Text(l10n.growthPhase, style: AppTextStyles.label10Blue),
                  const SizedBox(height: 8),
                  Text(l10n.growYourRoster, style: AppTextStyles.heading36Black),
                  const SizedBox(height: 8),
                  Text(l10n.onboardNewAthletes, style: AppTextStyles.body16),
                  const SizedBox(height: 32),

                  // Quick Share
                  const QuickShareCard(),
                  const SizedBox(height: 20),

                  // Direct Invitation
                  DirectInviteCard(controller: provider.emailController),
                  const SizedBox(height: 32),

                  // Initial Program Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(l10n.initialProgram, style: AppTextStyles.cardTitle18),
                      Text(l10n.viewAll, style: AppTextStyles.label10Blue.copyWith(fontSize: 12)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ProgramOptionCard(
                    title: l10n.hypertrophy101,
                    subtitle: l10n.weeksDays1,
                    isSelected: provider.selectedProgramIndex == 0,
                    onTap: () => provider.selectProgram(0),
                  ),
                  ProgramOptionCard(
                    title: l10n.pureStrength,
                    subtitle: l10n.weeksDays2,
                    isSelected: provider.selectedProgramIndex == 1,
                    onTap: () => provider.selectProgram(1),
                  ),
                  ProgramOptionCard(
                    title: l10n.emptyTemplate,
                    subtitle: l10n.blankSlate,
                    isSelected: provider.selectedProgramIndex == 2,
                    onTap: () => provider.selectProgram(2),
                  ),
                  const SizedBox(height: 32),

                  // Preview Section
                  Text(l10n.whatTheySee, style: AppTextStyles.cardTitle18),
                  const SizedBox(height: 16),
                  const PreviewCard(),
                  const SizedBox(height: 40),

                  // Action Button
                  Container(
                    width: double.infinity,
                    height: 56,
                    decoration: BoxDecoration(
                      gradient: AppColors.primaryGradient,
                      borderRadius: BorderRadius.circular(28),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withOpacity(0.3),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        )
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: provider.isLoading 
                          ? null 
                          : () => provider.sendInvitationToApi(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
                      ),
                      child: provider.isLoading
                          ? const CircularProgressIndicator(color: AppColors.white)
                          : Text(l10n.sendInvitation, style: AppTextStyles.primaryButton18),
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // Footer Notification Text
                  Center(
                    child: Text(
                      l10n.clientReceiveNotification,
                      style: AppTextStyles.label10Grey.copyWith(letterSpacing: 1.5),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}