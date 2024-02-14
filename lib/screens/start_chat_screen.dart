// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:academy_app/constants.dart';
import 'package:academy_app/models/common_functions.dart';
import 'package:academy_app/models/instructor.dart';
import 'package:academy_app/providers/messages.dart';
import 'package:academy_app/translate_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_translator/google_translator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:provider/provider.dart';

class StartChatScreen extends StatefulWidget {
  static const routeName = '/start-chat';
  const StartChatScreen({super.key, this.instructorId});
   final instructorId;


  @override
  State<StartChatScreen> createState() => _StartChatScreenState();
}

class _StartChatScreenState extends State<StartChatScreen> {
  Instructor? selectedInstructor;
  List<Instructor> allInstructors = [];
  String message = "";
  var _isLoading = false;
  InputDecoration getInputDecoration(String hintext) {
    return InputDecoration(
      enabledBorder: kDefaultInputBorder,
      focusedBorder: kDefaultFocusInputBorder,
      focusedErrorBorder: kDefaultFocusErrorBorder,
      errorBorder: kDefaultFocusErrorBorder,
      filled: true,
      hintStyle: const TextStyle(color: kFormInputColor),
      hintText: hintext,
      fillColor: Colors.white70,
      contentPadding: const EdgeInsets.symmetric(vertical: 8,horizontal: 8),
    );
  }

  Future<void> getUsers() async {
    setState(() {
      _isLoading = true;
    });
    var url = '$BASE_URL/api/get_users_list';
    final response = await http.get(Uri.parse(url));
    final responseData = json.decode(response.body);

    try {
      if (response.statusCode != 200) {
        return;
      } else {
        for (var user in responseData) {
          allInstructors.add(Instructor(
              id: int.parse(user['id']),
              name: user['name'],
              email: user['email'],
              image: user['image']));
        }

         if(widget.instructorId != null){
          var defaultInstructor =  allInstructors.firstWhere((instructor) => instructor.id == int.parse(widget.instructorId));
          selectedInstructor = defaultInstructor;
         }
         else{
          setState(() {
            selectedInstructor = allInstructors.isNotEmpty
                ? allInstructors.first
                : null;
          });
         }
      }
    } catch (e) {
      // Handle any exceptions that occur during the HTTP request or JSON decoding
      print('Error: $e');
    }
    setState(() {
      _isLoading = false;
    });
  }

  String? msg;

  trans() async {
    msg = await translateText('Write your message...');
    setState(() {});
  }
  @override
  void initState() {
    getUsers();

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Start Chat").translate(),
        titleTextStyle: const TextStyle(color: Colors.black, fontSize: 17),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      backgroundColor: kBackgroundColor,
      body: !_isLoading
          ? Container(
              height: MediaQuery.of(context).size.height * 0.9,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(18),
              decoration: BoxDecoration(),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 5.0),
                        child: Text(
                          'Select a user',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ).translate(),
                      ),
                    ),
                    allInstructors.isNotEmpty
                        ? Container(
                            width: MediaQuery.of(context).size.width,
                            color: Colors.white,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<Instructor>(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                dropdownColor: Colors.white,
                                value: selectedInstructor,
                                items:
                                    allInstructors.map((Instructor instructor) {
                                  return DropdownMenuItem<Instructor>(
                                    value: instructor,
                                    child: Text(instructor.name!).translate(),
                                  );
                                }).toList(),
                                onChanged: (newValue) {
                                  setState(() {
                                    selectedInstructor = newValue;
                                  });
                                },
                              ),
                            ))
                        : Text(''),
                     Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 5.0,top: 8),
                        child: Text(
                          'Message',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ).translate(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: TextFormField(
                        style: const TextStyle(fontSize: 16),
                        initialValue: '',
                        decoration: getInputDecoration(
                          msg ?? '',
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: 5,
                        onChanged: (value) {
                          setState(() {
                            message = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: MaterialButton(
                        onPressed: () {
                         
                          if (message.isNotEmpty &&
                              selectedInstructor != null) {
                            setState(() {
                              _isLoading = true;
                            });
                            Provider.of<Messages>(context, listen: false)
                                .sendNewMessage(message, selectedInstructor!)
                                .then((value) {
                              setState(() {
                                message = "";
                                _isLoading = false;
                              });
                            });
                          } else {
                            CommonFunctions.showErrorDialog(
                                'Please fill out all the fields', context);
                          }
                        },
                        color: kPrimaryColor,
                        textColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        splashColor: Colors.redAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.0),
                          side: const BorderSide(color: kPrimaryColor),
                        ),
                        child: const Text(
                          'Send Message',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ).translate(),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : SizedBox(
              height: MediaQuery.of(context).size.height * .5,
              child: Center(
                child: CircularProgressIndicator(
                    color: kPrimaryColor.withOpacity(0.7)),
              ),
            ),
    );
  }
}
