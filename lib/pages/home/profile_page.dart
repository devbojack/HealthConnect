import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthconnect/provider/size_config.dart';
import 'package:healthconnect/widgets/my_background.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String userName = 'Bojack Jack';
  String userWork = 'Backend Developer';
  String memberSince = 'Member for 3 years, 2 months';
  String userAbout =
      "Greetings! I'm Justus Lolwerikoi, a dedicated full-stack developer driven by a passion for creating innovative solutions and captivating user experiences. With a robust background in backend development and a keen eye for frontend design, I thrive on turning ideas into polished, functional software.";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double mHeight = SizeConfig.blockSizeH!;

    return MyBackground(
        child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                color: Theme.of(context).dividerColor,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('HealthConnect',
                      style: GoogleFonts.roboto(
                          fontSize: 13,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            body: ListView(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 12),
                children: [
                  profileHeader(),
                  const SizedBox(height: 16),
                  editProfile(),
                  const SizedBox(height: 24),
                  about(),
                  const SizedBox(height: 32),
                  questionAnswer(10, 3),
                ])));
  }

  Widget profileHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Image.asset('lib/identifications/profile_pic',
              width: 200, height: 200, fit: BoxFit.contain),
        ),
        const SizedBox(width: 8),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Bojack Jack',
              style: GoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).dividerColor),
            ),
            const SizedBox(height: 4),
            Text(
              'Backend Developer',
              style: GoogleFonts.roboto(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: Theme.of(context).dividerColor.withOpacity(0.8)),
            ),
            const SizedBox(height: 2),
            Text(
              'Member for 3 years,2 months',
              style: GoogleFonts.roboto(
                fontSize: 11,
                fontWeight: FontWeight.normal,
                color: Theme.of(context).dividerColor.withOpacity(0.6),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget about() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About',
            style: GoogleFonts.roboto(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Theme.of(context).dividerColor,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            userAbout,
            style: GoogleFonts.roboto(
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: Theme.of(context).dividerColor,
            ),
          ),
        ]);
  }

  Widget questionAnswer(double questionPoints, double answerPoints) {
    return Column(children: [
      Divider(
          color: Theme.of(context).dividerColor.withOpacity(0.4),
          thickness: 0.6),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xff21A700),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  offset: const Offset(
                    0,
                    4.0,
                  ),
                  blurRadius: 4.0,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Text(
              questionPoints.toString(),
              style: GoogleFonts.roboto(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Text("Questions",
              style: GoogleFonts.roboto(
                  fontSize: 12, color: Theme.of(context).dividerColor)),
        ],
      ),
      Divider(
          color: Theme.of(context).dividerColor.withOpacity(0.4),
          thickness: 0.6),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xff21A700),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  offset: const Offset(
                    0,
                    4.0,
                  ),
                  blurRadius: 4.0,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Text(
              answerPoints.toString(),
              style: GoogleFonts.roboto(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Text("Answers",
              style: GoogleFonts.roboto(
                  fontSize: 12, color: Theme.of(context).dividerColor)),
        ],
      ),
      Divider(
          color: Theme.of(context).dividerColor.withOpacity(0.4),
          thickness: 0.6),
    ]);
  }

  Widget questionPoint(double points, String question, String date) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xff21A700),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    offset: const Offset(
                      0,
                      4.0,
                    ),
                    blurRadius: 4.0,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Text(
                points.toString(),
                style: GoogleFonts.roboto(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Text("What's your challenge in the portfolio project",
                style: GoogleFonts.roboto(
                    fontSize: 12, color: Theme.of(context).dividerColor)),
          ],
        ),
        Text(
          // date,
          '20-03-2024',
          textAlign: TextAlign.right,
          style: GoogleFonts.roboto(
            fontSize: 11,
            fontWeight: FontWeight.normal,
            color: Theme.of(context).dividerColor.withOpacity(0.4),
          ),
        )
      ],
    );
  }

  Widget editProfile() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Container(
          //     padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          //     decoration: BoxDecoration(
          //       color: Colors.yellow,
          //       borderRadius: BorderRadius.circular(12),
          //       boxShadow: [
          //         BoxShadow(
          //           color: Theme.of(context).dividerColor.withOpacity(0.25),
          //           offset: const Offset(
          //             0,
          //             4.0,
          //           ),
          //           blurRadius: 4.0,
          //           spreadRadius: 0,
          //         )
          //       ],
          //     ),
          //     child:
          Text(
            '875',
            style: GoogleFonts.roboto(
                fontSize: 13,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold),
          ),
          // ),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Theme.of(context).scaffoldBackgroundColor,
                border: Border.all(
                  width: 0.6,
                  color: Theme.of(context).dividerColor.withOpacity(0.6),
                ),
              ),
              child: Text('Edit Profile',
                  style: GoogleFonts.roboto(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Theme.of(context).dividerColor.withOpacity(0.8)))),
        ]);
  }
}
