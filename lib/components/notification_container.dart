import 'package:flutter/material.dart';
import 'package:noobz/utils/colors.dart';

class NotificationContainer extends StatelessWidget {
  const NotificationContainer({
    Key? key,
    this.image,
    this.notificationtext,
  }) : super(key: key);
  final image;
  final notificationtext;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 30,
              child: Column(
                children: [
                  Image.asset(
                     image),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: SizedBox(width: MediaQuery.of(context).size.width * 0.75,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.75,
                          child: Text(
                            notificationtext,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'View',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: individualduedate,
                                ),
                              ),
                              Icon(
                                Icons.keyboard_arrow_right_outlined,
                                color: individualduedate,
                              ),
                            ],
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
