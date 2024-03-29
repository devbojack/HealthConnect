import 'package:flutter/material.dart';
import 'package:healthconnect/widgets/home_appbar.dart';
import 'package:healthconnect/widgets/my_background.dart';

class AskAQuestion extends StatefulWidget {
  const AskAQuestion({super.key});

  @override
  State<AskAQuestion> createState() => _AskAQuestionState();
}

class _AskAQuestionState extends State<AskAQuestion> {
  @override
  Widget build(BuildContext context) {
    return MyBackground(
      child: Scaffold(
        appBar: homeAppBar(context),
        body: Container(color: Colors.blue)
      )
    );
  }
}