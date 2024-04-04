import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthconnect/model/answer_data_model.dart';
import 'package:healthconnect/widgets/my_background.dart';

import '../../model/comment_data_model.dart';

class AddAnswerComment extends StatefulWidget {
  const AddAnswerComment(
      {required this.isAddingAnswer,
      required this.questionAnswerId,
      required this.isQuestion,
      super.key});

  final bool isAddingAnswer;
  final String questionAnswerId;
  final bool isQuestion;

  @override
  State<AddAnswerComment> createState() => _AddAnswerCommentState();
}

class _AddAnswerCommentState extends State<AddAnswerComment> {
  TextEditingController controller = TextEditingController();
  final GlobalKey<FormState> addingAnswerComment = GlobalKey<FormState>();

  late AutovalidateMode autoValidateMode;

  @override
  void initState() {
    autoValidateMode = AutovalidateMode.disabled;
    super.initState();
  }

  enableValidate() {
    setState(() {
      autoValidateMode = AutovalidateMode.onUserInteraction;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isAddingAnswer = widget.isAddingAnswer;
    final questionAnswerId = widget.questionAnswerId;
    final isQuestion = widget.isQuestion;

    return MyBackground(
      child: SafeArea(
        maintainBottomViewPadding: true,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            bottomOpacity: 0,
            scrolledUnderElevation: 0,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.close,
                    color: Theme.of(context).dividerColor,
                    size: 28,
                  )),
            ],
          ),
          body: SingleChildScrollView(
            padding:
                const EdgeInsets.only(left: 12, right: 12, top: 16, bottom: 12),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    isAddingAnswer ? 'Your Answer' : 'Your Comment',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.roboto(
                      color: Theme.of(context).dividerColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  key: addingAnswerComment,
                  minLines: 8,
                  maxLines: 12,
                  decoration: InputDecoration(
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(2),
                        borderSide: const BorderSide(
                            color: Colors.redAccent, width: 0.4)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(2),
                        borderSide: BorderSide(
                            color:
                                Theme.of(context).dividerColor.withOpacity(0.4),
                            width: 0.8)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(2),
                        borderSide: BorderSide(
                            color:
                                Theme.of(context).dividerColor.withOpacity(0.4),
                            width: 0.8)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(2),
                        borderSide: BorderSide(
                            color:
                                Theme.of(context).dividerColor.withOpacity(0.4),
                            width: 0.8)),
                    fillColor: Theme.of(context).dividerColor.withOpacity(0.03),
                    filled: true,
                  ),
                ),
                const SizedBox(height: 32),
                GestureDetector(
                  onTap: () {
                    enableValidate();
                    addingAnswerComment.currentState?.save();
                    if (!addingAnswerComment.currentState!.validate()) return;
                    showDialog(
                        context: context,
                        builder: (context) => const Center(
                              child: CircularProgressIndicator(
                                color: Colors.blue,
                              ),
                            ));
                    isAddingAnswer
                        ? createAnswer(questionAnswerId, controller.text)
                        : createComment(questionAnswerId, controller.text);
                  },
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 200),
                    alignment: Alignment.center,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      isAddingAnswer ? 'Post Your Answer' : 'Post Your Comment',
                      // textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                        fontSize: 13,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future createAnswer(String questionId, String answer) async {
    final docAnswer = FirebaseFirestore.instance.collection("answers").doc();
    User? currentUser = FirebaseAuth.instance.currentUser;
    final answerData = AnswerDataModel(
        owner: currentUser!.uid.toString(),
        answer: answer,
        created_at: DateTime.now(),
        downvotes: [],
        upvotes: [],
        answerId: docAnswer.id.toString(),
        comments: []);


    final json = answerData.toJson();
    await docAnswer.set(json);
    addToUserAndQuestion(
      currentUser,
      questionId,
      docAnswer.id.toString(),
    );
  }

  Future createComment(String questionAnswerId, String comment) async {
    final docComment = FirebaseFirestore.instance.collection("comments").doc();
    User? currentUser = FirebaseAuth.instance.currentUser;
    final commentData = CommentDataModel(
      owner: currentUser!.uid.toString(),
      comment: comment,
      created_at: DateTime.now(),
      upvotes: [],
      downvotes: [],
    );
    final json = commentData.toJson();
    await docComment.set(json);
    addCommentToUserOrAnswerOrQuestion(currentUser.uid.toString(),
        widget.isQuestion, widget.questionAnswerId, docComment.id.toString());
  }
}

Future addCommentToUserOrAnswerOrQuestion(String currentUser, bool isQuestion,
    String questionOrAnswerId, String commentId) async {
  try {
    // Update user of comments_given
    DocumentReference userReference =
        FirebaseFirestore.instance.collection('users').doc(currentUser);
    await userReference.update({
      "comments_given": FieldValue.arrayUnion([commentId])
    });
    // Update question or answers docs of comments
    DocumentReference queAnsReference = FirebaseFirestore.instance
        .collection(isQuestion ? 'questions' : 'answers')
        .doc(questionOrAnswerId);
    await queAnsReference.update({
      "comments": FieldValue.arrayUnion([commentId])
    });
  } catch (error) {
    print(error);
  }
}

Future addToUserAndQuestion(
    User currentUser, String questionId, String answerId) async {
  try {
    // Update user of questions_answered
    DocumentReference userReference = FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser.uid.toString());
    await userReference.update({
      "questions_answered": FieldValue.arrayUnion([answerId])
    });
    // Update question of answers
    DocumentReference queReference =
        FirebaseFirestore.instance.collection('questions').doc(questionId);
    await queReference.update({
      "answers": FieldValue.arrayUnion([answerId])
    });
  } catch (error) {
    print(error);
  }
}
