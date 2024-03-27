import 'package:flutter/material.dart';
import 'package:healthconnect/widgets/text_icon_widgets.dart';
import '../constants/image_constants.dart';

AppBar pageAppBar(String subTitle, bool isBetsPage, BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,
    elevation: 0,
    backgroundColor: Colors.transparent,
    centerTitle: true,
    leading: isBetsPage
        ? IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: normalIcon(Icons.arrow_back_ios_new_rounded, context))
        : null,
    title: Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 24,
          width: 24,
          child: Image.asset(sbSplash),
        ),
        const SizedBox(width: 4),
        normalText(subTitle, context)
      ],
    ),
    // bottom: Tab(
    //   child: Text(subTitle,style: appBarSubTitle),
    // ),
  );
}
