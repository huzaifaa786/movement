import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:noobz/api/api.dart';
import 'package:noobz/api/due_dates_api.dart';
import 'package:noobz/utils/string.dart';

class IndividualDuedateController extends GetxController {
  static IndividualDuedateController instance = Get.find();
  List<Map<String, dynamic>> dueDates = [];
  var data;
  var URL = BASE_URL + 'userDetails';
  DueDatesApi dueDatesApi = new DueDatesApi();
  GetStorage box = GetStorage();

  String user_name = '';
  @override
  void onInit() {
    super.onInit();
    fetchDueDates();
    getUserName();
    update();
  }

  fetchDueDates() async {
    dueDates = await dueDatesApi.fetchDueDates();
    update();
    // print(dueDates);
  }

  getUserName() async {
    String api_token = box.read('api_token');
    data = {'api_token': api_token};
    var response = await Api.execute(url: URL, data: data);
    user_name = response['user']['name'];
    update();
  }
}
