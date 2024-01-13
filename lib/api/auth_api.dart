import 'package:noobz/api/api.dart';
import 'package:noobz/models/user_model.dart';
import 'package:noobz/utils/string.dart';

class UserApi {
  register(
    name,
    email,
    password,
  ) async {print('ffffffffffffffffffffffffffffffffffffffffff');
    var url = BASE_URL + 'register';
    var data;
    data = {
      'name': name.toString(),
      'email': email.toString(),
      'password': password.toString(),
    };

    var response = await Api.execute(
      url: url,
      data: data,
    );
    print('ddddddddddddddddddddddddddddddddddddddddddddddd');
    print(response.toString());
    if (!response['error']) {
      //  User user = User(response['user']);

      return true;
    } else {
      return false;
    }
  }
}
