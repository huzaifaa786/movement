// ignore_for_file: prefer_const_constructors

import 'package:academy_app/constants.dart';
import 'package:academy_app/screens/courses_screen.dart';
import 'package:academy_app/translate_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_translator/google_translator.dart';

class SearchWidget extends StatefulWidget {
  static const routeName = '/search-item';

  const SearchWidget({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final bool _isLoading = false;
  final searchController = TextEditingController();

  String? search;

  trans() async {
    search = await translateText('Search here');
    setState(() {});
  }

  @override
  void initState() {
    trans();
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Center(
            child: CircularProgressIndicator(
                color: kPrimaryColor.withOpacity(0.7)),
          )
        : Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: kBackgroundColor,
            body: Column(
              children: <Widget>[
                const SizedBox(
                  height: 30,
                ),
                AppBar(
                  automaticallyImplyLeading: false,
                  title: TextFormField(
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
                  iconTheme: const IconThemeData(
                    color: kSecondaryColor, //change your color here
                  ),
                  backgroundColor: kBackgroundColor,
                  actions: <Widget>[
                    IconButton(
                        icon: const Icon(
                          Icons.cancel_outlined,
                          color: kSecondaryColor,
                          size: 20,
                        ),
                        onPressed: () => Navigator.of(context).pop()),
                  ],
                ),
                const SizedBox(height: 150),
                const Text(
                  "Type In Search Bar...",
                  style: TextStyle(color: kSecondaryColor),
                ).translate(),
              ],
            ),
          );
  }
}
