import 'package:get/get.dart';
import 'package:noobz/routes/app_routes.dart';
import 'package:noobz/views/company/change_logo/company_profile_change_logo_binding.dart';
import 'package:noobz/views/company/change_logo/company_profile_change_logo_view.dart';

import 'package:noobz/views/company/profile/company_profile_binding.dart';
import 'package:noobz/views/company/profile/company_profile_view.dart';
import 'package:noobz/views/company/auth/signup/company_signup_binding.dart';
import 'package:noobz/views/company/auth/signup/company_signup_view.dart';
import 'package:noobz/views/company/proofdetail/proof_detail_binding.dart';
import 'package:noobz/views/company/proofdetail/proof_detail_view.dart';
import 'package:noobz/views/individual/add_event_due/add_event_due_binding.dart';
import 'package:noobz/views/individual/add_event_due/add_event_due_view.dart';
import 'package:noobz/views/individual/auth/entercode/entercode_binding.dart';
import 'package:noobz/views/individual/auth/entercode/entercode_view.dart';
import 'package:noobz/views/individual/auth/forgetpassword/forget_password_binding.dart';
import 'package:noobz/views/individual/auth/forgetpassword/forget_password_view.dart';
import 'package:noobz/views/individual/auth/sigin/signin_binding.dart';
import 'package:noobz/views/individual/auth/sigin/signin_view.dart';
import 'package:noobz/views/individual/auth/signup/signup_view.dart';
import 'package:noobz/views/individual/auth/signup/sigup_binding.dart';
import 'package:noobz/views/individual/auth/withotp/withotp_binding.dart';
import 'package:noobz/views/individual/auth/withotp/withotp_view.dart';
import 'package:noobz/views/individual/change_password/change_password_binding.dart';
import 'package:noobz/views/individual/change_password/change_password_view.dart';
import 'package:noobz/views/company/client/addclient/addclient_view.dart';
import 'package:noobz/views/company/client/allclient/allclient_binding.dart';
import 'package:noobz/views/company/client/allclient/allclient_view.dart';
import 'package:noobz/views/individual/home/Individual_home_binding.dart';
import 'package:noobz/views/individual/home/Individual_home_view.dart';
import 'package:noobz/views/individual/individual_profile.dart/individual_profile_binding.dart';
import 'package:noobz/views/individual/individual_profile.dart/individual_profile_view.dart';
import 'package:noobz/views/individual/notification/individual_notification_binding.dart';
import 'package:noobz/views/individual/notification/individual_notification_view.dart';
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
    GetPage(
      name: AppRoutes.enterCode,
      page: () => const EnterCodeView(),
      binding: EnterCodeBinding(),
    ),
    GetPage(
      name: AppRoutes.withOtp,
      page: () => const WithOtpView(),
      binding: WithOtpBinding(),
    ),
    GetPage(
      name: AppRoutes.companySignUp,
      page: () => const CompanySignUpView(),
      binding: CompanySignUpBinding(),
    ),
       GetPage(
      name: AppRoutes.proofDetail,
      page: () => const ProofDetailView(),
      binding: ProofDetailBinding(),
    ),
    GetPage(
      name: AppRoutes.individualHome,
      page: () => const IndividualHomeView(),
      binding: IndividualHomeBinding(),
    ),
    GetPage(
      name: AppRoutes.individualProfile,
      page: () => const IndividualProfileView(),
      binding: IndividualProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.addEventDue,
      page: () => const AddEventDueView(),
      binding: AddEventDueBinding(),
    ),
    GetPage(
      name: AppRoutes.membershipType,
      page: () => const MembershipView(),
      binding: MemberShipBinding(),
    ),
    GetPage(
      name: AppRoutes.individualnotification,
      page: () => const IndividualNoficationView(),
      binding: IndividualNotificationBinding(),
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
    ),
    GetPage(
      name: AppRoutes.companyProfile,
      page: () => const CompanyProfileView(),
      binding: CompanyProfileBinding(),
    ),
   
     GetPage(
      name: AppRoutes. companyProfileChangelogo,
      page: () => const CompanyProfileChangelogoView(),
      binding: CompanyProfileChangelogoBinding(),
    )
  ];
}
