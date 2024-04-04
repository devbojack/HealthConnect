import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:healthconnect/model/comment_data_model.dart';


class AnswerDataModel {
  final List<dynamic> upvotes;
  final List<dynamic> downvotes;
  final String answer;
  final String owner;
  final DateTime created_at;
  final List<dynamic>? comments;
  final String answerId;

  AnswerDataModel({
    required this.upvotes,
    required this.downvotes,
    required this.answer,
    required this.created_at,
    required this.owner,
    required this.comments,
    required this.answerId
  });

  Map<String, dynamic> toJson() =>
      {
        'owner': owner,
        'answer': answer,
        'upvotes': upvotes,
        'downvotes': upvotes,
        'created_at': created_at,
        'comments': comments,
        'answerId': answerId,
      };

  static AnswerDataModel fromJson(Map<String, dynamic> json) => AnswerDataModel(
    upvotes: json['upvotes'],
    downvotes: json['downvotes'],
    answer: json['answer'],
    comments: json['comments'],
    owner: json['owner'],
    created_at: (json['created_at'] as Timestamp).toDate(),
      answerId: json['answerId']
  );
}

