import 'package:healthconnect/model/answer_args_model.dart';
import 'package:healthconnect/model/comments.dart';

class QuestionBoxArguments {
  final String title;
  final String body;
  final String points;
  final String user;
  final String views;
  final String asked;
  final String modified;
  final List<String> tags;
  final List<Comment>? comments;
  final List<AnswerBoxArguments>? answers;

  QuestionBoxArguments({
    required this.title,
    required this.body,
    required this.points,
    required this.user,
    required this.views,
    required this.asked,
    required this.modified,
    required this.tags,
    required this.comments,
    required this.answers,
  });
}
