// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'dart:convert';
import 'package:academy_app/providers/my_bundles.dart';
import 'package:academy_app/providers/my_courses.dart';
import 'package:academy_app/widgets/my_bundle_grid.dart';
import 'package:academy_app/widgets/my_course_grid.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_translator/google_translator.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../constants.dart';

class MyCoursesScreen extends StatefulWidget {
  const MyCoursesScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyCoursesScreenState createState() => _MyCoursesScreenState();
}

class _MyCoursesScreenState extends State<MyCoursesScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollController;

  ConnectivityResult _connectionStatus = ConnectivityResult.wifi;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  bool _isLoading = false;
  dynamic bundleStatus = false;

  @override
  void initState() {
    setState(() {
      _isLoading = true;
    });
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_smoothScrollToTop);
    Provider.of<MyCourses>(context, listen: false).fetchMyCourses();
    setState(() {
      _isLoading = false;
    });
    super.initState();

    // addonStatus();

    initConnectivity();

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

  _scrollListener() {
    // if (fixedScroll) {
    //   _scrollController.jumpTo(0);
    // }
  }

  _smoothScrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(microseconds: 300),
      curve: Curves.ease,
    );
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> addonStatus() async {
    var url = '$BASE_URL/api/addon_status?unique_identifier=course_bundle';
    final response = await http.get(Uri.parse(url));
    setState(() {
      _isLoading = false;
      bundleStatus = json.decode(response.body)['status'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            courseView(),
          ],
        ),
      ),
    );
  }

  Widget courseView() {
    return _connectionStatus == ConnectivityResult.none
        ? Center(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * .15),
                Image.asset(
                  "assets/images/no_connection.png",
                  height: MediaQuery.of(context).size.height * .35,
                ),
                Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text('There is no Internet connection').translate(),
                ),
                Padding(
                  padding: EdgeInsets.all(4.0),
                  child:
                      Text('Please check your Internet connection').translate(),
                ),
              ],
            ),
          )
        : _isLoading
            ? SizedBox(
                height: 150,
                child: Center(
                  child: CircularProgressIndicator(
                      color: kPrimaryColor.withOpacity(0.7)),
                ),
              )
            : Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'My Courses',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 20),
                        ).translate(),
                      ],
                    ),
                  ),
                  Consumer<MyCourses>(
                    builder: (context, myCourseData, child) =>
                        AlignedGridView.count(
                      padding: const EdgeInsets.all(10.0),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      itemCount: myCourseData.items.length,
                      itemBuilder: (ctx, index) {
                        return MyCourseGrid(
                          myCourse: myCourseData.items[index],
                        );
                        // return Text(myCourseData.items[index].title);
                      },
                      mainAxisSpacing: 5.0,
                      crossAxisSpacing: 5.0,
                    ),
                  ),
                ],
              );
  }

  Widget bundleView() {
    return SingleChildScrollView(
      child: FutureBuilder(
        future: Provider.of<MyBundles>(context, listen: false).fetchMybundles(),
        builder: (ctx, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                  color: kPrimaryColor.withOpacity(0.7)),
            );
          } else {
            if (dataSnapshot.error != null) {
              //error
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
                        ],
                      ),
                    )
                  : Center(
                      // child: Text('Error Occured'),
                      child: Text(dataSnapshot.error.toString()).translate(),
                    );
            } else {
              return Consumer<MyBundles>(
                builder: (context, myBundleData, child) =>
                    AlignedGridView.count(
                  padding: const EdgeInsets.all(10.0),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  itemCount: myBundleData.bundleItems.length,
                  itemBuilder: (ctx, index) {
                    return MyBundleGrid(
                      myBundle: myBundleData.bundleItems[index],
                    );
                    // return Text(myCourseData.items[index].title);
                  },
                  mainAxisSpacing: 5.0,
                  crossAxisSpacing: 5.0,
                ),
              );
            }
          }
        },
      ),
    );
  }
}
