import 'package:get_storage/get_storage.dart';
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

    User user = User.fromJson(response['user']);
    GetStorage box = GetStorage();
    box.write('api_token', user.api_token);
    box.write('user_id', user.id);

    return response;
  }

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

    if (!response['error']) {
      User user = User.fromJson(response['user']);
      GetStorage box = GetStorage();
      box.write('api_token', user.api_token);
      box.write('user_id', user.id);
      print(box.read('api_token'));
    }

    return response;
  }

  Future<Map<String, dynamic>> changePassword(
    String oldPassword,
    String newPassword,
    String apiToken,

    // String api_token
  ) async {
    GetStorage box = GetStorage();
    String? apiToken = box.read('api_token');
    var url = BASE_URL + 'changePassword';
    var data = {
      'password': oldPassword.toString(),
      'new_password': newPassword.toString(),
      'api_token': apiToken.toString(),
    };

    var response = await Api.execute(
      url: url,
      data: data,
    );

    print('Change forgot Password response:');
    print(response.toString());

    return response;
  }


    Future forgotPassword(String emailAddres, ) async {

    var url = BASE_URL + 'forgetpassword';
    var data = {
      'email' : emailAddres.toString(),
    };

    var response = await Api.execute(
      url: url,
      data: data,
    );

    print('Change Password response:');
    print(response.toString());

    return response;
  }



    Future verifyOtp(String otpAddres, ) async {

    var url = BASE_URL + 'verifyOtp';
    var data = {
      'otp' : otpAddres.toString(),
    };

    var response = await Api.execute(
      url: url,
      data: data,
    );

    print('Change Otp response:');
    print(response.toString());

    return response;
  }
}
