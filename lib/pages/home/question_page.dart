import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:healthconnect/model/answer_data_model.dart";
import "package:healthconnect/model/question_data_model.dart";
import "package:healthconnect/widgets/home_appbar.dart";
import "package:healthconnect/widgets/my_background.dart";
import "package:healthconnect/widgets/questions_page/question_box.dart";

class QuestionPage extends StatefulWidget {
  const QuestionPage({
    required this.questionId,
    super.key});

  final String questionId;

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  late List<AnswerDataModel> answerBoxList;
  late QuestionDataModel questionArguments;

  @override
  void initState() {
    addViewsCount(widget.questionId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final questionId = widget.questionId;
    return MyBackground(
      child: SafeArea(
        maintainBottomViewPadding: true,
        child: Scaffold(
          appBar: homeAppBar(context),
          body: Column(
            children: [
              Expanded(
                child: FutureBuilder<QuestionDataModel?>(
                  future: getQuestionData(questionId),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          'Something went wrong! '
                              '${FirebaseFirestore.instance
                              .collection("questions")
                              .doc(widget.questionId).get()}'
                              ''
                              '${snapshot.error}',
                          style: GoogleFonts.roboto(
                              color: Theme
                                  .of(context)
                                  .dividerColor,
                              fontSize: 14),
                        ),
                      );
                    } else if (snapshot.hasData) {
                      final questionData = snapshot.data;
                      return QuestionBox(questionDataModel: questionData!);
                    } else {
                      return Center(child: CircularProgressIndicator(
                        color: Theme
                            .of(context)
                            .dividerColor,
                      ));
                    }
                  },
                ),
              ),
            ],
          ),
          // QuestionBox(questionBoxArguments: questionArguments),
        ),
      ),
    );
  }

  Future<QuestionDataModel?> getQuestionData(String questionId) async {
    final questionData = FirebaseFirestore.instance
        .collection("questions").doc(questionId);
    final snapShot = await questionData.get();
    if (snapShot.exists){
      return QuestionDataModel.fromJson(snapShot.data()!);
    }
    return null;
  }


// Add Views counter
  Future addViewsCount(String questionId) async {
    final docReference = FirebaseFirestore.instance.collection("questions").doc(
        questionId);
    await docReference.update({"views": FieldValue.increment(1)});
  }
}
