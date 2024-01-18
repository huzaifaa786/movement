import 'dart:convert';
import 'dart:io';

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
    print(response.toString());
    return response;
  }

  //  companyregister(  name, email, password, logo, lisense, service_type) async {
  //   var url = BASE_URL + 'company/register';
  //   print(url);

  //   var data;
  //   data = {
  //     'name': name.toString(),
  //     'email': email.toString(),
  //     'password': password.toString(),
  //     'logo': logo.toString(),
  //     'license': lisense.toString(),
  //     'service_type': service_type.toString(),
  //   };
  //   print(data.toString());
  //   var response = await Api.execute(
  //     url: url,
  //     data: data,
  //   );
  //   print(response.toString());
  //   return response;
  // }

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


  // Future<Map<String, dynamic>> companylogin(
  //   String email,
  //   String password,
  // ) async {
  //   var url = BASE_URL + 'company/login';
  //   var data = {
  //     'email': email,
  //     'password': password,
  //   };

  //   var response = await Api.execute(
  //     url: url,
  //     data: data,
  //   );

  //   print('Login response:');
  //   print(response.toString());

  //   return response;
  // }
}
