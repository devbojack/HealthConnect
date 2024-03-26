import 'package:flutter/material.dart';
import 'package:healthconnect/model/new_styles.dart';
import 'package:healthconnect/widgets/text_icon_widgets.dart';
import '../constants/image_constants.dart';
import '../constants/new_color_constants.dart';


AppBar homeAppBar(String title, BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,
    elevation: 0,
    backgroundColor: Colors.transparent,
    centerTitle: true,
    title: Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 26, width: 26, child: Image.asset(sbSplash),),
        const SizedBox(width:4),
        normalBoldText(title, context),
      ],
    ),
  );
}

AppBar homePremiumAppBar(String title, BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,
    elevation: 0,
    backgroundColor: Colors.transparent,
    centerTitle: true,
    title: Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 26, width: 26, child: Image.asset(sbSplash),),
        const SizedBox(width:6),
        normalBoldText(title, context),
      ],
    ),
    bottom: TabBar(
      indicatorWeight: 3,
      labelColor: newAppBlue,
      indicatorColor: newAppBlue,
      unselectedLabelColor: Theme.of(context).dividerColor.withOpacity(0.7),
      labelStyle: normalColoredWeightedTextStyle(appBlue, FontWeight.bold),
      unselectedLabelStyle: normalLightTextStyle(context),
      tabs: const [
        Tab(text: 'Home'),
        Tab(text: 'Daily Double')
      ],
    ),
  );
}
