// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'package:academy_app/firebase_options.dart';
import 'package:academy_app/models/store_config.dart';
import 'package:academy_app/providers/bundles.dart';
import 'package:academy_app/providers/course_forum.dart';
import 'package:academy_app/providers/messages.dart';
import 'package:academy_app/providers/notification.dart';
import 'package:academy_app/screens/account_remove_screen.dart';
import 'package:academy_app/screens/auth_screen_private.dart';
import 'package:academy_app/screens/downloaded_course_list.dart';
import 'package:academy_app/screens/edit_password_screen.dart';
import 'package:academy_app/screens/edit_profile_screen.dart';
import 'package:academy_app/screens/message_detail_screen.dart';
import 'package:academy_app/screens/message_screen.dart';
import 'package:academy_app/screens/start_chat_screen.dart';
import 'package:academy_app/screens/sub_category_screen.dart';
import 'package:academy_app/screens/verification_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_translator/google_translator.dart';
import 'package:logging/logging.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'providers/auth.dart';
import 'providers/courses.dart';
import 'providers/http_overrides.dart';
import 'providers/misc_provider.dart';
import 'providers/my_bundles.dart';
import 'providers/my_courses.dart';
import 'screens/bundle_details_screen.dart';
import 'screens/bundle_list_screen.dart';
import 'screens/courses_screen.dart';
import 'screens/device_verifcation.dart';
import 'screens/forgot_password_screen.dart';
import 'screens/my_bundle_courses_list_screen.dart';
import 'screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'constants.dart';
import 'providers/categories.dart';
import 'screens/auth_screen.dart';
import 'screens/course_detail_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/tabs_screen.dart';

void main() async {
  Logger.root.onRecord.listen((LogRecord rec) {
    debugPrint(
        '${rec.loggerName}>${rec.level.name}: ${rec.time}: ${rec.message}');
  });

  HttpOverrides.global = PostHttpOverrides();
  if (Platform.isIOS || Platform.isMacOS) {
    StoreConfig(
      store: Store.appStore,
      apiKey: "appl_VAsXjeOhTXNhbTHAajMdeiFQrLO",
    );
  } else if (Platform.isAndroid) {
    StoreConfig(
      store: Store.playStore,
      apiKey: "goog_InUihwVqgPognVPbeJeHUNLkPDf",
    );
  }
  WidgetsFlutterBinding.ensureInitialized();
  GetStorage.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final NotificationService notificationService = NotificationService();
  await notificationService.registerNotification();
  await notificationService.checkForInitialMessage();
  // if(Purchases.isConfigured == false)
  await _configureSDK();

  runApp(const MyApp());
}

Future<void> _configureSDK() async {
  await Purchases.setLogLevel(LogLevel.debug);

  PurchasesConfiguration configuration;

  configuration = PurchasesConfiguration(StoreConfig.instance.apiKey);

  configuration.entitlementVerificationMode =
      EntitlementVerificationMode.informational;
  await Purchases.configure(configuration);

  await Purchases.enableAdServicesAttributionTokenCollection();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    GetStorage box = GetStorage();
    box.read('Locale') == null ? box.write('Locale', 'en') : null;
    String locale = box.read('Locale') == null ? 'en' : box.read('Locale');
    return GoogleTranslatorInit('AIzaSyDbNMn6QSmOy3co3IaFXu09hJGBuNihHFI',
        translateFrom: box.read('Locale') == 'en' ? Locale('ur') : Locale('en'),
        translateTo: Locale(locale),
        automaticDetection: false, builder: () {
      return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (ctx) => Auth(),
            ),
            ChangeNotifierProvider(
              create: (ctx) => NotificationService(),
            ),
            ChangeNotifierProvider(
              create: (ctx) => Categories(),
            ),
            ChangeNotifierProvider(
              create: (ctx) => Messages(),
            ),
            ChangeNotifierProxyProvider<Auth, Courses>(
              create: (ctx) => Courses([], []),
              update: (ctx, auth, prevoiusCourses) => Courses(
                prevoiusCourses == null ? [] : prevoiusCourses.items,
                prevoiusCourses == null ? [] : prevoiusCourses.topItems,
              ),
            ),
            ChangeNotifierProxyProvider<Auth, MyCourses>(
              create: (ctx) => MyCourses([], []),
              update: (ctx, auth, previousMyCourses) => MyCourses(
                previousMyCourses == null ? [] : previousMyCourses.items,
                previousMyCourses == null ? [] : previousMyCourses.sectionItems,
              ),
            ),
            ChangeNotifierProvider(
              create: (ctx) => Languages(),
            ),
            ChangeNotifierProvider(
              create: (ctx) => Bundles(),
            ),
            ChangeNotifierProvider(
              create: (ctx) => MyBundles(),
            ),
            ChangeNotifierProvider(
              create: (ctx) => CourseForum(),
            ),
          ],
          child: Consumer<Auth>(
              builder: (ctx, auth, _) => MaterialApp(
                    title: 'Academy App',
                    theme: ThemeData(
                      fontFamily: 'google_sans',
                      colorScheme: ColorScheme.fromSwatch(
                              primarySwatch: Colors.deepPurple)
                          .copyWith(secondary: kDarkButtonBg),
                    ),
                    debugShowCheckedModeBanner: false,
                    home: const SplashScreen(),
                    routes: {
                      '/home': (ctx) => const TabsScreen(),
                      AuthScreen.routeName: (ctx) => const AuthScreen(),
                      MessagesScreen.routeName: (ctx) => const MessagesScreen(),
                      StartChatScreen.routeName: (ctx) =>
                          const StartChatScreen(),
                      AuthScreenPrivate.routeName: (ctx) =>
                          const AuthScreenPrivate(),
                      SignUpScreen.routeName: (ctx) => const SignUpScreen(),
                      ForgotPassword.routeName: (ctx) => const ForgotPassword(),
                      CoursesScreen.routeName: (ctx) => const CoursesScreen(),
                      CourseDetailScreen.routeName: (ctx) =>
                          const CourseDetailScreen(),
                      EditPasswordScreen.routeName: (ctx) =>
                          const EditPasswordScreen(),
                      EditProfileScreen.routeName: (ctx) =>
                          const EditProfileScreen(),
                      VerificationScreen.routeName: (ctx) =>
                          const VerificationScreen(),
                      AccountRemoveScreen.routeName: (ctx) =>
                          const AccountRemoveScreen(),
                      DownloadedCourseList.routeName: (ctx) =>
                          const DownloadedCourseList(),
                      SubCategoryScreen.routeName: (ctx) =>
                          const SubCategoryScreen(),
                      MessageDetailScreen.routeName: (ctx) =>
                          const MessageDetailScreen(),
                      BundleListScreen.routeName: (ctx) =>
                          const BundleListScreen(),
                      BundleDetailsScreen.routeName: (ctx) =>
                          const BundleDetailsScreen(),
                      MyBundleCoursesListScreen.routeName: (ctx) =>
                          const MyBundleCoursesListScreen(),
                      DeviceVerificationScreen.routeName: (context) =>
                          const DeviceVerificationScreen(),
                    },
                  )));
    });
  }
}
