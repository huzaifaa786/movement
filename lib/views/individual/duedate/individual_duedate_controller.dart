import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:noobz/api/due_dates_api.dart';
import 'package:noobz/helpers/loading.dart';

class IndividualDuedateController extends GetxController {
  static IndividualDuedateController instance = Get.find();
  List<Map<String, dynamic>> dueDates = [];

  DueDatesApi dueDatesApi = new DueDatesApi();
  GetStorage box = GetStorage();

  String user_name = '';
  @override
  void onInit() {
    super.onInit();
    fetchDueDates();
    user_name = box.read('name');
    update();
  }

  fetchDueDates() async {
    LoadingHelper.show();
    dueDates = await dueDatesApi.fetchDueDates();
    update();
    LoadingHelper.dismiss();
  }
}
