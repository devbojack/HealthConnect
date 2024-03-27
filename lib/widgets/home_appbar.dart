import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthconnect/constants/assets_constants.dart';
import 'package:healthconnect/identifications/secret_ids.dart';
import 'package:healthconnect/widgets/text_icon_widgets.dart';

AppBar homeAppBar(String title, BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,
    elevation: 0,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    centerTitle: true,
    title: Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 32,
          width: 32,
          child: Image.asset(AssetConstants.appBarLogo),
        ),
        SizedBox(
          height: 40,
          child: Row(children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    UserData.userPoints,
                    style: GoogleFonts.roboto(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).indicatorColor.withOpacity(0.7),
                    ),
                  ),
                  Text(UserData.userName,
                      style: GoogleFonts.roboto(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color:
                            Theme.of(context).indicatorColor.withOpacity(0.8),
                      )),
                ]),
            const SizedBox(width: 6),
            Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  image: const DecorationImage(
                    image: AssetImage(UserData.userPic),
                    fit: BoxFit.contain,
                  )),
            )
          ]),
        )
      ],
    ),
  );
}
