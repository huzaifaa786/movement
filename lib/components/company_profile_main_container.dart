import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:noobz/utils/colors.dart';

class CompanyProfileMainContainer extends StatelessWidget {
  const CompanyProfileMainContainer({
    Key? key,
    this.profilepic,
    this.title,
    this.email,
  }) : super(key: key);

  final title;
  final profilepic;
  final email;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 92,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: GradientBoxBorder(
          width: 2,
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              secondaryColor,
              mainColor,
            ],
          ),
        ),
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 15,
            offset: Offset(0, 0), // changes the position of the shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Container(
              height: 90,
              decoration: BoxDecoration(
                  // border: Border.all(),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      padding: EdgeInsets.only(top: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: profilepic == null
                          ? Container(
                              width: 50,
                              height: 50,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 196, 153, 203),
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(
                                'assets/images/Profile Image.png',
                                scale: 1.0,
                              ),
                            )
                          : Container(
                              width: 50,
                              height: 50,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 196, 153, 203),
                                shape: BoxShape.circle,
                              ),
                              child: CachedNetworkImage(
                                imageUrl: profilepic,
                                fit: BoxFit.fill,
                                // placeholder: (context, url) =>
                                //     CircularProgressIndicator(),
                              ),
                            )),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
              height: 90,
              decoration: BoxDecoration(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Text(
                      title.toString(),
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.email,
                        size: 16,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Text(
                          email.toString(),
                          //'adnoc6@gmail.com'
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
