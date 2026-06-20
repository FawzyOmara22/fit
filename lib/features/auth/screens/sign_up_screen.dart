import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // 👈 استدعاء مكتبة الفايربيز
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import '../widgets/social_login_button.dart';
import '../widgets/auth_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // 1. تعريف الـ Form Key والـ Controllers وحالة التحميل
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  
  bool _isPasswordVisible = false;
  bool _isLoading = false; 

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // 2. دالة إنشاء حساب جديد
  Future<void> _registerUser() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      await credential.user?.updateDisplayName(_nameController.text.trim());

      print("تم إنشاء الحساب بنجاح: ${credential.user?.email}");
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('تم إنشاء الحساب بنجاح! يمكنك الآن تسجيل الدخول.'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 3),
          ),
        );
        
        Navigator.pop(context); // الرجوع لصفحة اللوجين
      }

    } on FirebaseAuthException catch (e) {
      String errorMessage = 'حدث خطأ ما، يرجى المحاولة لاحقاً';
      
      if (e.code == 'weak-password') {
        errorMessage = 'كلمة المرور ضعيفة جداً. استخدم 6 أحرف أو أكثر.';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'هذا البريد الإلكتروني مسجل بالفعل.';
      } else if (e.code == 'invalid-email') {
        errorMessage = 'صيغة البريد الإلكتروني غير صحيحة.';
      }

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    } catch (e) {
      print(e);
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

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
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const SizedBox(height: 48),

                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              gradient: const LinearGradient(
                                colors: [AppColors.gradientStart, AppColors.gradientEnd],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                            child: const Icon(Icons.fitness_center, color: Colors.white, size: 40),
                          ),
                          const SizedBox(height: 24),

                          Text(
                            l10n.kinetic,
                            textAlign: TextAlign.center,
                            style: AppTextStyles.logoTitle,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            l10n.login_subtitle, 
                            textAlign: TextAlign.center,
                            style: AppTextStyles.signUpSubtitle,
                          ),

                          const Spacer(flex: 1),

                          Container(
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(32),
                              boxShadow: [
                                BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 20, offset: const Offset(0, 10)),
                              ],
                            ),
                            child: Column(
                              children: [
                                SocialLoginButton(text: l10n.continue_apple, icon: const Icon(Icons.apple, color: Colors.white, size: 24), backgroundColor: AppColors.darkCharcoal, textColor: Colors.white, onPressed: () {}),
                                const SizedBox(height: 12),
                                SocialLoginButton(text: l10n.continue_google, icon: Container(padding: const EdgeInsets.all(2), decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle), child: const Icon(Icons.g_mobiledata, color: Colors.blue, size: 24)), backgroundColor: AppColors.inputBackground, textColor: AppColors.darkCharcoal, onPressed: () {}),
                                const SizedBox(height: 24),

                                // حقل الاسم الكامل
                                AuthTextField(
                                  label: l10n.full_name, 
                                  hint: l10n.full_name_hint,
                                  controller: _nameController,
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return 'يرجى إدخال الاسم الكامل';
                                    }
                                    if (value.trim().length < 3) {
                                      return 'الاسم يجب أن يكون 3 أحرف على الأقل';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 20),
                                
                                // 👈👈 تم دمج الـ RegExp بتاعك هنا للإيميل
                                AuthTextField(
                                  label: l10n.email_address, 
                                  hint: l10n.email_hint,
                                  controller: _emailController,
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return 'يرجى إدخال البريد الإلكتروني';
                                    }
                                    // الـ RegExp اللي طلبته بدون علامات السلاش الخاصة بالجافاسكريبت
                                    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                                    if (!emailRegex.hasMatch(value.trim())) {
                                      return 'يرجى إدخال بريد إلكتروني صحيح';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 20),
                                
                                // حقل كلمة المرور
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(l10n.password, style: AppTextStyles.label10Grey),
                                    const SizedBox(height: 8),
                                    Container(
                                      decoration: BoxDecoration(color: AppColors.inputBackground, borderRadius: BorderRadius.circular(16)),
                                      child: TextFormField(
                                        controller: _passwordController,
                                        obscureText: !_isPasswordVisible,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'يرجى إدخال كلمة المرور';
                                          }
                                          if (value.length < 6) {
                                            return 'يجب أن تتكون من 6 أحرف أو أرقام على الأقل';
                                          }
                                          final hasLetters = RegExp(r'[a-zA-Z]').hasMatch(value);
                                          final hasNumbers = RegExp(r'[0-9]').hasMatch(value);
                                          if (!hasLetters || !hasNumbers) {
                                            return 'كلمة المرور يجب أن تحتوي على حروف وأرقام معاً';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          hintText: l10n.password_hint,
                                          suffixIcon: IconButton(
                                            icon: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off, color: AppColors.mutedGrey),
                                            onPressed: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
                                          ),
                                          border: InputBorder.none,
                                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 32),

                                // زرار إنشاء الحساب
                                Container(
                                  width: double.infinity,
                                  height: 56,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(28),
                                    gradient: const LinearGradient(
                                      colors: [AppColors.gradientStart, AppColors.gradientEnd],
                                      begin: Alignment.centerRight,
                                      end: Alignment.centerLeft,
                                    ),
                                  ),
                                  child: ElevatedButton(
                                    onPressed: _isLoading ? null : _registerUser,
                                    style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, shadowColor: Colors.transparent, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28))),
                                    child: _isLoading 
                                      ? const SizedBox(
                                          width: 24, 
                                          height: 24, 
                                          child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2)
                                        )
                                      : Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(l10n.create_account, style: AppTextStyles.primaryButton16),
                                            const SizedBox(width: 8),
                                            const Icon(Icons.arrow_forward, color: Colors.white, size: 20),
                                          ],
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const Spacer(flex: 2),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(l10n.already_have_account, style: AppTextStyles.body14NoHeight),
                              GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: Text(l10n.log_in_text, style: AppTextStyles.body14BlueNoHeight),
                              ),
                            ],
                          ),
                          const SizedBox(height: 32),
                        ],
                      ),
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