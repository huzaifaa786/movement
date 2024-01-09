import 'package:get/get.dart';
import 'package:noobz/routes/app_routes.dart';
import 'package:noobz/views/company/client/allclient/allclient_binding.dart';
import 'package:noobz/views/company/client/allclient/allclient_view.dart';
import 'package:noobz/views/company/client/addclient/addclient_view.dart';
import 'package:noobz/views/individual/home/Individual_home_binding.dart';
import 'package:noobz/views/individual/home/Individual_home_view.dart';
import 'package:noobz/views/individual/individual_profile.dart/individual_profile_binding.dart';
import 'package:noobz/views/individual/individual_profile.dart/individual_profile_view.dart';
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
      name: AppRoutes.individualHome,
      page: () => const IndividualHomeView(),
      binding: IndividualHomeBinding(),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => const IndividualProfileView(),
      binding: IndividualProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.membershipType,
      page: () => const MembershipView(),
      binding: MemberShipBinding(),
    ),
    GetPage(
      name: AppRoutes.addclient,
      page: () => const AddClientView(),
      binding: MemberShipBinding(),
    ),
      GetPage(
      name: AppRoutes.allclient,
      page: () => const AllclientView(),
      binding: AllClientBinding(),
    )
  ];
}
