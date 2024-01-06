import 'package:get/get.dart';
import 'package:noobz/routes/app_routes.dart';
import 'package:noobz/views/language/language_binding.dart';
import 'package:noobz/views/language/language_view.dart';
import 'package:noobz/views/membership/membership_binding.dart';
import 'package:noobz/views/membership/membership_view.dart';
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
      name: AppRoutes.membershipType,
      page: () => const MembershipView(),
      binding: MemberShipBinding(),
    ),
  ];
}
