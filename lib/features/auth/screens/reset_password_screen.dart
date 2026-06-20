import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart'; // <--- استدعاء كلاس الألوان
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/auth/screens/secure_account_screen.dart';
import '../widgets/auth_text_field.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 16, bottom: 16),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: IconButton(
                                  onPressed: () => Navigator.pop(context),
                                  icon: const Icon(Icons.arrow_back, color: AppColors.primary),
                                ),
                              ),
                              Text(
                                l10n.reset_password,
                                style: AppTextStyles.appBarTitle,
                              ),
                            ],
                          ),
                        ),
                        
                        const Spacer(),

                        Container(
                          width: 80, 
                          height: 80, 
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24), 
                            gradient: const LinearGradient(colors: [AppColors.gradientStart, AppColors.gradientEnd])
                          ), 
                          child: const Icon(Icons.fitness_center, color: Colors.white, size: 40)
                        ),
                        const SizedBox(height: 16),
                        const Text("KINETIC", style: AppTextStyles.logoSubtitle),
                        const SizedBox(height: 32),

                        Text(l10n.locked_out, style: AppTextStyles.heading36),
                        const SizedBox(height: 16),
                        Text(l10n.reset_instructions, textAlign: TextAlign.center, style: AppTextStyles.resetInstructions),
                        const SizedBox(height: 48),

                        AuthTextField(label: l10n.email_address, hint: l10n.email_hint),
                        const SizedBox(height: 32),

                        Container(
                          width: double.infinity, 
                          height: 56,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28), 
                            gradient: const LinearGradient(
                              colors: [AppColors.gradientStart, AppColors.gradientEnd],
                               begin: Alignment.centerRight,
                                end: Alignment.centerLeft,
                            )
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const SecureAccountScreen()),
                              );
                            }, 
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, shadowColor: Colors.transparent), 
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(l10n.send_reset_link, style: AppTextStyles.primaryButton18),
                                const SizedBox(width: 8),
                                const Icon(Icons.arrow_forward, color: Colors.white, size: 20),
                              ],
                            )
                          ),
                        ),
                        const SizedBox(height: 24),
                        GestureDetector(onTap: () => Navigator.pop(context), child: Text(l10n.back_to_login, style: AppTextStyles.textButton14Spacing)),

                        const Spacer(),

                        const Row(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.person), Icon(Icons.person), Icon(Icons.person), SizedBox(width: 8), Text("+12k", style: AppTextStyles.boldText)]),
                        Text(l10n.join_athletes, style: AppTextStyles.smallCaption11),
                        const SizedBox(height: 24),
                        Text.rich(TextSpan(children: [TextSpan(text: l10n.need_help, style: AppTextStyles.spanGrey), TextSpan(text: l10n.kinetic_support, style: AppTextStyles.spanBlueUnderline)]), textAlign: TextAlign.center, style: AppTextStyles.caption12),
                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}