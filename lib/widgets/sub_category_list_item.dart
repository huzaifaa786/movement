import 'package:academy_app/screens/courses_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_translator/google_translator.dart';
import 'package:html_unescape/html_unescape.dart';
import '../constants.dart';

class SubCategoryListItem extends StatelessWidget {
  final int? id;
  final String? title;
  final int? parent;
  final int? numberOfCourses;
  final int? index;

  const SubCategoryListItem(
      {Key? key,
      @required this.id,
      @required this.title,
      @required this.parent,
      @required this.numberOfCourses,
      @required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          CoursesScreen.routeName,
          arguments: {
            'category_id': id,
            'seacrh_query': null,
            'type': CoursesPageData.Category,
          },
        );
      },
      child: Card(
        // color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 15.0, bottom: 15),
              child: Text(
                "${index! + 1}.",
              ).translate(),
            ),
            Flexible(
              flex: 7,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
                width: double.infinity,
                // height: 80,
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: MediaQuery.of(context).size.width  * 0.6,
                        child: Text(
                          HtmlUnescape().convert(title!),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ).translate(),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '$numberOfCourses Courses',
                        style: const TextStyle(color: Colors.black54),
                        textAlign: TextAlign.left,
                      ).translate(),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: iCardColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 2),
                    child: ImageIcon(
                      const AssetImage("assets/images/long_arrow_right.png"),
                      color: kPrimaryColor.withOpacity(0.7),
                      size: 40,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
