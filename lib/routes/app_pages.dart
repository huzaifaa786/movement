import 'package:get/get.dart';
import 'package:noobz/routes/app_routes.dart';
import 'package:noobz/views/company/add_event/add_event_binding.dart';
import 'package:noobz/views/company/add_event/add_event_view.dart';
import 'package:noobz/views/company/addnotification/addnotification_binding.dart';
import 'package:noobz/views/company/addnotification/addnotification_view.dart';
import 'package:noobz/views/company/auth/signin/signin_binding.dart';
import 'package:noobz/views/company/auth/signin/signin_view.dart';
import 'package:noobz/views/company/add_payment/company_add_payment_binding.dart';
import 'package:noobz/views/company/add_payment/company_add_payment_view.dart';
import 'package:noobz/views/company/calendar/calendar_event_remainder/company_calendar_event_remainder_binding.dart';
import 'package:noobz/views/company/calendar/calendar_event_remainder/company_calendar_event_remainder_view.dart';
import 'package:noobz/views/company/calendar/company_calendar_binding.dart';
import 'package:noobz/views/company/calendar/company_calendar_view.dart';
import 'package:noobz/views/company/change_logo/company_profile_change_logo_binding.dart';
import 'package:noobz/views/company/change_logo/company_profile_change_logo_view.dart';
import 'package:noobz/views/company/client/addclient/addclient_binding.dart';
import 'package:noobz/views/company/home/company_home_binding.dart';
import 'package:noobz/views/company/home/company_home_view.dart';
import 'package:noobz/views/company/notification/company_notification_binding.dart';
import 'package:noobz/views/company/notification/company_notification_view.dart';

import 'package:noobz/views/company/profile/company_profile_binding.dart';
import 'package:noobz/views/company/profile/company_profile_view.dart';
import 'package:noobz/views/company/auth/signup/company_signup_binding.dart';
import 'package:noobz/views/company/auth/signup/company_signup_view.dart';
import 'package:noobz/views/company/proofdetail/proof_detail_binding.dart';
import 'package:noobz/views/company/proofdetail/proof_detail_view.dart';
import 'package:noobz/views/company/sale/sale_binding.dart';
import 'package:noobz/views/company/sale/sale_view.dart';
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
import 'package:noobz/views/individual/calender_event_remainder/calender_event_remainder_binding.dart';
import 'package:noobz/views/individual/calender_event_remainder/calender_event_remainder_view.dart';
import 'package:noobz/views/individual/change_password/change_password_binding.dart';
import 'package:noobz/views/individual/change_password/change_password_view.dart';
import 'package:noobz/views/company/client/addclient/addclient_view.dart';
import 'package:noobz/views/company/client/allclient/allclient_binding.dart';
import 'package:noobz/views/company/client/allclient/allclient_view.dart';
import 'package:noobz/views/individual/due_details/due_details_binding.dart';
import 'package:noobz/views/individual/due_details/due_details_view.dart';
import 'package:noobz/views/individual/duedate/individual_duedate_binding.dart';
import 'package:noobz/views/individual/duedate/individual_duedate_view.dart';
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
      name: AppRoutes.calenderscreen,
      page: () => const CalenderEventRemainderView(),
      binding: CalenderEventRemainderBinding(),
    ),
    GetPage(
      name: AppRoutes.individualduadatedetail,
      page: () => const DueDetailsView(),
      binding: DueDetailsBinding(),
    ),
    GetPage(
      name: AppRoutes.individualduadate,
      page: () => const IndividualDuedateView(),
      binding: IndividualDuedateBinding(),
    ),
    GetPage(
      name: AppRoutes.changePassword,
      page: () => const ChangePasswordView(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: AppRoutes.signIn,
      page: () => const CompanySignInView(),
      binding: CompanySignInBinding(),
    ),
    GetPage(
      name: AppRoutes.companysignin,
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
      name: AppRoutes.companyNotification,
      page: () => const CompanyNotificationView(),
      binding: CompanyNotificationBinding(),
    ),
     GetPage(
      name: AppRoutes.companyCalendar,
      page: () => const CompanyCalendarView(),
      binding: CompanyCalendarBinding(),
    ),
     GetPage(
      name: AppRoutes.companyCalendarEventRemainder,
      page: () => const CompanyCalendarEventRemainderView(),
      binding: CompanyCalendarEventRemainderBinding(),
    ),
    GetPage(
      name: AppRoutes.addclient,
      page: () => const AddClientView(),
      binding: AddClientBinding(),
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
      name: AppRoutes.companyProfileChangelogo,
      page: () => const CompanyProfileChangelogoView(),
      binding: CompanyProfileChangelogoBinding(),
    ),
    GetPage(
      name: AppRoutes.companyhome,
      page: () => const CompanyHomeView(),
      binding: CompanyHomeBinding(),
    ),
    GetPage(
      name: AppRoutes.companyaddpayment,
      page: () => const CompanyAddPaymentView(),
      binding: CompanyAddPaymentBinding(),
    ),
     GetPage(
      name: AppRoutes. companyaddevent,
      page: () => const CompanyAddEventView(),
      binding: CompanyAddEventBinding(),),
    GetPage(
      name: AppRoutes.sale,
      page: () => const SaleScreen(),
      binding: SaleBinding(),
    ),
    GetPage(
      name: AppRoutes.addnotification,
      page: () => const AddnotificationView(),
      binding: AddNotificationBinding(),
    )
  ];
}
