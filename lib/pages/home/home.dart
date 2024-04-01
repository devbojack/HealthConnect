import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthconnect/provider/size_config.dart';
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
    SizeConfig().init(context);
    double mHeight = SizeConfig.blockSizeH!;
    double mWidth = SizeConfig.blockSizeW!;

    return MyBackground(
      child: Scaffold(
        appBar: homeAppBar(context),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            askAQuestion(context),
            Expanded(
              child: ListView.builder(
                itemCount: 4, // Number of questions you want to display
                itemBuilder: (context, index) {
                  return Column(children: [
                    Divider(
                        color: Theme.of(context).dividerColor.withOpacity(0.2)),
                    questions(
                      context,
                      "10 votes",
                      "2 answers",
                      "Is running on the treadmill while pregnant good for you?",
                      "Ben White",
                      "16 mins ago",
                    ),
                    index == 3
                        ? Divider(
                            color:
                                Theme.of(context).dividerColor.withOpacity(0.2))
                        : const SizedBox()
                  ]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget questions(
    BuildContext context,
    String votes,
    String answers,
    String question,
    String user,
    String time,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(right: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  votes,
                  textAlign: TextAlign.right,
                  style: GoogleFonts.roboto(
                    color: Theme.of(context).dividerColor.withOpacity(0.8),
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  constraints: const BoxConstraints(minWidth: 80),
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: Colors.green,
                      width: 0.8,
                    ),
                  ),
                  child: Text(
                    answers,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: GoogleFonts.roboto(
                      color: Colors.green,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                question,
                style: GoogleFonts.roboto(
                  color: Theme.of(context).dividerColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 6),
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      user,
                      textAlign: TextAlign.right,
                      style: GoogleFonts.roboto(
                        color: Theme.of(context).primaryColor,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      time,
                      textAlign: TextAlign.right,
                      style: GoogleFonts.roboto(
                        color: Theme.of(context).dividerColor.withOpacity(0.8),
                        fontSize: 10,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }

  Widget askAQuestion(context) {
    return Padding(
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
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(8),
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
    );
  }
}
