import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';

class NotificationService with ChangeNotifier {
  late final FirebaseMessaging _messaging;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
      
   registerNotification() async {
    print('register user k andar a gya haaaa *************************');
    Future<Map<Permission, PermissionStatus>> requestPermission() async {
      Map<Permission, PermissionStatus> statuses =
          await [Permission.notification].request();
      return statuses;
    }
    _messaging = FirebaseMessaging.instance;
      _messaging.setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );
    
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
          FlutterLocalNotificationsPlugin();

      const AndroidInitializationSettings initializationSettingsAndroid =
          AndroidInitializationSettings('@mipmap/ic_launcher');

      final DarwinInitializationSettings initializationSettingsIOS =
          DarwinInitializationSettings();

      final InitializationSettings initializationSettings =
          InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsIOS,
      );

      await flutterLocalNotificationsPlugin.initialize(initializationSettings);
      
      FirebaseMessaging.onMessage.listen(showFlutterNotification);
    } else {
      print('User declined or has not accepted permission');
    }
  }

  void showFlutterNotification(RemoteMessage message) {
    print(message.data['badge']);
    FlutterAppBadger.updateBadgeCount(int.parse(message.data['badge']));
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails('your channel id', 'your channel name',
            importance: Importance.max,
            priority: Priority.high,
            showWhen: false);
    const DarwinNotificationDetails iOSPlatformChannelSpecifics =
        DarwinNotificationDetails(presentAlert: true,presentBadge: true, presentBanner: true,);
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    if (notification != null && !kIsWeb) {
      flutterLocalNotificationsPlugin.show(
          0, notification.title, notification.body, platformChannelSpecifics,
          payload: message.data.toString());
    }
  }

  Future onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) async {}

  Future _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    FirebaseMessaging.onMessageOpenedApp.listen(showFlutterNotification);
  }

  // // For handling notification when the app is in terminated state
  checkForInitialMessage() async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      showFlutterNotification(initialMessage);
    }
  }
}
