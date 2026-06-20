import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // 👈 استدعاء الفايربيز
import 'package:kinetic/core/l10n/app_localizations.dart';
import 'package:kinetic/core/theme/app_colors.dart';
import 'package:kinetic/core/theme/app_text_style.dart';
import 'package:kinetic/features/auth/screens/reset_password_screen.dart';
import 'package:kinetic/features/auth/screens/sign_up_screen.dart';
import 'package:kinetic/features/dashboard/presentation/pages/main_layout_screen.dart';
// 👈 استدعي الصفحة الرئيسية بتاعتك هنا (هفترض مسارها كده، عدله لو مختلف)
import '../widgets/social_login_button.dart';
import '../widgets/auth_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // 1. تعريف الـ Form Key والـ Controllers وحالة التحميل
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  
  bool _isPasswordVisible = false;
  bool _isLoading = false; // للتحكم في ظهور مؤشر التحميل

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // دالة لتفريغ الحقول
  void _clearFields() {
    _emailController.clear();
    _passwordController.clear();
  }

  // 2. دالة تسجيل الدخول
  Future<void> _loginUser() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      
      print("تم تسجيل الدخول بنجاح: ${credential.user?.email}");
      
      // 👈👈 التوجيه لصفحة الـ Home بعد تسجيل الدخول بنجاح
      if (mounted) {
        Navigator.pushReplacement(
          context,
          // ⚠️ ملحوظة: غير HomeScreen لاسم كلاس صفحتك الرئيسية لو مختلفة
          MaterialPageRoute(builder: (context) => const MainLayoutScreen()), 
        );
      }

    } on FirebaseAuthException catch (e) {
      String errorMessage = 'حدث خطأ في تسجيل الدخول.';
      
      // معالجة الأخطاء بناءً على طلبك
      if (e.code == 'user-not-found' || e.code == 'invalid-credential') {
        errorMessage = 'البريد الإلكتروني أو كلمة المرور غير صحيحة.';
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        errorMessage = 'كلمة المرور غير صحيحة.';
        print('Wrong password provided for that user.');
      }

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage), backgroundColor: Colors.redAccent),
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
        child: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                // 3. تغليف الـ Column بـ Form
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                        style: AppTextStyles.loginSubtitle,
                      ),
                      
                      const Spacer(flex: 1),

                      Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(32),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.02),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            SocialLoginButton(
                              text: l10n.continue_apple,
                              icon: const Icon(Icons.apple, color: Colors.white, size: 24),
                              backgroundColor: AppColors.darkCharcoal,
                              textColor: Colors.white,
                              onPressed: () {},
                            ),
                            const SizedBox(height: 12),
                            
                            SocialLoginButton(
                              text: l10n.continue_google,
                              icon: Container(
                                padding: const EdgeInsets.all(2),
                                decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                                child: const Icon(Icons.g_mobiledata, color: Colors.blue, size: 24),
                              ),
                              backgroundColor: AppColors.inputBackground,
                              textColor: AppColors.darkCharcoal,
                              onPressed: () {},
                            ),
                            const SizedBox(height: 24),

                            Row(
                              children: [
                                const Expanded(child: Divider(color: AppColors.divider)),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16),
                                  child: Text(l10n.or, style: AppTextStyles.orDivider),
                                ),
                                const Expanded(child: Divider(color: AppColors.divider)),
                              ],
                            ),
                            const SizedBox(height: 24),

                            // 4. ربط حقل الإيميل بالكنترولر
                            AuthTextField(
                              label: l10n.email_address, 
                              hint: l10n.email_hint,
                              controller: _emailController,
                              validator: (value) {
                                if (value == null || value.isEmpty) return 'يرجى إدخال البريد الإلكتروني';
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(l10n.password, style: AppTextStyles.label10Grey),
                                    GestureDetector(
                                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ResetPasswordScreen())),
                                      child: Text(l10n.forgot_password, style: AppTextStyles.label10Blue),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Container(
                                  decoration: BoxDecoration(color: AppColors.inputBackground, borderRadius: BorderRadius.circular(16)),
                                  // 5. تحويل TextField لـ TextFormField
                                  child: TextFormField(
                                    controller: _passwordController,
                                    obscureText: !_isPasswordVisible,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) return 'يرجى إدخال كلمة المرور';
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
                                boxShadow: [
                                  BoxShadow(color: AppColors.gradientEnd.withOpacity(0.3), blurRadius: 12, offset: const Offset(0, 6))
                                ],
                              ),
                              child: ElevatedButton(
                                // 6. استدعاء دالة الدخول وإظهار مؤشر التحميل
                                onPressed: _isLoading ? null : _loginUser,
                                style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, shadowColor: Colors.transparent, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28))),
                                child: _isLoading
                                    ? const SizedBox(
                                        width: 24,
                                        height: 24,
                                        child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                                      )
                                    : Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(l10n.log_in, style: AppTextStyles.primaryButton16),
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
                          Text(l10n.dont_have_account, style: AppTextStyles.body14WithHeight),
                          GestureDetector(
                            // 👈👈 التعديل هنا: ننتظر العودة من صفحة التسجيل وبعدين نمسح الحقول
                            onTap: () async {
                              await Navigator.push(
                                context, 
                                MaterialPageRoute(builder: (context) => const SignUpScreen())
                              );
                              // أول ما المستخدم يرجع لصفحة الدخول، نمسح الحقول
                              _clearFields();
                            },
                            child: Text(l10n.sign_up, style: AppTextStyles.body14BlueWithHeight),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}