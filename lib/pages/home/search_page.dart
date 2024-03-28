import 'package:flutter/material.dart';
import 'package:healthconnect/widgets/home_appbar.dart';
import 'package:healthconnect/widgets/my_background.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return MyBackground(
        child: Scaffold(
            appBar: homeAppBar(context), body: Container(color: Colors.green),),);
  }
}
