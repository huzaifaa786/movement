import 'package:noobz/api/api.dart';
import 'package:noobz/utils/string.dart';

class ComapnyAuthApi {

   companyregister(  name, email, password, logo, lisense, service_type) async {
    var url = BASE_URL + 'company/register';
    print(url);

    var data;
    data = {
      'name': name.toString(),
      'email': email.toString(),
      'password': password.toString(),
      'logo': logo.toString(),
      'license': lisense.toString(),
      'service_type': service_type.toString(),
    };
    print(data.toString());
    var response = await Api.execute(
      url: url,
      data: data,
    );
    print(response.toString());
    return response;
  }

  
  Future<Map<String, dynamic>> companylogin(
    String email,
    String password,
  ) async {
    var url = BASE_URL + 'company/login';
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


  Future<Map<String, dynamic>> changePassword(
    String oldPassword,
    String newPassword,
    // String api_token
  ) async {
    
    var url = BASE_URL + 'changePassword';
    var data = {
      'password': oldPassword.toString(),
      'new_password': newPassword.toString(), 
      // 'api_token' : api_token.toString(),
    };

    var response = await Api.execute(
      url: url,
      data: data,
    );

    print('Change Password response:');
    print(response.toString());

    return response;
  }

}
