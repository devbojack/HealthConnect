import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthconnect/widgets/home_appbar.dart';
import 'package:healthconnect/widgets/my_background.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MyBackground(
      child: Scaffold(
        appBar: homeAppBar(context),
        body: Container(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Top Question',
                      style: GoogleFonts.roboto(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).dividerColor,
                      ),
                    ),
                    Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'Ask a Question?',
                        style: GoogleFonts.roboto(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ListView(
                children: [
                  Divider(
                    thickness: 0.6,
                    color: Theme.of(context).dividerColor.withOpacity(0.4),
                  ),
                  questions(
                    "10",
                    "2",
                    "Is running on the treadmill while pregnant goodfor you?",
                    "Ben White",
                    "16 mins ago",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget questions(
      String votes, String answers, String question, String user, String time) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Column(
            children: [
              Column(children: [
                Text(
                  votes,
                  style: GoogleFonts.roboto(
                    color: Theme.of(context).dividerColor.withOpacity(0.4),
                    fontSize: 10,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  height: 32,
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: Colors.green,
                      width: 0.6,
                    ),
                  ),
                  child: Text(
                    answers,
                    style: GoogleFonts.roboto(
                      color: Colors.green,
                      fontSize: 10,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ]),
            ],
          ),
          const SizedBox(width: 8),
          Column(
            children: [
              Text(
                question,
                style: GoogleFonts.roboto(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 6),
              SizedBox(
                width: double.infinity,
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Text(
                    user,
                    style: GoogleFonts.roboto(
                      color: Theme.of(context).primaryColor,
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    time,
                    style: GoogleFonts.roboto(
                        color: Theme.of(context).dividerColor.withOpacity(0.6),
                        fontSize: 10,
                        fontWeight: FontWeight.w400),
                  ),
                ]),
              ),
            ],
          )
        ],
      ),
    );
  }
}
