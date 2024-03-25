// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'dart:async';

import 'package:academy_app/constants.dart';
import 'package:academy_app/models/common_functions.dart';
import 'package:academy_app/models/message.dart';
import 'package:academy_app/models/message_user.dart';

import 'package:academy_app/providers/messages.dart';
import 'package:academy_app/translate_helper.dart';

import 'package:academy_app/widgets/chat_buble.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:google_translator/google_translator.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MessageDetailScreen extends StatefulWidget {
  static const routeName = '/message-detail';
  const MessageDetailScreen({super.key, this.messageUser});
  final messageUser;
  @override
  State<MessageDetailScreen> createState() => _MessageDetailScreenState();
}

class _MessageDetailScreenState extends State<MessageDetailScreen> {
  var _isLoading = false;
  List<Message>? messages = [];
  MessageUser? instructor;
  TextEditingController messageController = TextEditingController();
  FocusNode focusNode = FocusNode();
  Timer? timer;

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
      instructor = widget.messageUser;
      messages = await Provider.of<Messages>(context, listen: false)
          .getMessages(instructor!.threadCode!);

      setState(() {
        _isLoading = false;
      });
      FlutterAppBadger.removeBadge();
    } catch (error) {
      const errorMsg = 'Could not refresh!';
      CommonFunctions.showErrorDialog(errorMsg, context);
    }

    return;
  }

  Future<void> refreshData() async {
    try {
      instructor = widget.messageUser;

      messages = await Provider.of<Messages>(context, listen: false)
          .getMessages(instructor!.threadCode!);
      setState(() {});
      FlutterAppBadger.removeBadge();
    } catch (error) {
      const errorMsg = 'Could not refresh!';
      CommonFunctions.showErrorDialog(errorMsg, context);
    }

    return;
  }

  Future<void> sendMessage() async {
    try {
      if (messageController.text.isNotEmpty) {
        setState(() {
          _isLoading = true;
        });
        await Provider.of<Messages>(context, listen: false)
            .sendMessage(instructor!.threadCode!, messageController.text);

        messages = await Provider.of<Messages>(context, listen: false)
            .getMessages(instructor!.threadCode!);
        messageController.clear();
        FocusScope.of(context).unfocus();
        setState(() {
          _isLoading = false;
        });
         Future.delayed(const Duration(milliseconds: 500), () {
          _controller.jumpTo(_controller.position.maxScrollExtent);
        });
      } else {
        CommonFunctions.showErrorDialog('Message cannot be empty', context);
      }
    } catch (error) {
      const errorMsg = 'Could not refresh!';
      CommonFunctions.showErrorDialog(errorMsg, context);
    }

    return;
  }

  String? hint;

  trans() async {
    hint = await translateText('Type here ...');
    setState(() {});
  }

  ScrollController _controller = ScrollController();

  @override
  void initState() {
    refreshList();
    trans();
    timer = Timer.periodic(Duration(seconds: 5), (Timer t) => refreshData());

    Future.delayed(const Duration(milliseconds: 1800), () {
      _controller.jumpTo(_controller.position.maxScrollExtent);
    });
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: instructor != null
            ? Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40,
                      width: 40,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: instructor!.imageUrl != null
                              ? CachedNetworkImage(
                                  imageUrl: instructor!.imageUrl!)
                              : Container(
                                  color: Colors.grey,
                                  child: Icon(Icons.person),
                                )),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            instructor!.firstName! +
                                " " +
                                instructor!.lastName!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600),
                          ).translate(),
                          Text(
                            instructor!.email!,
                            style: TextStyle(
                              fontSize: 11,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                          ).translate(),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : Text(''),
        titleTextStyle: const TextStyle(color: Colors.black, fontSize: 17),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      backgroundColor: kBackgroundColor,
      bottomNavigationBar: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Row(
          children: [
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(25)),
                margin: EdgeInsets.fromLTRB(8, 8, 8, 20),
                padding: EdgeInsets.all(18),
                child: TextField(
                  focusNode: focusNode,
                  controller: messageController,
                  style: TextStyle(color: Colors.black, fontSize: 15),
                  decoration: InputDecoration.collapsed(
                    hintText: hint ?? '',
                    hintStyle: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
            // Button send message
            Container(
              padding: EdgeInsets.all(5),
              child: InkWell(
                  onTap: () {
                    sendMessage();
                  },
                  child: Icon(
                    Icons.send,
                    size: 36,
                    color: kPrimaryColor.withOpacity(0.7),
                  )),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
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
                      padding: const EdgeInsets.all(20),
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: ListView.builder(
                        controller: _controller,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (ctx, index) {
                          Message message = messages![index];

                          return ChatBubble(
                              text: message.message!,
                              isCurrentUser:
                                  message.senderId != instructor!.instructorId!
                                      ? true
                                      : false);
                        },
                        itemCount: messages != null ? messages!.length : 0,
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
