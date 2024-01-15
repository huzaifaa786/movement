import 'package:noobz/api/api.dart';
import 'package:noobz/models/user_model.dart';
import 'package:noobz/utils/string.dart';

class UserApi {
  register(
    name,
    email,
    password,
  ) async {
    var url = BASE_URL + 'register';
    var data;
    data = {
      'name': name.toString(),
      'email': email.toString(),
      'password': password.toString(),
      'account_type': 'INDIVIDUAL',
      'login_type': 'EMAIL',
    };

    var response = await Api.execute(
      url: url,
      data: data,
    );
    print('ddddddddddddddddddddddddddddddddddddddddddddddd');
    print(response.toString());
    return response;
  }

  Future<Map<String, dynamic>> login(
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

    print('Login response:');
    print(response.toString());

    return response;
  }
}
