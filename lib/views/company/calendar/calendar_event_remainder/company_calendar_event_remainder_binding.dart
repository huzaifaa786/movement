import 'package:get/get.dart';
import 'package:noobz/views/company/calendar/calendar_event_remainder/company_calendar_event_remainder_controller.dart';
import 'package:noobz/views/individual/calender_event_remainder/calender_event_remainder_controller.dart';
import 'package:noobz/views/individual/duedate/individual_duedate_controller.dart';
import 'package:noobz/views/individual/home/Individual_home_controller.dart';
import 'package:noobz/views/language/language_controller.dart';

class CompanyCalendarEventRemainderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CompanyCalendarEventRemainderController());
  }
}
