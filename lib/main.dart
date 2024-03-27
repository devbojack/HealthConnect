import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:healthconnect/identifications/secret_ids.dart';
import 'package:healthconnect/pages/app_wrapper/app_checker.dart';
import 'package:healthconnect/pages/signing/google_signin_provider.dart';
import 'package:healthconnect/provider/theme_provider.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:firebase_options.dart';

//________________________________________________________________________________________APP KEY CONSTANTS
const appVersion = ApplicationDetails.appVersion;
const appBundle = ApplicationDetails.appBundle;
const appName = ApplicationDetails.appName;
bool isNotificationOn = true;
bool isLightTheme = true;
//________________________________________________________________________________________

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'HC_1', // id
  'HealthConnect Notifications', // title
  description: 'HealthConnect notifications.',
  importance: Importance.max,
);
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

///_____________________________________________________________________________
///___________________________START OF MAIN_________________________///
///_____________________________________________________________________________
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //____________________________________________________________________________Firebase Initialize
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: FirebaseOptionsIds.apiKey,
    appId: FirebaseOptionsIds.appId,
    messagingSenderId: FirebaseOptionsIds.messagingSenderId,
    projectId: FirebaseOptionsIds.projectId,
    storageBucket: FirebaseOptionsIds.storageBucket,
  ));

  //____________________________________________________________________________Notification
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isNotificationOn = (prefs.getBool('notifyMe') ?? true);

  //_____________________________________________________________________________Set Device Settings
  //____________________________________________ORIENTATION
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  ///___________________________________________BRIGHTNESS
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<GoogleSignInProvider>(
            create: (_) => GoogleSignInProvider()),
        ChangeNotifierProvider<ThemeProvider>(
            create: (_) => ThemeProvider()..initialize()),
      ],
      child: const MyApp(),
    ),
  );
}

//_______________________________________________________________________________________________________MY APP
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, provider, child) {
      return OverlaySupport.global(
          child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: appName,
              themeMode: provider.themeMode,
              darkTheme: MyThemes.darkTheme,
              theme: MyThemes.lightTheme,
              home: const AppChecker()));
    });
  }
}
