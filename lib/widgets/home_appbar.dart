import 'package:flutter/material.dart';
import 'package:healthconnect/constants/assets_constants.dart';
import 'package:healthconnect/widgets/text_icon_widgets.dart';

AppBar homeAppBar(String title, BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,
    elevation: 0,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    centerTitle: true,
    title: Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 32,
          width: 32,
          child: Image.asset(Theme.of(context).brightness == Brightness.dark
              ? AssetConstants.lightAppIcon
              : AssetConstants.darkAppIcon),
        ),
        const SizedBox(width: 4),
        normalBoldText(title, context),
      ],
    ),
  );
}
