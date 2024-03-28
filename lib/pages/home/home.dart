import 'package:flutter/material.dart';
import 'package:healthconnect/widgets/home_appbar.dart';
import 'package:healthconnect/widgets/my_background.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MyBackground(
        child: Scaffold(appBar: homeAppBar(context), body: Container()));
  }
}
