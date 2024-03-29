// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:academy_app/providers/auth.dart';
import 'package:academy_app/screens/account_remove_screen.dart';
import 'package:academy_app/screens/app_translate/translate.dart';
import 'package:academy_app/screens/message_screen.dart';
import 'package:academy_app/widgets/account_list_tile.dart';
import 'package:academy_app/widgets/custom_text.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_translator/google_translator.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants.dart';
import '../providers/database_helper.dart';
import 'downloaded_course_list.dart';
import 'edit_password_screen.dart';
import 'edit_profile_screen.dart';
import 'package:http/http.dart' as http;

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  ConnectivityResult _connectionStatus = ConnectivityResult.wifi;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  bool _isLoading = true;

  dynamic courseAccessibility;

  systemSettings() async {
    setState(() {
      _isLoading = true;
    });
    Provider.of<Auth>(context, listen: false).getUserInfo();
    var url = "$BASE_URL/api/system_settings";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      setState(() {
        courseAccessibility = data['course_accessibility'];
      });
    } else {
      setState(() {
        courseAccessibility = '';
      });
    }
    setState(() {
      _isLoading = false;
    });
  }

  List<int> courseArr = [];

  @override
  void initState() {
    super.initState();
    initConnectivity();
    systemSettings();

    GetStorage box = GetStorage();

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> initConnectivity() async {
    late ConnectivityResult result;

    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return;
    }

    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectionStatus = result;
    });
  }

  Color _getTextColor(Set<MaterialState> states) => states.any(<MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      }.contains)
          ? Colors.green
          : kPrimaryColor;

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  handleAboutusRedirect() async{
    final Uri url = Uri.parse('https://movementapp.se/home/about_us');
              if (!await launchUrl(url)) {
                throw Exception('Could not launch $url');
              }
  }

  @override
  Widget build(BuildContext context) {
    return _connectionStatus == ConnectivityResult.none
                  ? Center(
                      child: Column(
                        children: [
                          SizedBox(
                              height: MediaQuery.of(context).size.height * .15),
                          Image.asset(
                            "assets/images/no_connection.png",
                            height: MediaQuery.of(context).size.height * .35,
                          ),
                          Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text('There is no Internet connection')
                                .translate(),
                          ),
                          Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text('Please check your Internet connection')
                                .translate(),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return const DownloadedCourseList();
                                }));
                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateColor.resolveWith(
                                          _getTextColor)),
                              icon: const Icon(Icons.download_done_rounded),
                              label: const Text(
                                'Play offline courses',
                                style: TextStyle(color: Colors.white),
                              ).translate(),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Consumer<Auth>(builder: (context, authData, child) {
                final user = authData.user;
                return SingleChildScrollView(
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const SizedBox(
                          height: 60,
                        ),
                        _isLoading  ? SizedBox(
                          height: 150,
                          child: Center(
                              child: CircularProgressIndicator(
                                  color: kPrimaryColor.withOpacity(0.7)),
                            ),
                        )
                        : 
                         Column(
                          children: [
                            CircleAvatar(
                              radius: 55,
                              backgroundImage: NetworkImage(user.image.toString()),
                              backgroundColor: kLightBlueColor,
                            ),
                             Padding(
                          padding: const EdgeInsets.all(10),
                          child: CustomText(
                            text: '${user.firstName} ${user.lastName}',
                            colors: kTextColor,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                          ],
                        ),
                       
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: 65,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 0.1,
                              child: GestureDetector(
                                child: const AccountListTile(
                                  titleText: 'Edit Profile',
                                  icon: Icons.account_circle,
                                  actionType: 'edit',
                                ),
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed(EditProfileScreen.routeName);
                                },
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 65,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 0.1,
                              child: GestureDetector(
                                child: const AccountListTile(
                                  titleText: 'My Messages',
                                  icon: Icons.chat,
                                  actionType: 'my_messages',
                                ),
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed(MessagesScreen.routeName);
                                },
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 65,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 0.1,
                              child: GestureDetector(
                                child: const AccountListTile(
                                  titleText: 'Change Language',
                                  icon: Icons.language,
                                  actionType: 'language',
                                ),
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const TranslateScreen()));
                                },
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 65,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 0.1,
                              child: GestureDetector(
                                child: const AccountListTile(
                                  titleText: 'Downloaded Course',
                                  icon: Icons.file_download_outlined,
                                  actionType: 'downloaded_course',
                                ),
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                      DownloadedCourseList.routeName);
                                },
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 65,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 0.1,
                              child: GestureDetector(
                                child: const AccountListTile(
                                  titleText: 'Change Password',
                                  icon: Icons.vpn_key,
                                  actionType: 'change_password',
                                ),
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed(EditPasswordScreen.routeName);
                                },
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 65,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 0.1,
                              child: GestureDetector(
                                child: const AccountListTile(
                                  titleText: 'Delete Your Account',
                                  icon: Icons.person_remove_outlined,
                                  actionType: 'account_delete',
                                ),
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed(AccountRemoveScreen.routeName);
                                },
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 65,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 0.1,
                              child: GestureDetector(
                                child: AccountListTile(
                                  titleText: 'Log Out',
                                  icon: Icons.exit_to_app,
                                  actionType: 'logout',
                                  courseAccessibility: courseAccessibility,
                                ),
                                onTap: () {
                                  if (courseAccessibility == 'publicly') {
                                    Provider.of<Auth>(context, listen: false)
                                        .logout()
                                        .then((_) =>
                                            Navigator.pushNamedAndRemoveUntil(
                                                context,
                                                '/home',
                                                (r) => false));
                                  } else {
                                    Provider.of<Auth>(context, listen: false)
                                        .logout()
                                        .then((_) =>
                                            Navigator.pushNamedAndRemoveUntil(
                                                context,
                                                '/auth-private',
                                                (r) => false));
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
              );
  }
}
