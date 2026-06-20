import 'package:flutter/material.dart';
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart'; // <--- استدعاء كلاس الألوان
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/auth/screens/login_screen.dart';

class SecureAccountScreen extends StatefulWidget {
  const SecureAccountScreen({super.key});

  @override
  State<SecureAccountScreen> createState() => _SecureAccountScreenState();
}

class _SecureAccountScreenState extends State<SecureAccountScreen> {
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.background,
      resizeToAvoidBottomInset: true,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),
                        
                        Row(
                          children: [
                            IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: const Icon(Icons.arrow_back, color: AppColors.primary),
                            ),
                            const SizedBox(width: 8),
                            Text(l10n.reset_password, style: AppTextStyles.title18Dark),
                          ],
                        ),
                        const SizedBox(height: 32),
                        
                        Text(l10n.security_first, style: AppTextStyles.label10Blue),
                        const SizedBox(height: 8),
                        Text(l10n.secure_account, style: AppTextStyles.heading36Black),
                        const SizedBox(height: 16),
                        Text(l10n.secure_desc, style: AppTextStyles.body16),
                        const SizedBox(height: 32),

                        _buildPasswordField(l10n.new_password, _isPasswordVisible, () {
                          setState(() => _isPasswordVisible = !_isPasswordVisible);
                        }),
                        const SizedBox(height: 20),
                        
                        _buildPasswordField(l10n.confirm_password, _isConfirmPasswordVisible, () {
                          setState(() => _isConfirmPasswordVisible = !_isConfirmPasswordVisible);
                        }),
                        
                        const SizedBox(height: 24),

                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10)]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(l10n.security_req, style: AppTextStyles.label10GreyDark),
                              const SizedBox(height: 16),
                              _ReqItem(text: l10n.min_8_chars, isChecked: true),
                              _ReqItem(text: l10n.special_symbol, isChecked: false),
                              _ReqItem(text: l10n.uppercase_letter, isChecked: false),
                              _ReqItem(text: l10n.match_password, isChecked: false),
                            ],
                          ),
                        ),
                        const Spacer(),

                        Container(
                          width: double.infinity, height: 56,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(28), color: AppColors.gradientStart),
                          child: ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, shadowColor: Colors.transparent), child: Text(l10n.update_password, style: AppTextStyles.primaryButton18)),
                        ),
                        const SizedBox(height: 16),
                        
                        Center(
                          child: GestureDetector(
                            onTap: () {
                             Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => const LoginScreen()),
                                (route) => false,
                              );
                            },
                            child: Text(l10n.return_to_login, style: AppTextStyles.body14BlueNoHeight),
                          ),
                        ),
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

  Widget _buildPasswordField(String label, bool isVisible, VoidCallback onToggle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.label10GreyDark),
        const SizedBox(height: 8),
        Container(
          height: 56,
          decoration: BoxDecoration(color: AppColors.inputBackground, borderRadius: BorderRadius.circular(16)),
          child: TextField(
            obscureText: !isVisible,
            decoration: InputDecoration(
              suffixIcon: IconButton(icon: Icon(isVisible ? Icons.visibility : Icons.visibility_off), onPressed: onToggle),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            ),
          ),
        ),
      ],
    );
  }
}

class _ReqItem extends StatelessWidget {
  final String text;
  final bool isChecked;
  const _ReqItem({required this.text, required this.isChecked});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(isChecked ? Icons.check_circle : Icons.circle_outlined, color: isChecked ? AppColors.primary : AppColors.borderGrey, size: 20),
          const SizedBox(width: 12),
          Text(text, style: isChecked ? AppTextStyles.reqItemChecked : AppTextStyles.reqItemUnchecked),
        ],
      ),
    );
  }
}