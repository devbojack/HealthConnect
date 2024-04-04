import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:healthconnect/model/answer_data_model.dart";
import "package:healthconnect/widgets/questions_page/comments.dart";
import "package:intl/intl.dart";

import "../../model/comment_data_model.dart";
import "add_answer_comment.dart";

class NewAnswerBox extends StatefulWidget {
  const NewAnswerBox({required this.answerBoxModel, super.key});

  final AnswerDataModel answerBoxModel;

  @override
  State<NewAnswerBox> createState() => _NewAnswerBoxState();
}

class _NewAnswerBoxState extends State<NewAnswerBox> {
  Duration differenceBetweenNowAndTimestamp(Timestamp timestamp) {
    DateTime now = DateTime.now();
    DateTime dateTimeFromTimestamp =
        timestamp.toDate(); // Convert Firebase Timestamp to DateTime
    return now.difference(dateTimeFromTimestamp);
  }

  @override
  Widget build(BuildContext context) {
    final answerData = widget.answerBoxModel;
    final points =
        (answerData.upvotes.length - answerData.downvotes.length).toString();
    final askedDate = answerData.created_at;
    final dateFormat = DateFormat('yyyy-MM-dd').format(askedDate);
    final timeFormat = DateFormat('HH:mm').format(askedDate);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 16,
      ),
      child: Column(
        children: [
          Divider(
              color: Theme.of(context).dividerColor.withOpacity(0.5),
              thickness: 0.5),
          const SizedBox(height: 6),
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
                          size: 32, color: Theme.of(context).dividerColor),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      points,
                      style: GoogleFonts.roboto(
                        fontSize: 12,
                        color: Theme.of(context).dividerColor,
                      ),
                    ),
                    const SizedBox(height: 3),
                    GestureDetector(
                      onTap: () {},
                      behavior: HitTestBehavior.translucent,
                      child: Icon(Icons.arrow_circle_down,
                          size: 32, color: Theme.of(context).dividerColor),
                    ),
                    const SizedBox(height: 6),
                    GestureDetector(
                      onTap: () {},
                      behavior: HitTestBehavior.translucent,
                      child: Icon(Icons.bookmark_border,
                          size: 24, color: Theme.of(context).dividerColor),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      answerData.answer,
                      style: GoogleFonts.roboto(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).dividerColor),
                    ),
                    const SizedBox(height: 8),
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
                            "Answered $dateFormat at $timeFormat",
                            style: GoogleFonts.roboto(
                              fontSize: 12,
                              color: Colors.white.withOpacity(0.7),
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            answerData.owner,
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
                    if (answerData.comments!.isNotEmpty)
                      ListView.builder(
                          shrinkWrap: false,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: answerData.comments?.length,
                          itemBuilder: (BuildContext context, int index) {
                            final commentLine = answerData.comments?[index];
                            return FutureBuilder<CommentDataModel?>(
                              future: getCommentsData(commentLine),
                              builder: (context, snapshot) {
                                final commentData = snapshot.data;
                                return CommentBox(
                                    commentDataModel: commentData!);
                              },
                            );
                          }),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ],
          ),
          // const SizedBox(height: 12),
          const SizedBox(height: 16),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => AddAnswerComment(
                      isAddingAnswer: false,
                      questionAnswerId: answerData.answerId,
                      isQuestion: false),
                ),
              );
            },
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
