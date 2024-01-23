import 'package:noobz/api/api.dart';
import 'package:noobz/utils/string.dart';

class AllClientApi {
  showallClient(company_api_token) async {
    var url = BASE_URL + 'company/users';

    var data;
    data = {
      'api_token': company_api_token,
    };
    print(data);
    var response = await Api.execute(
      url: url,
      data: data,
    );

    print(response.toString());
    if (!response['error']) {
      print('client showing sussesfully');
      return response; 
    } else {
      print('client  not  showing sussesfully');

      return null; 
    }
  }
}
