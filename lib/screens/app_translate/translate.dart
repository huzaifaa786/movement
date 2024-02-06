// ignore_for_file: prefer_const_constructors, constant_identifier_names, camel_case_types

import 'package:academy_app/constants.dart';
import 'package:academy_app/screens/app_translate/translate_method.dart';
import 'package:academy_app/screens/tabs_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_translator/google_translator.dart';
import 'dart:ui' as ui;

class TranslateScreen extends StatefulWidget {
  const TranslateScreen({super.key, this.lang});

  final String? lang;

  @override
  State<TranslateScreen> createState() => _TranslateScreenState();
}

enum translateMethod { English, Swedish }

class _TranslateScreenState extends State<TranslateScreen> {
  translateMethod? _site;
  toggleplan(translateMethod value) {
    setState(() {
      _site = value;
    });
  }

  navigate() {
    Navigator.pushNamedAndRemoveUntil(
        context, '/home', ModalRoute.withName("/home"));
    setState(() {});
  }

  @override
  void initState() {
    GetStorage box = GetStorage();
    _site = box.read('Locale') != 'sv'
        ? translateMethod.English
        : translateMethod.Swedish;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: ui.TextDirection.ltr,
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          forceMaterialTransparency: true,
          title: Text('Languages').translate(),
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              TranslateMethod(
                title: 'English'.tr,
                groupvalue: _site,
                value: translateMethod.English,
                onchaged: () async {
                  await toggleplan(translateMethod.English);
                  GetStorage box = GetStorage();
                  await box.write('Locale', 'en');
                  GoogleTranslatorController.init(
                      'AIzaSyDbNMn6QSmOy3co3IaFXu09hJGBuNihHFI', Locale('ur'),
                      cacheDuration: Duration(), translateTo: Locale('en'));
                  setState(() {});
                  navigate();
                },
              ),
              TranslateMethod(
                title: 'Swedish',
                groupvalue: _site,
                value: translateMethod.Swedish,
                onchaged: () async {
                  await toggleplan(translateMethod.Swedish);
                  GetStorage box = GetStorage();
                  await box.write('Locale', 'sv');
                  GoogleTranslatorController.init(
                      'AIzaSyDbNMn6QSmOy3co3IaFXu09hJGBuNihHFI', Locale('en'),
                      cacheDuration: Duration(), translateTo: Locale('sv'));

                  setState(() {});
                  navigate();
                },
              ),
            ],
          ),
        )),
      ),
    );
  }
}
