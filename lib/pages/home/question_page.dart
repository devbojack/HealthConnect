import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:healthconnect/model/answer_args_model.dart";
import "package:healthconnect/model/comments.dart";
import "package:healthconnect/model/question_args_model.dart";
import "package:healthconnect/widgets/home_appbar.dart";
import "package:healthconnect/widgets/my_background.dart";
import "package:healthconnect/widgets/questions_page/question_box.dart";

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  late List<AnswerBoxArguments> answerBoxList;
  late QuestionBoxArguments questionArguments;

  @override
  void initState() {
    getQuestionData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MyBackground(
      child: Scaffold(
          appBar: homeAppBar(context),
          body: Column(children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  QuestionBox(questionBoxArguments: questionArguments),
                  if (questionArguments.answers != null &&
                      questionArguments.answers!.isNotEmpty)
                    Text(
                      "${questionArguments.answers!.length} answers",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.roboto(
                          color: Theme.of(context).dividerColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 14),
                    ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ])),
    );
  }

  getQuestionData() {
    questionArguments = QuestionBoxArguments(
      title:
          'The problematic part of your code is within the Column where you have nested Expanded widgets:',
      body:
          'The problematic part of your code is within the Column where you have nested Expanded widgets:The problematic part of your code is within the Column where you have nested Expanded widgets:The problematic part of your code is within the Column where you have nested Expanded widgets:',
      points: '10',
      user: 'John Doe',
      views: '100',
      asked: 'Today',
      modified: 'Today',
      tags: ['Well-being', 'Gym', 'tag3'],
      comments: [
        Comment(
            points: '5',
            comment:
                'The problematic part of your code is within the Column where you have nested Expanded widgets:The problematic part of your code is within the Column where you have nested Expanded widgets:',
            user: 'John Doe',
            time: '2 hours'),
        Comment(
            points: '2',
            comment:
                'The problematic part of your code is within the Column where you have nested Expanded widgets:The problematic part of your code is within the Column where you have nested Expanded widgets:',
            user: 'Jane Smith',
            time: '1 hour'),
      ],
      answers: [
        AnswerBoxArguments(
          points: "5",
          answer:
              "You have to give out some data for testing before making sure everything works wellsThe problematic part of your code is within the Column where you have nested Expanded widgets:",
          user: "Will Bob",
          time: "2-10-2024",
          comments: [
            Comment(
                points: '5',
                comment:
                    'The problematic part of your code is within the Column where you have nested Expanded widgets:The problematic part of your code is within the Column where you have nested Expanded widgets:',
                user: 'John Doe',
                time: '2 hours'),
            Comment(
                points: '2',
                comment:
                    'The problematic part of your code is within the Column where you have nested Expanded widgets:The problematic part of your code is within the Column where you have nested Expanded widgets:',
                user: 'Jane Smith',
                time: '1 hour'),
          ],
        ),
        AnswerBoxArguments(
          points: "5",
          answer:
              "YouThe problematic part of your code is within the Column where you have nested Expanded widgets: have to give out some data for testing before making sure everything works wells",
          user: "Will Bob",
          time: "2-10-2024",
          comments: [
            Comment(
                points: '5',
                comment:
                    'This iThe problematic part of your code is within the Column where you have nested Expanded widgets:s a great answer!',
                user: 'John Doe',
                time: '2 hours'),
            Comment(
                points: '2',
                comment:
                    'Could you plThe problematic part of your code is within the Column where you have nested Expanded widgets:ease explain more?',
                user: 'Jane Smith',
                time: '1 hour'),
          ],
        ),
        AnswerBoxArguments(
          points: "5",
          answer:
              "You have to give outThe problematic part of your code is within the Column where you have nested Expanded widgets: some data for testing before making sure everything works wells",
          user: "Will Bob",
          time: "2-10-2024",
          comments: [
            Comment(
                points: '5',
                comment:
                    'This isThe problematic part of your code is within the Column where you have nested Expanded widgets: a great answer!',
                user: 'John Doe',
                time: '2 hours'),
            Comment(
                points: '2',
                comment:
                    'Could you pThe problematic part of your code is within the Column where you have nested Expanded widgets:lease explain more?',
                user: 'Jane Smith',
                time: '1 hour'),
          ],
        ),
      ],
    );
  }
}
