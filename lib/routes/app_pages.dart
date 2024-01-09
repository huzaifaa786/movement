import 'package:get/get.dart';
import 'package:noobz/routes/app_routes.dart';
import 'package:noobz/views/auth/forgetpassword/forget_password_binding.dart';
import 'package:noobz/views/auth/forgetpassword/forget_password_view.dart';
import 'package:noobz/views/auth/sigin/signin_binding.dart';
import 'package:noobz/views/auth/sigin/signin_view.dart';
import 'package:noobz/views/auth/signup/signup_view.dart';
import 'package:noobz/views/auth/signup/sigup_binding.dart';
import 'package:noobz/views/language/language_binding.dart';
import 'package:noobz/views/language/language_view.dart';
import 'package:noobz/views/splash/splash_binding.dart';
import 'package:noobz/views/splash/splash_view.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.language,
      page: () => const LanguageView(),
      binding: LanguageBinding(),
    ),
    
    GetPage(
      name: AppRoutes.signUp,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
    ),
     GetPage(
      name: AppRoutes.signIn,
      page: () => const SignInView(),
      binding: SignInBinding(),
    ),
      GetPage(
      name: AppRoutes.forgetPassword,
      page: () => const ForgetPasswordView(),
      binding: ForgetPasswordBinding(),
    ),
  ];
}
