import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      body: ListView(
      children: [
       Center(child:  Text('You have 0 notifications', style: GoogleFonts.roboto(color: Theme.of(context).dividerColor.withOpacity(0.6),))),
        ],
    ),),);
  }
}