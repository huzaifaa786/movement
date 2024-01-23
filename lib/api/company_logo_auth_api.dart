import 'package:noobz/api/api.dart';
import 'package:noobz/models/company_model.dart';
import 'package:noobz/utils/string.dart';
import 'package:get_storage/get_storage.dart';

class ComapnyAuthLogoApi {
  companyregisterlogo(
    logo,
  ) async {
    GetStorage box = GetStorage();
    String? api_token = box.read('api_token');
    print('gggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg');
    print(api_token);
    print(logo);
    var url = BASE_URL + 'company/changeLogo';
    print(url);

    var data;
    data = {
      'logo': logo.toString(),
      'api_token': api_token.toString(),
    };
    print(data);
    print(data.toString());
    var response = await Api.execute(
      url: url,
      data: data,
    );
    print(response.toString());
    return response;


//     if (logo != null && api_token != null) {
//   var data = {
//     'logo': logo.toString(),
//     'api_token': api_token.toString(),
//   };
//   print(data);

 
// } else {
//   print('Error: logo or api_token is null.');
  
// }

  }
}
