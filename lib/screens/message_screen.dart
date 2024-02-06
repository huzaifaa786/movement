// ignore_for_file: use_build_context_synchronously, prefer_const_constructors

import 'dart:async';

import 'package:academy_app/constants.dart';
import 'package:academy_app/models/common_functions.dart';
import 'package:academy_app/models/message_user.dart';
import 'package:academy_app/providers/categories.dart';
import 'package:academy_app/providers/messages.dart';
import 'package:academy_app/screens/message_detail_screen.dart';
import 'package:academy_app/screens/start_chat_screen.dart';
import 'package:academy_app/widgets/custom_chat_item.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_translator/google_translator.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MessagesScreen extends StatefulWidget {
  static const routeName = '/my-messages';
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  var _isLoading = false;
  List<MessageUser>? messages = [];

  String getPastTime(int time) {
    int timeDifference = DateTime.now().millisecondsSinceEpoch ~/ 1000 - time;

    if (timeDifference < 1) {
      return 'less than 1 second ago';
    }

    if (timeDifference > 864000) {
      return DateFormat('yyyy-MM-dd – kk:mm')
          .format(DateTime.fromMillisecondsSinceEpoch(time));
    }

    Map<int, String> condition = {
      12 * 30 * 24 * 60 * 60: 'year',
      30 * 24 * 60 * 60: 'month',
      24 * 60 * 60: 'day',
      60 * 60: 'hour',
      60: 'minute',
      1: 'second',
    };

    for (int secs in condition.keys) {
      double d = timeDifference / secs;

      if (d >= 1) {
        int t = d.round();
        return '$t ${condition[secs]}${t > 1 ? 's' : ''} ago';
      }
    }

    return '';
  }

  Future<void> refreshList() async {
    try {
      setState(() {
        _isLoading = true;
      });
      messages =
          await Provider.of<Messages>(context, listen: false).getMessageUsers();

      setState(() {
        _isLoading = false;
      });
    } catch (error) {
      const errorMsg = 'Could not refresh!';
      CommonFunctions.showErrorDialog(errorMsg, context);
    }

    return;
  }

  @override
  void initState() {
    refreshList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Message").translate(),
        titleTextStyle: const TextStyle(color: Colors.black, fontSize: 17),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(StartChatScreen.routeName);
                },
                child: Icon(Icons.add)),
          )
        ],
      ),
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: refreshList,
          child: ListView(
            children: [
              Column(
                children: [
                  _isLoading
                      ? SizedBox(
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: Center(
                            child: CircularProgressIndicator(
                                color: kPrimaryColor.withOpacity(0.7)),
                          ),
                        )
                      : Container(
                          margin: const EdgeInsets.symmetric(vertical: 0.0),
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          height: MediaQuery.of(context).size.height * 0.85,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemBuilder: (ctx, index) {
                              MessageUser messageUser = messages![index];
                              return CustomChatListItem(
                                ontap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MessageDetailScreen(
                                          messageUser: messageUser),
                                    ),
                                  );
                                },
                                name: messageUser.firstName! +
                                    ' ' +
                                    messageUser.lastName!,
                                lastMessageTime: getPastTime(
                                    messageUser.lastMessageTimestamp!),
                                email: messageUser.lastMessage,
                                imageUrl: messageUser.imageUrl,
                                unreadCount: messageUser.countUnread,
                              );
                            },
                            itemCount: messages != null ? messages!.length : 0,
                          ),
                        )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
