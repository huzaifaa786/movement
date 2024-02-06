// ignore_for_file: use_build_context_synchronously, prefer_const_constructors

import 'dart:io';
import 'package:academy_app/constants.dart';
import 'package:academy_app/models/common_functions.dart';
import 'package:academy_app/models/user.dart';
import 'package:academy_app/providers/auth.dart';
import 'package:academy_app/translate_helper.dart';
import 'package:academy_app/widgets/app_bar_two.dart';
import 'package:academy_app/widgets/user_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_translator/google_translator.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatefulWidget {
  static const routeName = '/edit-profile';
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  bool _isLoading = false;

  final Map<String, String> _userData = {
    'first_name': '',
    'last_name': '',
    'email': '',
    'role': '',
    'validity': '',
    'device_verification': '',
    'token': '',
    'bio': '',
    'twitter': '',
    'facebook': '',
    'linkedin': '',
  };

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      // Invalid!
      return;
    }
    _formKey.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    try {
      // Log user in
      // print(_userData['first_name']);
      final updateUser = User(
        userId: _userData['user_id'],
        firstName: _userData['first_name'],
        lastName: _userData['last_name'],
        email: _userData['email'],
        role: _userData['role'],
        validity: _userData['validity'],
        deviceVerification: _userData['device_verification'],
        token: _userData['token'],
        biography: _userData['bio'],
        twitter: _userData['twitter'],
        facebook: _userData['facebook'],
        linkedIn: _userData['linkedin'],
      );
      await Provider.of<Auth>(context, listen: false)
          .updateUserData(updateUser);

      CommonFunctions.showSuccessToast('User updated Successfully');
    } on HttpException {
      var errorMsg = 'Update failed';
      CommonFunctions.showErrorDialog(errorMsg, context);
    } catch (error) {
      // print(error);
      const errorMsg = 'Update failed!';
      CommonFunctions.showErrorDialog(errorMsg, context);
    }
    setState(() {
      _isLoading = false;
    });
  }

  InputDecoration getInputDecoration(String hintext, IconData iconData) {
    return InputDecoration(
      enabledBorder: kDefaultInputBorder,
      focusedBorder: kDefaultFocusInputBorder,
      focusedErrorBorder: kDefaultFocusErrorBorder,
      errorBorder: kDefaultFocusErrorBorder,
      filled: true,
      hintStyle: const TextStyle(color: kFormInputColor),
      hintText: hintext,
      fillColor: Colors.white70,
      prefixIcon: Icon(
        iconData,
        color: kFormInputColor,
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 5),
    );
  }

  String? name;
  String? lname;
  String? bio;
  String? flink;
  String? tlink;
  String? llink;

  trans() async {
    name = await translateText('First Name');
    lname = await translateText('Last Name');
    bio = await translateText('Biography');
    flink = await translateText('Facebook Link');
    tlink = await translateText('Twitter Link');
    llink = await translateText('LinkedIn Link');
    setState(() {});
  }

  @override
  void initState() {
    trans();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarTwo(),
      backgroundColor: kBackgroundColor,
      body: FutureBuilder(
        future: Provider.of<Auth>(context, listen: false).getUserInfo(),
        builder: (ctx, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                  color: kPrimaryColor.withOpacity(0.7)),
            );
          } else {
            if (dataSnapshot.error != null) {
              return Center(
                child: Text('Error Occured').translate(),
              );
            } else {
              return Consumer<Auth>(
                builder: (context, authData, child) {
                  final user = authData.user;
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(left: 15, top: 10, bottom: 5.0),
                          child: Text(
                            'Update Profile Picture',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ).translate(),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: UserImagePicker(
                            image: user.image,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(10.0),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 0.0, bottom: 5.0),
                                      child: Text(
                                        'First Name',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ).translate(),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 0.0, bottom: 8.0),
                                    child: TextFormField(
                                      style: const TextStyle(fontSize: 14),
                                      initialValue: user.firstName,
                                      decoration: getInputDecoration(
                                          name ?? '', Icons.person),
                                      keyboardType: TextInputType.name,
                                      // controller: _firstNameController,
                                      // ignore: missing_return
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'First name cannot be empty';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        _userData['first_name'] =
                                            value.toString();
                                        _firstNameController.text =
                                            value as String;
                                      },
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(bottom: 5.0),
                                      child: Text(
                                        'Last Name',
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
                                      style: const TextStyle(fontSize: 14),
                                      initialValue: user.lastName,
                                      decoration: getInputDecoration(
                                        lname ?? '',
                                        Icons.person,
                                      ),
                                      keyboardType: TextInputType.name,
                                      // controller: _lastNameController,
                                      // ignore: missing_return
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Last name cannot be empty';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        _userData['last_name'] =
                                            value.toString();
                                        _lastNameController.text =
                                            value as String;
                                      },
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(bottom: 5.0),
                                      child: Text(
                                        'Biography',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ).translate(),
                                    ),
                                  ),
                                  TextFormField(
                                    style: const TextStyle(fontSize: 16),
                                    initialValue: user.biography,
                                    decoration: getInputDecoration(
                                      bio ?? '',
                                      Icons.edit,
                                    ),
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 5,
                                    onSaved: (value) {
                                      _userData['bio'] = value.toString();
                                    },
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(bottom: 5.0),
                                      child: Text(
                                        'Facebook Link',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ).translate(),
                                    ),
                                  ),
                                  TextFormField(
                                    style: const TextStyle(fontSize: 16),
                                    initialValue: user.facebook,
                                    decoration: getInputDecoration(
                                      flink ?? '',
                                      MdiIcons.facebook,
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                    onSaved: (value) {
                                      _userData['facebook'] = value.toString();
                                    },
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(bottom: 5.0),
                                      child: Text(
                                        'Twitter Link',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ).translate(),
                                    ),
                                  ),
                                  TextFormField(
                                    style: const TextStyle(fontSize: 16),
                                    initialValue: user.twitter,
                                    decoration: getInputDecoration(
                                      tlink ?? '',
                                      MdiIcons.twitter,
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                    onSaved: (value) {
                                      _userData['twitter'] = value.toString();
                                    },
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(bottom: 5.0),
                                      child: Text(
                                        'LinkedIn Link',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ).translate(),
                                    ),
                                  ),
                                  TextFormField(
                                    style: const TextStyle(fontSize: 16),
                                    initialValue: user.linkedIn,
                                    decoration: getInputDecoration(
                                      llink ?? '',
                                      MdiIcons.linkedin,
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                    onSaved: (value) {
                                      _userData['linkedin'] = value.toString();
                                    },
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: _isLoading
                                        ? const CircularProgressIndicator()
                                        : MaterialButton(
                                            onPressed: () {
                                              _userData['user_id'] =
                                                  user.userId!;
                                              _userData['email'] = user.email!;
                                              _userData['role'] = user.role!;
                                              _userData['validity'] =
                                                  user.validity.toString();
                                              _userData['device_verification'] =
                                                  user.deviceVerification!;
                                              _userData['token'] = user.token!;
                                              _submit();
                                              // print(_userData['validity']);
                                            },
                                            color: kPrimaryColor,
                                            textColor: Colors.white,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15, vertical: 15),
                                            splashColor: Colors.redAccent,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(7.0),
                                              side: const BorderSide(
                                                  color: kPrimaryColor),
                                            ),
                                            child: const Text(
                                              'Update Now',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ).translate(),
                                          ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          }
        },
      ),
    );
  }
}
