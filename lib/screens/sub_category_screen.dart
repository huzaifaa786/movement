// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:academy_app/constants.dart';
import 'package:academy_app/providers/categories.dart';
import 'package:academy_app/providers/courses.dart';
import 'package:academy_app/widgets/course_list_item.dart';
import 'package:academy_app/widgets/sub_category_list_item.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_translator/google_translator.dart';
import 'package:provider/provider.dart';

class SubCategoryScreen extends StatefulWidget {
  static const routeName = '/sub-cat';
  const SubCategoryScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SubCategoryScreenState createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState extends State<SubCategoryScreen> {
  var _isInit = true;
  var _isLoading = false;
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  // var _isLoading = false;

  @override
  void initState() {
    super.initState();
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

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final categoryId = routeArgs['category_id'] as int;
    final title = routeArgs['title'];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(title, maxLines: 2).translate(),
        titleTextStyle: const TextStyle(color: Colors.black, fontSize: 15),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: Provider.of<Categories>(context, listen: false)
                  .fetchSubCategories(categoryId),
              builder: (ctx, dataSnapshot) {
                if (dataSnapshot.connectionState == ConnectionState.waiting) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * .5,
                    child: Center(
                      child: CircularProgressIndicator(color: kPrimaryColor.withOpacity(0.7)),
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
                        :  Center(
                            child: Text('Error Occured').translate(),
                            // child: Text(dataSnapshot.error.toString()),
                          );
                  } else {
                    print("else ma a gya ha");
                    return Column(
                      children: [
                
                        Consumer<Categories>(
                          builder: (context, myCategoryData, child) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'Showing ${myCategoryData.subItems.length} Sub-Categories',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 17,
                                        ),
                                      ).translate(),
                                    ],
                                  ),
                                ),
                                ListView.builder(
                                  shrinkWrap: true,
                                  // physics: const NeverScrollableScrollPhysics(),
                                  itemCount: myCategoryData.subItems.length,
                                  itemBuilder: (ctx, index) {
                                    return 
                                    SubCategoryListItem(
                                      id: myCategoryData.subItems[index].id,
                                      title: myCategoryData.subItems[index].title,
                                      parent: myCategoryData.subItems[index].parent,
                                      numberOfCourses:
                                          myCategoryData
                                          .subItems[index].numberOfCourses,
                                      index: index,
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                          
                      ],
                    );
                  }
                }
              },
            ),
            
            FutureBuilder(
              future: Provider.of<Courses>(context, listen: false)
                  .fetchCoursesByCategory(categoryId),
              builder: (ctx, dataSnapshot) {
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
                        :  Center(
                            child: Text('Error Occured').translate(),
                            // child: Text(dataSnapshot.error.toString()),
                          );
                  } else {
                    print("else ma a gya ha");
                    return Column(
                      children: [
                
                        Consumer<Courses>(
                          builder: (context, courseData, child) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'Showing ${courseData.items.length} Courses',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 17,
                                        ),
                                      ).translate(),
                                    ],
                                  ),
                                ),
                                 ListView.builder(
                                   shrinkWrap: true,
                                   physics:
                                       const NeverScrollableScrollPhysics(),
                                   itemBuilder: (ctx, index) {
                                     return Center(
                                       child: CourseListItem(
                                         id: courseData.items[index].id!.toInt(),
                                         title: courseData.items[index]
                                             .title
                                             .toString(),
                                         thumbnail: courseData.items[index]
                                             .thumbnail
                                             .toString(),
                                         rating:
                                             courseData.items[index].rating!.toInt(),
                                         price: courseData.items[index]
                                             .price
                                             .toString(),
                                         instructor: courseData.items[index]
                                             .instructor
                                             .toString(),
                                         noOfRating: courseData.items[index]
                                             .totalNumberRating!
                                             .toInt(),
                                         product_id:
                                             courseData.items[index].productId,
                                       ),
                                     );
                                   },
                                   itemCount: courseData.items.length,
                                 ),
                              ],
                            ),
                          ),
                        ),
                          
                      ],
                    );
                  }
              },
            ),
          ],
        ),
      ),
    );
  }
}
