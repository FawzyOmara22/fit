import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/coaching/models/coaching_model.dart';


// دالة مساعدة لترجمة مميزات The Kinetic Edge القادمة من الـ API
String _getLocalizedText(String key, AppLocalizations l10n) {
  switch (key) {
    case 'personalizedPlans': return l10n.personalizedPlans;
    case 'tailoredToYourBody': return l10n.tailoredToYourBody;
    case 'formChecks': return l10n.formChecks;
    case 'aiAssistedVideo': return l10n.aiAssistedVideo;
    case 'weeklyCheckIns': return l10n.weeklyCheckIns;
    case 'stayConsistent': return l10n.stayConsistent;
    default: return key;
  }
}

/// 1. بانر المحادثة النشطة (Active Chat Banner)
class ActiveChatBanner extends StatelessWidget {
  final AppLocalizations l10n;
  const ActiveChatBanner({Key? key, required this.l10n}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF2361E3), Color(0xFF60A5FA)], // تدريج أزرق ساطع يطابق التصميم
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(l10n.activeChat.toUpperCase(), style: AppTextStyles.label10Blue.copyWith(color: Colors.white70, letterSpacing: 1.5)),
                const SizedBox(height: 8),
                Text(l10n.messageYourCoaches, style: AppTextStyles.cardTitle18.copyWith(color: Colors.white)),
                const SizedBox(height: 4),
                Text('${l10n.unreadUpdates} Sarah', style: AppTextStyles.body14NoHeight.copyWith(color: Colors.white70)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), shape: BoxShape.circle),
            child: const Icon(Icons.chat_bubble_outline, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

/// 2. قسم "مدربيني"
class MyCoachesSection extends StatelessWidget {
  final List<CoachModel> coaches;
  final AppLocalizations l10n;
  const MyCoachesSection({Key? key, required this.coaches, required this.l10n}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(l10n.myCoaches, style: AppTextStyles.cardTitle18),
            Text(l10n.viewAll, style: AppTextStyles.body14BlueNoHeight),
          ],
        ),
        const SizedBox(height: 16),
        ...coaches.map((coach) => _CoachListTile(coach: coach, l10n: l10n)).toList(),
      ],
    );
  }
}

class _CoachListTile extends StatelessWidget {
  final CoachModel coach;
  final AppLocalizations l10n;
  const _CoachListTile({required this.coach, required this.l10n});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Row(
        children: [
          CircleAvatar(radius: 26, backgroundImage: NetworkImage(coach.avatarUrl)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(coach.name, style: AppTextStyles.addExCardTitle),
                const SizedBox(height: 2),
                Text(coach.specialty, style: AppTextStyles.body14Height.copyWith(fontSize: 13)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(color: AppColors.lightBlueWhite, borderRadius: BorderRadius.circular(20)),
            child: Text(l10n.message.toUpperCase(), style: AppTextStyles.label10Blue.copyWith(fontWeight: FontWeight.w800)),
          ),
        ],
      ),
    );
  }
}

/// 3. قسم استكشاف المدربين (سكرول أفقي - تم تكبير الكروت)
class ExploreCoachesSection extends StatelessWidget {
  final List<ExploreCoachModel> coaches;
  final AppLocalizations l10n;
  const ExploreCoachesSection({Key? key, required this.coaches, required this.l10n}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.exploreTopCoaches, style: AppTextStyles.cardTitle18),
        const SizedBox(height: 4),
        Text(l10n.expertGuidance, style: AppTextStyles.body14Height.copyWith(fontSize: 13)),
        const SizedBox(height: 16),
        SizedBox(
          height: 370, // زودنا الارتفاع الكلي للكارت عشان يستوعب الصورة الكبيرة
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: coaches.length,
            itemBuilder: (context, index) {
              final coach = coaches[index];
              return Container(
                width: 280, // عرض الكارت بقى أكبر بكثير عشان يطابق الصورة
                margin: const EdgeInsets.only(right: 16),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        // كبرنا ارتفاع الصورة لـ 220
                        Image.network(coach.imageUrl, height: 220, width: double.infinity, fit: BoxFit.cover),
                        Positioned(
                          bottom: 12,
                          left: 12,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                            decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(12)),
                            child: Text(coach.tag, style: AppTextStyles.label10Blue.copyWith(color: Colors.white, fontSize: 10, letterSpacing: 0.5)),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16), // زودنا الحواف الداخلية (Padding)
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(coach.name, style: AppTextStyles.cardTitle18), // كبرنا اسم المدرب
                          const SizedBox(height: 6),
                          Text(coach.experience, style: AppTextStyles.body14Height.copyWith(fontSize: 13), maxLines: 1, overflow: TextOverflow.ellipsis),
                          const SizedBox(height: 20), // مسافة أكبر قبل الزرار
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(24)), // شكل الزرار بقى بيضاوي أكتر
                            alignment: Alignment.center,
                            child: Text(l10n.connect, style: AppTextStyles.label10Blue.copyWith(color: Colors.white, fontSize: 14)), // كبرنا خط الزرار
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
/// 4. قسم البرامج المميزة
class SignatureProgramsSection extends StatelessWidget {
  final List<ProgramModel> programs;
  final AppLocalizations l10n;
  const SignatureProgramsSection({Key? key, required this.programs, required this.l10n}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainProgram = programs.firstWhere((p) => p.isMain);
    final subPrograms = programs.where((p) => !p.isMain).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.signaturePrograms, style: AppTextStyles.cardTitle18),
        const SizedBox(height: 16),
        
        // الكارت الرئيسي (صورة الخلفية)
        Container(
          width: double.infinity,
          height: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
              image: AssetImage('assets/images/Strength Program.png'), // استخدم صورتك كخلفية
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(colors: [Colors.black.withOpacity(0.8), Colors.transparent], begin: Alignment.centerLeft, end: Alignment.centerRight),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('ELITE TIER', style: AppTextStyles.label10Blue.copyWith(letterSpacing: 2)),
                const SizedBox(height: 8),
                Text(mainProgram.title, style: AppTextStyles.heroHeadingItalic.copyWith(color: Colors.white, fontSize: 24, height: 1.1)),
                const Spacer(),
                Text('${l10n.withCoach} ${mainProgram.subtitle}', style: AppTextStyles.body14NoHeight.copyWith(color: Colors.white70, fontSize: 12)),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        
        // الكروت الفرعية
        Row(
          children: subPrograms.map((prog) {
            return Expanded(
              child: Container(
                margin: EdgeInsets.only(right: prog == subPrograms.last ? 0 : 12),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(prog.title, style: AppTextStyles.addExCardTitle.copyWith(fontSize: 14)),
                    const SizedBox(height: 4),
                    Text(prog.subtitle, style: AppTextStyles.body14Height.copyWith(fontSize: 11)),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(prog.price, style: AppTextStyles.label10Blue.copyWith(fontSize: 14)),
                        const Icon(Icons.arrow_forward, color: AppColors.primary, size: 16),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

/// 5. قسم "The Kinetic Edge"
class KineticEdgeSection extends StatelessWidget {
  final List<FeatureModel> features;
  final AppLocalizations l10n;
  const KineticEdgeSection({Key? key, required this.features, required this.l10n}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(color: const Color(0xFFF1F4F8), borderRadius: BorderRadius.circular(24)),
      child: Column(
        children: [
          Text(l10n.theKineticEdge, style: AppTextStyles.cardTitle18),
          const SizedBox(height: 4),
          Text(l10n.whyWorkWithCertifiedCoach, style: AppTextStyles.body14Height.copyWith(fontSize: 13)),
          const SizedBox(height: 24),
          
          ...features.map((feat) {
            IconData icon = Icons.check;
            if (feat.titleKey == 'personalizedPlans') icon = Icons.open_with;
            if (feat.titleKey == 'formChecks') icon = Icons.videocam_outlined;
            if (feat.titleKey == 'weeklyCheckIns') icon = Icons.calendar_today_outlined;

            return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                    child: Icon(icon, color: AppColors.primary, size: 20),
                  ),
                  const SizedBox(height: 8),
                  Text(_getLocalizedText(feat.titleKey, l10n), style: AppTextStyles.addExCardTitle.copyWith(fontSize: 13)),
                  const SizedBox(height: 2),
                  Text(_getLocalizedText(feat.subtitleKey, l10n), style: AppTextStyles.body14Height.copyWith(fontSize: 11), textAlign: TextAlign.center),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}

