import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:healthconnect/model/comment_data_model.dart";
import "package:healthconnect/model/question_data_model.dart";
import "package:healthconnect/widgets/questions_page/add_answer_comment.dart";
import "package:healthconnect/widgets/questions_page/comments.dart";
import "package:healthconnect/widgets/questions_page/new_answer_box.dart";
import "package:healthconnect/widgets/questions_page/tab_box.dart";
import 'package:intl/intl.dart';

import "../../model/answer_data_model.dart";

class QuestionBox extends StatefulWidget {
  const QuestionBox({required this.questionDataModel, super.key});

  final QuestionDataModel questionDataModel;

  @override
  State<QuestionBox> createState() => _QuestionBoxState();
}

class _QuestionBoxState extends State<QuestionBox> {
  Duration differenceBetweenNowAndTimestamp(Timestamp timestamp) {
    DateTime now = DateTime.now();
    DateTime dateTimeFromTimestamp =
    timestamp.toDate(); // Convert Firebase Timestamp to DateTime
    return now.difference(dateTimeFromTimestamp);
  }

  @override
  Widget build(BuildContext context) {
    final questionData = widget.questionDataModel;
    Timestamp modifiedAt = Timestamp.fromDate(questionData.modified);
    Timestamp createdAt = Timestamp.fromDate(questionData.created_at);
    String modifiedDuration = '';
    String createdDuration = '';

    final askedDate = questionData.created_at;
    final dateFormat = DateFormat('yyyy-MM-dd').format(askedDate);
    final timeFormat = DateFormat('HH:mm').format(askedDate);
    var votes = (questionData.upvotes.length - questionData.downvotes.length);

    if (differenceBetweenNowAndTimestamp(modifiedAt).inHours > 24) {
      modifiedDuration =
      '${differenceBetweenNowAndTimestamp(modifiedAt).inDays} days ago';
    } else {
      modifiedDuration = 'Today';
    }

    if (differenceBetweenNowAndTimestamp(createdAt).inHours > 24) {
      createdDuration =
      '${differenceBetweenNowAndTimestamp(createdAt).inDays} days ago';
    } else {
      createdDuration = 'Today';
    }

    final points =
    (questionData.upvotes.length - questionData.downvotes.length);
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 16,
      ),
      child: ListView(
        children: [
          Text(
            questionData.title,
            style: GoogleFonts.roboto(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Theme
                    .of(context)
                    .dividerColor),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              RichText(
                text: TextSpan(
                    text: 'Asked ',
                    style: GoogleFonts.roboto(
                      fontSize: 11,
                      color: Theme
                          .of(context)
                          .dividerColor
                          .withOpacity(0.7),
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: createdDuration,
                        style: GoogleFonts.roboto(
                            fontSize: 11,
                            color: Theme
                                .of(context)
                                .dividerColor),
                      ),
                    ]),
              ),
              const SizedBox(width: 6),
              RichText(
                text: TextSpan(
                    text: 'Modified ',
                    style: GoogleFonts.roboto(
                      fontSize: 11,
                      color: Theme
                          .of(context)
                          .dividerColor
                          .withOpacity(0.7),
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: modifiedDuration,
                        style: GoogleFonts.roboto(
                            fontSize: 11,
                            color: Theme
                                .of(context)
                                .dividerColor),
                      ),
                    ]),
              ),
              const SizedBox(width: 6),
              RichText(
                text: TextSpan(
                    text: 'Viewed ',
                    style: GoogleFonts.roboto(
                      fontSize: 11,
                      color: Theme
                          .of(context)
                          .dividerColor
                          .withOpacity(0.7),
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '${questionData.views} times',
                        style: GoogleFonts.roboto(
                            fontSize: 11,
                            color: Theme
                                .of(context)
                                .dividerColor),
                      ),
                    ]),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Divider(
              color: Theme
                  .of(context)
                  .dividerColor
                  .withOpacity(0.5),
              thickness: 0.6),
          const SizedBox(height: 4),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 60,
                padding: const EdgeInsets.only(right: 12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      behavior: HitTestBehavior.translucent,
                      child: Icon(Icons.arrow_circle_up,
                          size: 32, color: Theme
                              .of(context)
                              .dividerColor),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      points.toString(),
                      style: GoogleFonts.roboto(
                        fontSize: 12,
                        color: Theme
                            .of(context)
                            .dividerColor,
                      ),
                    ),
                    const SizedBox(height: 3),
                    GestureDetector(
                      onTap: () {},
                      behavior: HitTestBehavior.translucent,
                      child: Icon(Icons.arrow_circle_down,
                          size: 32, color: Theme
                              .of(context)
                              .dividerColor),
                    ),
                    const SizedBox(height: 6),
                    GestureDetector(
                      onTap: () {},
                      behavior: HitTestBehavior.translucent,
                      child: Icon(Icons.bookmark_border,
                          size: 24, color: Theme
                              .of(context)
                              .dividerColor),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      questionData.body,
                      style: GoogleFonts.roboto(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Theme
                              .of(context)
                              .dividerColor),
                    ),
                    const SizedBox(height: 8),
                    if (questionData.tag != '')
                      SizedBox(
                        height: 32,
                        child: tagsBox(questionData.tag),
                      ),
                    Container(
                      constraints: const BoxConstraints(minWidth: 100),
                      margin: const EdgeInsets.only(top: 12),
                      padding: const EdgeInsets.only(
                          left: 4, right: 12, top: 6, bottom: 6),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 38, 79, 155),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Asked $dateFormat at $timeFormat",
                            style: GoogleFonts.roboto(
                              fontSize: 12,
                              color: Colors.white.withOpacity(0.7),
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            questionData.owner,
                            textAlign: TextAlign.right,
                            style: GoogleFonts.roboto(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    // ____________________________________________Comments
                    if (questionData.comments.isNotEmpty)
                      ListView.builder(
                          shrinkWrap: false,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: questionData.comments.length,
                          itemBuilder: (BuildContext context, int index) {
                            return FutureBuilder<CommentDataModel?>(
                              future: getCommentsData(
                                  questionData.comments?[index]),
                              builder: (context, snapshot) {
                                final commentData = snapshot.data;
                                return CommentBox(
                                    commentDataModel: commentData!);
                              },
                            );
                          }),

                    const SizedBox(height: 16),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {},
                      child: Text(
                        'Add Comment',
                        style: GoogleFonts.roboto(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Colors.green),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          if (questionData.answers.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${questionData.answers!.length} answers",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.roboto(
                    color: Theme
                        .of(context)
                        .dividerColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 16),
                //___________________________________________Answers
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: questionData.answers.length,
                  itemBuilder: (BuildContext context, int index) {
                    final answer = questionData.answers[index];
                    return FutureBuilder<AnswerDataModel?>(
                      future: getAnswerData(answer),
                      builder: (context, snapshot) {
                        final answerData = snapshot.data;
                        return NewAnswerBox(
                            answerBoxModel: answerData!
                        );
                      },
                    );
                  },
                ),
                const SizedBox(height: 16),

                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) =>
                        AddAnswerComment(isAddingAnswer: true,
                            questionAnswerId: questionData.questionId,
                            isQuestion: true)));
                  },
                  child: Container(
                    padding: const EdgeInsets.only(left: 24),
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {},
                      child: Text(
                        'Add Answer',
                        style: GoogleFonts.roboto(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: const Color.fromARGB(255, 14, 169, 0)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Future<CommentDataModel?> getCommentsData(String commentsId) async {
    final commentData =
    FirebaseFirestore.instance.collection("comments").doc(commentsId);
    final snapShot = await commentData.get();
    if (snapShot.exists) {
      return CommentDataModel.fromJson(snapShot.data()!);
    }
    return null;
  }
}

Future<AnswerDataModel?> getAnswerData(String answerId) async {
  final answerData = FirebaseFirestore.instance.collection("answers").doc(
      answerId);
  final snapShot = await answerData.get();
  if (snapShot.exists) {
    return AnswerDataModel.fromJson(snapShot.data()!);
  }
  return null;
}
