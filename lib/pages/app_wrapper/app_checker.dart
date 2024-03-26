import 'dart:io';
import 'package:flutter/material.dart';
import 'package:healthconnect/pages/app_wrapper/app_wrapper.dart';
import 'package:healthconnect/widgets/my_background.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'no_connection_page.dart';

class AppChecker extends StatefulWidget {
  const AppChecker({super.key});

  @override
  State<AppChecker> createState() => _AppCheckerState();
}

class _AppCheckerState extends State<AppChecker> {
  bool hasInternet = true;
  bool isConnected = true;

  @override
  void initState() {
    checkInternetConnection();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MyBackground(
        child: hasInternet && isConnected
            ? const AppWrapper()
            : NoInternetConnectionPage(onRefreshScreen: checkInternetConnection()));
  }

  ///_____________________________________________________________Refresh Screen
  Future<void> checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('www.google.com');
      if (result.isNotEmpty) {
        setState(() {
          isConnected = true;
        });
      }
    } on SocketException catch (e) {
      setState(() {
        isConnected = false;
      });
    }
    InternetConnectionChecker().onStatusChange.listen((status) {
      final results = status == InternetConnectionStatus.connected;
      setState(() {
        hasInternet = results;
      });
    });
  }
}
