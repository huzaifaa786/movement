import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import './custom_text.dart';
import '../constants.dart';

class TabViewHtmlDetails extends StatelessWidget {
  final String? titleText;
  final String? listText;

  const TabViewHtmlDetails({
    Key? key,
    @required this.titleText,
    @required this.listText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: CustomText(
                text: titleText,
                fontSize: 20,
                fontWeight: FontWeight.w400,
                colors: kDarkGreyColor,
              ),
            ),
          ],
        ),
        Expanded(
          child:  SingleChildScrollView(
            child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      HtmlWidget( listText!,
                      ),
                      const Divider(),
                    ],
                  ),
                ),
          )
        ),
      ],
    );
  }
}
