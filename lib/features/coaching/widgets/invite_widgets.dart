import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';

class QuickShareCard extends StatelessWidget {
  const QuickShareCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(color: AppColors.darkCharcoal5, blurRadius: 10, offset: Offset(0, 4))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(l10n.quickShareLink, style: AppTextStyles.cardTitle18),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: AppColors.cardSelectedBg,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.link, color: AppColors.primary, size: 20),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(l10n.postOnSocial, style: AppTextStyles.cardSubtitle13),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.scaffoldBackground,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: Text(
                    'kinetic.fit/invite/...',
                    style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w700, fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(l10n.copy, style: AppTextStyles.label10Grey.copyWith(color: AppColors.white)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DirectInviteCard extends StatelessWidget {
  final TextEditingController controller;
  
  const DirectInviteCard({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surfaceColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.directInvitation, style: AppTextStyles.cardTitle18),
          const SizedBox(height: 16),
          Text(l10n.emailOrPhone, style: AppTextStyles.label10Grey),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: l10n.athleteEmailHint,
                hintStyle: AppTextStyles.fieldHint,
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProgramOptionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isSelected;
  final VoidCallback onTap;

  const ProgramOptionCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.divider,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.cardTitle16),
                const SizedBox(height: 4),
                Text(subtitle, style: AppTextStyles.cardSubtitle13),
              ],
            ),
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? AppColors.primary : AppColors.borderGrey,
                  width: isSelected ? 6 : 2,
                ),
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PreviewCard extends StatelessWidget {
  const PreviewCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Container(
      width: double.infinity,
      height: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: NetworkImage('https://images.unsplash.com/photo-1534438327276-14e5300c3a48?q=80&w=1470&auto=format&fit=crop'), // صورة خلفية افتراضية
          fit: BoxFit.cover,
        ),
        boxShadow: const [
          BoxShadow(color: AppColors.darkCharcoal50, blurRadius: 15, offset: Offset(0, 5))
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.transparent, AppColors.nearBlack.withOpacity(0.9)],
          ),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(l10n.previewMode, style: AppTextStyles.label10Grey.copyWith(color: AppColors.white)),
            ),
            const SizedBox(height: 12),
            Text(l10n.welcomeAthlete, style: AppTextStyles.heading24.copyWith(color: AppColors.white, fontWeight: FontWeight.w800)),
            const SizedBox(height: 8),
            Text(l10n.coachInvitedYou, style: AppTextStyles.body14NoHeight.copyWith(color: AppColors.white70)),
          ],
        ),
      ),
    );
  }
}