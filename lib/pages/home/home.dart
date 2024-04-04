import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthconnect/model/home_question_data.dart';
import 'package:healthconnect/pages/home/ask_a_question_page.dart';
import 'package:healthconnect/pages/home/home_loading_page.dart';
import 'package:healthconnect/pages/home/question_page.dart';
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
    return MyBackground(
      child: Scaffold(
        appBar: homeAppBar(context),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            askAQuestion(context),
            Expanded(
              child: StreamBuilder<List<HomeQuestionData>>(
                stream: readQuestions(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        'Something went wrong!',
                        style: GoogleFonts.roboto(
                            color: Theme.of(context).dividerColor,
                            fontSize: 14),
                      ),
                    );
                  } else if (snapshot.hasData) {
                    final questions = snapshot.data!;
                    return ListView(
                      children: questions.map(buildQuestion).toList(),
                    );
                  } else {
                    return const HomeLoadingPage();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Stream<List<HomeQuestionData>> readQuestions() => FirebaseFirestore.instance
      .collection("questions")
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => HomeQuestionData.fromJson(doc.data()))
          .toList());




  Duration differenceBetweenNowAndTimestamp(Timestamp timestamp) {
    DateTime now = DateTime.now();
    DateTime dateTimeFromTimestamp =
        timestamp.toDate(); // Convert Firebase Timestamp to DateTime

    return now.difference(dateTimeFromTimestamp);
  }


  Widget buildQuestion(HomeQuestionData homeQuestionData) {
    Timestamp createdAt = Timestamp.fromDate(homeQuestionData.created_at);
    String duration = '';
    // User? user = (await FirebaseAuth.instance.userChanges().firstWhere((user) => user!.uid == userId));

    var votes =
        (homeQuestionData.upvotes.length - homeQuestionData.downvotes.length);
    if (differenceBetweenNowAndTimestamp(createdAt).inHours > 24) {
      duration =
          '${differenceBetweenNowAndTimestamp(createdAt).inDays} days ago';
    } else if (differenceBetweenNowAndTimestamp(createdAt).inHours > 0) {
      duration =
          '${differenceBetweenNowAndTimestamp(createdAt).inHours} hours ago';
    } else {
      duration =
          '${differenceBetweenNowAndTimestamp(createdAt).inMinutes % 60} mins ago';
    }

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) =>
                QuestionPage(questionId: homeQuestionData.questionId)));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Theme.of(context).dividerColor.withOpacity(0.5),
              width: 0.5,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  votes == 1 ? "$votes vote" : "$votes votes",
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
                    homeQuestionData.answers.length == 1
                        ? "${homeQuestionData.answers.length.toString()} answer"
                        : "${homeQuestionData.answers.length.toString()} answers",
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
            const SizedBox(width: 12),
            Flexible(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  homeQuestionData.body,
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
                        homeQuestionData.owner,
                        textAlign: TextAlign.right,
                        style: GoogleFonts.roboto(
                          color: Theme.of(context).primaryColor,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        duration,
                        textAlign: TextAlign.right,
                        style: GoogleFonts.roboto(
                          color:
                              Theme.of(context).dividerColor.withOpacity(0.8),
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
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AskAQuestion()),
              );
            },
            child: Container(
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
          ),
        ],
      ),
    );
  }
}
