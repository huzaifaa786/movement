import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:noobz/helpers/loading.dart';
import 'package:noobz/routes/app_routes.dart';

class WithOtpController extends GetxController {
  static WithOtpController instance = Get.find();
  String language = 'english';
  String phone = '';
  String otpCode = '';
  bool isSelected = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  //----------------otp sign-up/ sign-in--------
  RxString? last2;
  String? completePhone;
  int? resendtoken;
  String verificationid = "";
  void sendTokenforSignUP() async {
    LoadingHelper.show();
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      await auth.verifyPhoneNumber(
        timeout: const Duration(minutes: 2),
        phoneNumber: completePhone,
        verificationCompleted: (PhoneAuthCredential credential) async {},
        verificationFailed: (FirebaseAuthException e) {
          LoadingHelper.dismiss();
          print(e.message);
          Get.snackbar('Verification failed', e.message!,
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red,
              colorText: Colors.white);
        },
        forceResendingToken: resendtoken,
        codeSent: (String verificationId, int? resendToken) {
          print(verificationId);
          last2 = completePhone!.substring(completePhone!.length - 3).obs;
          verificationid = verificationId;
          resendtoken = resendToken;
          LoadingHelper.dismiss();
          Get.snackbar('OTP has been successfully send', '',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green,
              colorText: Colors.white);
          // Get.to(() => LoginOtpVerifyScreen());
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // verificationid = verificationId;
          // Get.snackbar('TIMEOUT', '',
          //     snackPosition: SnackPosition.BOTTOM,
          //     backgroundColor: Colors.green,
          //     colorText: white);
        },
      );
    } on FirebaseAuthException catch (e) {
      LoadingHelper.dismiss();
      Get.snackbar('Error', e.message.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    }
  }

  String usersCollection = "users";
  void verifyPhone(String phone1) async {
    print(phone1.length.toString() +
        '000000000000001233456**********************************');

    try {
      if (phone1.length == 6) {
        LoadingHelper.show();
        final token = await FirebaseMessaging.instance.getToken();
        var val = await FirebaseFirestore.instance
            .collection('users')
            .where('phone', isEqualTo: completePhone)
            .limit(1)
            .get();
        final List<DocumentSnapshot> number = val.docs;
        await auth
            .signInWithCredential(PhoneAuthProvider.credential(
          verificationId: verificationid,
          smsCode: phone1,
        ))
            .then((value) async {
          String userID = value.user!.uid;
          if (number.isEmpty) {
            await firebaseFirestore
                .collection(usersCollection)
                .doc(userID)
                .set({
              "id": userID,
              'token': token,
              "email": '',
              "name": phone,
              "phone": completePhone,
            });
            print('object********************************');
          } else {
            await firebaseFirestore
                .collection(usersCollection)
                .doc(userID)
                .update({
              'token': token,
            });
          }
          Get.toNamed(AppRoutes.individualHome);
        }).onError((error, stackTrace) {
          Get.snackbar('Error!', error.toString(),
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red,
              colorText: Colors.white);
          LoadingHelper.dismiss();
        });
        LoadingHelper.dismiss();
      } else {
        Get.snackbar('Error!', 'Plese Enter Complete Code',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);
        LoadingHelper.dismiss();
      }
    } on FirebaseAuthException catch (e) {
      LoadingHelper.dismiss();
      Get.snackbar('Error!', e.message!,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }
}
