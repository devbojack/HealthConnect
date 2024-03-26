import 'package:flutter/material.dart';
import 'package:healthconnect/widgets/text_icon_widgets.dart';
import '../constants/image_constants.dart';

AppBar secAppBar(String subTitle, BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,
    elevation: 0,
    backgroundColor: Colors.transparent,
    centerTitle: true,
    leading: GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: normalIcon(Icons.arrow_back_ios, context)
    ),
    title: Row(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(height: 26, width: 26, child: Image.asset(sbSplash),),
      const SizedBox(width:6),
      normalBoldText(subTitle, context),
    ],
  ),
  );
}