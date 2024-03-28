import 'package:flutter/material.dart';
import '../model/new_styles.dart';


class TxtButton extends StatelessWidget {
  const TxtButton({
    Key? key,
    required this.onPressed,
    required this.title,

  }) : super(key: key);
  final VoidCallback onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize: const Size(50, 30),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: Text(
          title,
          style: normalGreenBoldTextStyle(context),
        ));
  }
}