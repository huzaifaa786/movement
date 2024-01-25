import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:noobz/api/all_client_api.dart';
import 'package:noobz/models/user_model.dart';

class AllClientController extends GetxController {
  static AllClientController instance = Get.find();
  List<User> compnyusers = [];

  @override
  void onInit() async {
    print('ssssssssssssssssssssssssssssssssssssssssss');
    await ShowallClient();
    super.onInit();
  }

  final allclientApi = AllClientApi();
  Future<void> ShowallClient() async {
    GetStorage box = GetStorage();
    String? apiToken = await box.read('api_token');

    print(apiToken);
    var response = await allclientApi.showallClient(apiToken);
    print('dffffffffffffffffsffsdfferugcetgebrygyasbgcfyuxfgyscegayuxgif');
    print(response);

    if (response != null && !response['error']) {
      print('Data received successfully');

      if (response['users'] != null) {
        List<dynamic> user = response['users'];
        for (var userdata in user) {
          User cmpnyuser = User.fromJson(userdata);
          compnyusers.add(cmpnyuser);
          print('hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh');
          print(compnyusers.toString());
        }
        update();
        // userList.assignAll(Compnyuser);
        print('User List Length: ${compnyusers.length}');
      } else {
        print('No users data found');
      }
    } else {
      print('response has an error');
    }
  }
  


}
