import 'package:get/get.dart';
import 'package:noobz/api/event_api.dart';
import 'package:noobz/models/event_model.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderEventRemainderController extends GetxController {
  static CalenderEventRemainderController instance = Get.find();
  EventApi eventApi = new EventApi();
  List<EventModel> events = [];
  List<EventModel> eventss = [];
  EventModel? event;
  CalendarFormat format = CalendarFormat.month;
  var format1 = 'month';
  DateTime ourdate = DateTime.now();
  DateTime today = DateTime.now();
  DateTime? rangeStart;
  DateTime? rangeEnd;

  void onFormatChanged(DateTime date) {
    today = date;
    ourdate = date;

    update();
  }

  void onDaySelected(DateTime day, DateTime foucsedDay) async {
    today = day;
    ourdate = day;
    dayevents(today);
    update();
  }

  dayevents(DateTime day) {
    var first_event = events[1];
    print(events[0].schedule);
    print(first_event.schedule);
    // print(DateTime.parse(events[0].schedule['event_date'])
    //             .toLocal()
    //             .toString()
    //             .split(' ')[0]);
    // var myevents = events
    //     .where((event) => event.schedule.any((schedule) =>
    //         DateTime.parse(schedule['event_date']!)
    //             .toLocal()
    //             .toString()
    //             .split(' ')[0] ==
    //         day.toLocal().toString().split(' ')[0]))
    //     .toList();

    // print('kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk');
    // print(events);
    // print(myevents);

    update();
  }

  void onRangeSelected(start, end, focusedDay) {
    rangeStart = start;
    rangeEnd = end;
    today = focusedDay;
    ourdate = focusedDay;
    if (end == null) {
    } else {}
    update();
  }

  void onInit() {
    {
      print('ggggggggggggggggggggggggggggggggggggggggggggggg');
      getEvents();
      update();
    }
    super.onInit();
  }

  Future<List<dynamic>> getEvents() async {
    try {
      var response = await eventApi.getAllEvents();

      if (!response['error']) {
        List<dynamic> event2 = response['events'];
        for (var eventData in event2) {
          EventModel event = EventModel.fromJson(eventData);
          events.add(event);
          print('hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh');
          print(event.schedule);
        }
      } else {
        print(response['error_data']);
      }

      return [];
    } catch (e) {
      print('Exception while fetching events: $e');
      return [];
    }
  }
}
