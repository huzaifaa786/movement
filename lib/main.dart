import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noobz/routes/app_pages.dart';
import 'package:noobz/utils/colors.dart';
import 'package:noobz/views/auth/forgetpassword/forget_password_binding.dart';
import 'package:noobz/views/auth/forgetpassword/forget_password_view.dart';
import 'package:noobz/views/auth/sigin/signin_binding.dart';
import 'package:noobz/views/auth/sigin/signin_view.dart';
import 'package:noobz/views/auth/signup/signup_view.dart';
import 'package:noobz/views/auth/signup/sigup_binding.dart';
import 'package:noobz/views/individual/change_password/change_password_binding.dart';
import 'package:noobz/views/individual/change_password/change_password_view.dart';
import 'package:noobz/views/individual/individual_profile.dart/individual_profile_binding.dart';
import 'package:noobz/views/individual/individual_profile.dart/individual_profile_view.dart';
import 'package:noobz/views/splash/splash_binding.dart';
import 'package:noobz/views/splash/splash_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
      initialBinding: ChangePasswordBinding(),
      home: ChangePasswordView(),
      getPages: AppPages.pages,
    );
  }
}


