import 'package:noobz/api/api.dart';
import 'package:noobz/models/user_model.dart';
import 'package:noobz/utils/string.dart';

class LoginApi {
  login(
    String email,
    String password,
  ) async {
    var url = BASE_URL + 'login';
    var data = {
      'email': email,
      'password': password,
    };

    var response = await Api.execute(
      url: url,
      data: data,
    );
    print('sssssssssssssssssssssssssssssssssssssssssssssssssss');
    if (!response['error']) {
      return true;
    } else {
      return false;
    }
  }
}
