import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:noobz/api/all_client_api.dart';
import 'package:noobz/models/company_model.dart';

class AllClientController extends GetxController {
  static AllClientController instance = Get.find();

  RxList<CompanyUser> userList = RxList<CompanyUser>([]);

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

    CompanyUser? companyUser;
    if (response != null && !response['error']) {
      print('Data received successfully');

      if (response['users'] != null) {
        List<dynamic> user = response['users'];
        
        List<CompanyUser> users = List<CompanyUser>.from(
          response['users'].map((user) => CompanyUser.fromJson(user)),
        );
        print('ssssssssssssssssssssssssssssssssss');
        print(users);
        userList.assignAll(users);
        print('User List Length: ${userList.length}');
      } else {
        print('No users data found');
      }
    } else {
      print('responce have error');
    }
  }
  // catch (error) {
  //   print('Error registering user: $error');
  // }
}
