// ignore_for_file: unused_import
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:noobz/firebase_options.dart';
import 'package:noobz/helpers/loading.dart';
import 'package:noobz/routes/app_pages.dart';
import 'package:noobz/utils/colors.dart';
import 'package:noobz/views/individual/add_event_due/add_event_due_binding.dart';
import 'package:noobz/views/individual/add_event_due/add_event_due_view.dart';
import 'package:noobz/views/individual/auth/entercode/entercode_binding.dart';
import 'package:noobz/views/individual/auth/entercode/entercode_view.dart';
import 'package:noobz/views/individual/auth/forgetpassword/forget_password_binding.dart';
import 'package:noobz/views/individual/auth/forgetpassword/forget_password_view.dart';
import 'package:noobz/views/individual/auth/sigin/signin_binding.dart';
import 'package:noobz/views/individual/auth/sigin/signin_view.dart';
import 'package:noobz/views/individual/auth/signup/signup_view.dart';
import 'package:noobz/views/individual/auth/signup/sigup_binding.dart';
import 'package:noobz/views/individual/auth/withotp/withotp_binding.dart';
import 'package:noobz/views/individual/auth/withotp/withotp_view.dart';
import 'package:noobz/views/individual/change_password/change_password_binding.dart';
import 'package:noobz/views/individual/change_password/change_password_view.dart';
import 'package:noobz/views/individual/individual_profile.dart/individual_profile_binding.dart';
import 'package:noobz/views/individual/individual_profile.dart/individual_profile_view.dart';
import 'package:noobz/views/splash/splash_binding.dart';
import 'package:noobz/views/splash/splash_view.dart';
import 'package:noobz/views/company/client/allclient/allclient_binding.dart';
import 'package:noobz/views/company/client/allclient/allclient_view.dart';
import 'package:noobz/views/company/client/clientinfo/clientinfo_binding.dart';
import 'package:noobz/views/company/client/clientinfo/clientinfo_view.dart';

void main() async {
  //   final dio = Dio();
  // (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
  //   client.badCertificateCallback = (cert, host, port) => true;
  //   return client;
  // };

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  HttpOverrides.global = MyHttpOverrides();
  await GetStorage.init();
  runApp(const MyApp());
 // LoadingHelper.init();
  
  EasyLoading.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    EasyLoading.init();
    //LoadingHelper.init();
    return GetMaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.black,
        ),
        useMaterial3: true,
        fontFamily: 'Poppins',
      ),
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      title: "Noobz",
      initialBinding: SplashBinding(),
      home: SplashView(),
      getPages: AppPages.pages,
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
