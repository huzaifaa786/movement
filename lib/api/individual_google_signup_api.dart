// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:noobz/api/api.dart';
import 'package:noobz/models/user_model.dart';
import 'package:noobz/utils/string.dart';

const BASE_URL = "https://noobz.ezmoveportal.com/api/";

String userEmail = 'camelinsand101@gmail.com';
String userPassword = 'camel123';

class GoogleSignUpApi {
  Future<Map<String, dynamic>> signUpWithGoogle() async {
    final GoogleSignInAccount? googleSignInAccount =
        await GoogleSignIn().signIn();

    if (googleSignInAccount == null) {
      return {'error': true, 'message': 'Google Sign Up canceled by user'};
    }

    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final String accessToken = googleSignInAuthentication.accessToken!;
    final String idToken = googleSignInAuthentication.idToken!;

    var url = BASE_URL + 'googleSignUp';
    var data = {
      'access_token': accessToken,
      'id_token': idToken,
      'email': userEmail,
      'password': userPassword,
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
}

class User {
  final String id;
  final String name;
  final String email;
  final String api_token;

  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.api_token});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      api_token: json['api_token'],
    );
  }
}
