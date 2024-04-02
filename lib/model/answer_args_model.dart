import 'package:healthconnect/model/comments.dart';

class AnswerBoxArguments {
  final String points;
  final String answer;
  final String user;
  final String time;
  final List<Comment>? comments;

  AnswerBoxArguments({
    required this.points,
    required this.answer,
    required this.user,
    required this.time,
    required this.comments,
  });
}

