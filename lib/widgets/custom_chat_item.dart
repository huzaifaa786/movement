import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class CustomChatListItem extends StatelessWidget {
  final String? lastMessageTime;
  final String? name;
  final String? email;
  final String? imageUrl;
  final int? unreadCount;
  final ontap;

  const CustomChatListItem({
    Key? key,
    this.lastMessageTime,
    this.name,
    this.email,
    this.imageUrl,
    this.unreadCount,
    this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String time;
    time = lastMessageTime!;
    // DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    // DateTime now = DateTime.now();
    // Duration difference = now.difference(dateTime);
    // if (difference.inMinutes < 60) {
    //   time = '${difference.inMinutes}minutes ago';
    // } else if (difference.inHours < 24) {
    //   time = '${difference.inHours}hour ago';
    // } else {
    //   time = dateTime.toString().split(' ')[0];
    // }
    return Container(
      padding: EdgeInsets.only(top: 8, bottom: 8),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      child: Center(
        child: ListTile(
          onTap: ontap,
          tileColor: Colors.white,
          leading: unreadCount! > 0
              ? badges.Badge(
                  badgeContent: Text(unreadCount!.toString()),
                  child: SizedBox(
                    height: 60,
                    width: 60,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: imageUrl != null
                            ? CachedNetworkImage(imageUrl: imageUrl!)
                            : Container(
                                color: Colors.grey,
                                child: Icon(Icons.person),
                              )),
                  ))
              : SizedBox(
                  height: 60,
                  width: 60,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: imageUrl != null
                          ? CachedNetworkImage(imageUrl: imageUrl!)
                          : Container(
                              color: Colors.grey,
                              child: Icon(Icons.person),
                            )),
                ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.38),
                child: Text(
                  name!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontFamily: 'Poppins', fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  time,
                  style: TextStyle(
                    fontSize: 11,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            ],
          ),
          subtitle: Container(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.38),
            child: Text(
              email!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 11,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
