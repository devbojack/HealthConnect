import 'package:flutter/material.dart';
import 'package:healthconnect/widgets/my_background.dart';
import 'package:healthconnect/widgets/home_appbar.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return MyBackground(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: homeAppBar(context),
      body: Container(
      color: Colors.blue,
    ),),);
  }
}