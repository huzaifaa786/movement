// ignore_for_file: use_build_context_synchronously, prefer_const_constructors

import 'dart:async';
import 'dart:convert';
import 'package:academy_app/widgets/bundle_grid.dart';
import 'package:google_translator/google_translator.dart';
import '../providers/categories.dart';
import '../widgets/category_list_item.dart';
import '../widgets/course_grid.dart';
import '../providers/courses.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import 'bundle_list_screen.dart';
import 'courses_screen.dart';
import '../models/common_functions.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _isInit = true;
  var _isLoading = false;
  var topCourses = [];
  var categories = [];
  var bundles = [];
  dynamic bundleStatus;

  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
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

  // Future<void> addonStatus() async {
  //   var url = '$BASE_URL/api/addon_status?unique_identifier=course_bundle';
  //   final response = await http.get(Uri.parse(url));
  //   bundleStatus = json.decode(response.body)['status'];
  // }

  @override
  void didChangeDependencies() {
      initHomeScreen();
    super.didChangeDependencies();
  }

  void initHomeScreen() {
       if (_isInit) {
      setState(() {
        _isLoading = true;
      });

      Provider.of<Courses>(context).fetchTopCourses().then((_) {
        setState(() {
          topCourses = Provider.of<Courses>(context, listen: false).topItems;
          categories = Provider.of<Categories>(context, listen: false).items;
          _isLoading = false;
        });
      });
      Provider.of<Courses>(context)
          .filterCourses('all', 'all', 'all', 'all', 'all');
    }
    _isInit = false;
  }

  Future<void> refreshList() async {
    try {
      setState(() {
        _isLoading = true;
      });
      await Provider.of<Courses>(context, listen: false).fetchTopCourses();

      setState(() {
        _isLoading = false;
        topCourses = Provider.of<Courses>(context, listen: false).topItems;
      });
    } catch (error) {
      const errorMsg = 'Could not refresh!';
      CommonFunctions.showErrorDialog(errorMsg, context);
    }

    return;
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: refreshList,
      child: SingleChildScrollView(
        child: FutureBuilder(
          future:
              Provider.of<Categories>(context, listen: false).fetchCategories(),
          builder: (ctx, dataSnapshot) {
            if (dataSnapshot.connectionState == ConnectionState.waiting) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * .5,
                child: Center(
                  child: CircularProgressIndicator(
                      color: kPrimaryColor.withOpacity(0.7)),
                ),
              );
            } else {
              if (dataSnapshot.error != null) {
                //error
                return _connectionStatus == ConnectivityResult.none
                    ? Center(
                        child: Column(
                          children: [
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .15),
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
                              child:
                                  Text('Please check your Internet connection')
                                      .translate(),
                            ),
                          ],
                        ),
                      )
                    : Center(
                        child: Column(
                          children: [
                            Text('Error Occured').translate(),
                            SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                               initHomeScreen();
                              },
                              child: Text('Refresh'),
                            ),
                          ],
                        ),
                        // child: Text(dataSnapshot.error.toString()),
                      );
              } else {
                return _isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                            color: kPrimaryColor.withOpacity(0.7)),
                      )
                    : Column(
                        children: [
                          if (topCourses.isNotEmpty)
                            // Container(
                            //     width: double.infinity,
                            //     padding: const EdgeInsets.symmetric(
                            //         vertical: 10, horizontal: 20),
                            //     child: Row(
                            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //       children: <Widget>[
                            //         const Text(
                            //           'Top Courses',
                            //           style: TextStyle(
                            //               fontWeight: FontWeight.w600, fontSize: 18),
                            //         ).translate(),
                            //         MaterialButton(
                            //           onPressed: () {
                            //             Navigator.of(context).pushNamed(
                            //               CoursesScreen.routeName,
                            //               arguments: {
                            //                 'category_id': null,
                            //                 'seacrh_query': null,
                            //                 'type': CoursesPageData.All,
                            //               },
                            //             );
                            //           },
                            //           padding: const EdgeInsets.all(0),
                            //           child: Row(
                            //             children: [
                            //               const Text('All courses').translate(),
                            //               Icon(
                            //                 Icons.arrow_forward_ios_rounded,
                            //                 color: kPrimaryColor.withOpacity(0.7),
                            //                 size: 18,
                            //               ),
                            //             ],
                            //           ),
                            //         )
                            //       ],
                            //     ),
                            //   ),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              height: 360.0,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (ctx, index) {
                                  return CourseGrid(
                                    id: topCourses[index].id,
                                    title: topCourses[index].title,
                                    thumbnail: topCourses[index].thumbnail,
                                    instructorName:
                                        topCourses[index].instructor,
                                    instructorImage:
                                        topCourses[index].instructorImage,
                                    rating: topCourses[index].rating,
                                    price: topCourses[index].price,
                                    product_id: topCourses[index].productId,
                                  );
                                },
                                itemCount: topCourses.length,
                              ),
                            ),
                          if (bundleStatus == true)
                            Column(
                              children: [
                                if (bundles.isNotEmpty)
                                  Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        const Text(
                                          'Bundles',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18),
                                        ).translate(),
                                        MaterialButton(
                                          onPressed: () {
                                            Navigator.of(context).pushNamed(
                                              BundleListScreen.routeName,
                                            );
                                          },
                                          padding: const EdgeInsets.all(0),
                                          child: Row(
                                            children: [
                                              const Text('All bundles')
                                                  .translate(),
                                              Icon(
                                                Icons.arrow_forward_ios_rounded,
                                                color: kPrimaryColor
                                                    .withOpacity(0.7),
                                                size: 18,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                bundles.isNotEmpty
                                    ? Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 0.0),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        height: 240.0,
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (ctx, index) {
                                            return BundleGrid(
                                              id: bundles[index].id,
                                              title: bundles[index].title,
                                              banner:
                                                  // ignore: prefer_interpolation_to_compose_strings
                                                  '$BASE_URL/uploads/course_bundle/banner/' +
                                                      bundles[index].banner,
                                              averageRating:
                                                  bundles[index].averageRating,
                                              numberOfRatings: bundles[index]
                                                  .numberOfRatings,
                                              price: bundles[index].price,
                                            );
                                          },
                                          itemCount: bundles.length,
                                        ),
                                      )
                                    : const SizedBox(height: 0),
                              ],
                            ),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                const Text(
                                  'Course Categories',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
                                ).translate(),
                                MaterialButton(
                                  onPressed: () {
                                    Navigator.of(context).pushNamed(
                                      CoursesScreen.routeName,
                                      arguments: {
                                        'category_id': null,
                                        'seacrh_query': null,
                                        'type': CoursesPageData.All,
                                      },
                                    );
                                  },
                                  padding: const EdgeInsets.all(0),
                                  child: Row(
                                    children: [
                                      const Text('All courses').translate(),
                                      Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: kPrimaryColor.withOpacity(0.7),
                                        size: 18,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (ctx, index) {
                                return CategoryListItem(
                                  id: categories[index].id,
                                  title: categories[index].title,
                                  thumbnail: categories[index].thumbnail,
                                  numberOfSubCategories:
                                      categories[index].numberOfSubCategories,
                                );
                              },
                              itemCount: categories.length,
                            ),
                          ),
                        ],
                      );
              }
            }
          },
        ),
      ),
    );
  }
}
