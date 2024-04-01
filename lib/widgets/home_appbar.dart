import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthconnect/constants/assets_constants.dart';
import 'package:healthconnect/identifications/secret_ids.dart';
import 'package:healthconnect/pages/home/profile_page.dart';

AppBar homeAppBar(BuildContext context) {
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 32,
              width: 32,
              child: Image.asset(AssetConstants.appLogo),
            ),
            const SizedBox(width: 8),
            Text(
              'HealthConnect',
              style: GoogleFonts.roboto(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).dividerColor.withOpacity(0.9),
              ),
            ),
          ],
        ),
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfilePage(),
              ),
            );
          },
          child: SizedBox(
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
                        color: Theme.of(context).dividerColor.withOpacity(0.7),
                      ),
                    ),
                    Text(UserData.userName,
                        style: GoogleFonts.roboto(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color:
                              Theme.of(context).dividerColor.withOpacity(0.8),
                        )),
                  ]),
              const SizedBox(width: 6),
              Column(
                children: [
                  Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image: const DecorationImage(
                        image: AssetImage(UserData.userPic),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              )
            ]),
          ),
        ),
      ],
    ),
  );
}
