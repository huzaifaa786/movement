// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:convert';
import 'package:academy_app/screens/app_translate/translate.dart';
import 'package:academy_app/screens/courses_screen.dart';
import 'package:academy_app/screens/login_screen.dart';
import 'package:academy_app/screens/main_login_screen.dart';
import 'package:academy_app/screens/message_screen.dart';
import 'package:academy_app/screens/start_chat_screen.dart';
import 'package:academy_app/translate_helper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:circle_flags/circle_flags.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_translator/google_translator.dart';
import 'package:http/http.dart' as http;
import 'package:academy_app/models/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants.dart';
import 'search_widget.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const CustomAppBar({Key? key})
      : preferredSize = const Size.fromHeight(50.0),
        super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  final bool _isSearching = false;
  String locale = "en";
  final _controller = StreamController<AppLogo>();
  final searchController = TextEditingController();

  fetchMyLogo() async {
    var url = '$BASE_URL/api/app_logo';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var logo = AppLogo.fromJson(jsonDecode(response.body));
        _controller.add(logo);
      }
      // print(extractedData);
    } catch (error) {
      rethrow;
    }
  }

    handleAboutusRedirect() async {
    final Uri url = Uri.parse('https://movementapp.se/home/about_us');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  void _handleSubmitted(String value) {
    final searchText = searchController.text;
    if (searchText.isEmpty) {
      return;
    }

    searchController.clear();
    Navigator.of(context).pushNamed(
      CoursesScreen.routeName,
      arguments: {
        'category_id': null,
        'seacrh_query': searchText,
        'type': CoursesPageData.Search,
      },
    );
    // print(searchText);
  }

  void _showSearchModal(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      isScrollControlled: true,
      builder: (_) {
        return const SearchWidget();
      },
    );
  }

  initLanguage() {
    GetStorage box = GetStorage();
    setState(() {
      locale = box.read('Locale');
    });
  }

  @override
  void initState() {
    super.initState();
    initLanguage();
    fetchMyLogo();
  }

  String? search;

  trans() async {
    search = await translateText('Search here');
    setState(() {});
  }

  redirectToTranslation(context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const TranslateScreen()));
  }
  
  redirectToMessages(context) async{
      dynamic userData;
      dynamic response;
      dynamic token;

      final prefs = await SharedPreferences.getInstance();
      setState(() {
        userData = (prefs.getString('userData') ?? '');
      });
      if (userData != null && userData.isNotEmpty) {
        response = json.decode(userData);
        token = response['token'];
      }
      if (token != null && token.isNotEmpty) {
            Navigator.of(context).pushNamed(MessagesScreen.routeName);
      } else {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const MainLoginScreen()));
      }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      iconTheme: const IconThemeData(
        color: kSecondaryColor, //change your color here
      ),
      leading: StreamBuilder<AppLogo>(
        stream: _controller.stream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container();
          } else {
            if (snapshot.error != null) {
              return const Text("Error Occured").translate();
            } else {
              return Transform.scale(
                scale: 3.5,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: CachedNetworkImage(
                    alignment: Alignment.center,
                    imageUrl: snapshot.data!.darkLogo.toString(),
                    fit: BoxFit.contain,
                  ),
                ),
              );
            }
          }
        },
      ),
      title: !_isSearching
          ? Container()
          : Card(
              color: Colors.white,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: search ?? '',
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                ),
                controller: searchController,
                onFieldSubmitted: _handleSubmitted,
              ),
            ),
      backgroundColor: Colors.white,
      actions: <Widget>[
        locale == 'en'
            ? GestureDetector(
                onTap: () {
                  redirectToTranslation(context);
                },
                child: CircleFlag(
                  'gb',
                  size: 23,
                ))
            : GestureDetector(
                onTap: () {
                  redirectToTranslation(context);
                },
                child: CircleFlag(
                  'se',
                  size: 23,
                ),
              ),
        SizedBox(
          width: 7,
        ),
        IconButton(
          icon: const Icon(
            Icons.search,
            color: kSecondaryColor,
          ),
          onPressed: () => _showSearchModal(context),
        ),
        IconButton(
          icon: const Icon(
            Icons.message_outlined,
            color: kSecondaryColor,
          ),
          onPressed: () => redirectToMessages(context),
        ),
        PopupMenuButton<String>(
          onSelected: (value) async {
            if (value == "Goto Website") {
              final Uri url = Uri.parse('https://movementapp.se/');
              if (!await launchUrl(url)) {
                throw Exception('Could not launch $url');
              }
            }  
            else if (value == "Support") {
                Navigator.of(context).pushNamed(StartChatScreen.routeName);
            }
            
            else if (value == "About Us") {
               handleAboutusRedirect();
            }
          },
          itemBuilder: (BuildContext context) {
            return {'Goto Website','Support', 'About Us'}.map((String choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: Text(choice),
              );
            }).toList();
          },
        ),
      ],
    );
  }
}
