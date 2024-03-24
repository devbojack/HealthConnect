import 'package:flutter/material.dart';
import 'package:healthconnect/providers/theme_provider.dart';
import 'screens/authentication_screens/google_auth/google_auth_page.dart';
import 'screens/authentication_screens/introduction_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        // theme: MyThemes.lightTheme,
        theme: MyThemes.darkTheme,
        title: 'Health Connect',
        home: const SigningPage(isSigningIn: true));
  }
}
