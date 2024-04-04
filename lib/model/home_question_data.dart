import 'package:cloud_firestore/cloud_firestore.dart';

class HomeQuestionData {
  final String questionId;
  final List<dynamic> upvotes;
  final List<dynamic> downvotes;
  final List<dynamic> answers;
  final String body;
  final String owner;
  final DateTime created_at;

  HomeQuestionData({
    required this.questionId,
    required this.upvotes,
    required this.downvotes,
    required this.answers,
    required this.body,
    required this.owner,
    required this.created_at,
  });

  static HomeQuestionData fromJson(Map<String, dynamic> json) => HomeQuestionData(
  questionId: json['questionId'],
      upvotes: json['upvotes'],
      downvotes: json['downvotes'],
      answers: json['answers'],
      body: json['body'],
      owner: json['owner'],
      created_at: (json['created_at'] as Timestamp).toDate(),
  );

}
