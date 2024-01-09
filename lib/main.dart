import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noobz/routes/app_pages.dart';
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
      initialBinding: ClientInfoBinding(),
      home: ClientInfo(),
      getPages: AppPages.pages,
    );
  }
}
