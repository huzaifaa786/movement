import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noobz/routes/app_pages.dart';
import 'package:noobz/utils/colors.dart';
import 'package:noobz/views/auth/entercode/entercode_binding.dart';
import 'package:noobz/views/auth/entercode/entercode_view.dart';
import 'package:noobz/views/auth/forgetpassword/forget_password_binding.dart';
import 'package:noobz/views/auth/forgetpassword/forget_password_view.dart';
import 'package:noobz/views/auth/sigin/signin_binding.dart';
import 'package:noobz/views/auth/sigin/signin_view.dart';
import 'package:noobz/views/auth/signup/signup_view.dart';
import 'package:noobz/views/auth/signup/sigup_binding.dart';
import 'package:noobz/views/auth/withotp/withotp_binding.dart';
import 'package:noobz/views/auth/withotp/withotp_view.dart';
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

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
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
      title: "Noobz",
      initialBinding: EnterCodeBinding(),
      home: EnterCodeView(),
      getPages: AppPages.pages,
    );
  }
}


