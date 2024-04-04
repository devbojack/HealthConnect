import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionDataModel {
  final String title;
  final String body;
  final String owner;
  final List<dynamic> answers;
  final String? tag;
  final List<dynamic> upvotes;
  final List<dynamic> downvotes;
  final DateTime created_at;
  final DateTime modified;
  final List<dynamic> comments;
  final String questionId;
  final int? views;

  QuestionDataModel({
    required this.title,
    required this.body,
    required this.owner,
    List<dynamic>? answers,
    String? tag,
    List<dynamic>? upvotes,
    List<dynamic>? downvotes,
    required this.created_at,
    required this.modified,
    List<dynamic>? comments,
    required this.questionId,
    int? views,
  })  : this.answers = answers ?? [],
        this.tag = tag ?? "",
        this.upvotes = upvotes ?? [],
        this.downvotes = downvotes ?? [],
        this.views = views ?? 1,
        this.comments = comments ?? [];

  Map<String, dynamic> toJson() => {
        'title': title,
        'body': body,
        'owner': owner,
        'answers': answers,
        'tag': tag,
        'upvotes': upvotes,
        'downvotes': upvotes,
        'created_at': created_at,
        'modified': modified,
        'comments': comments,
        'questionId': questionId,
        'views': views,
      };


  static QuestionDataModel fromJson(Map<String, dynamic> json) => QuestionDataModel(
    title: json['title'],
    body: json['body'],
    downvotes: json['downvotes'],
    upvotes: json['upvotes'],
    owner: json['owner'],
    views: json['views'],
    questionId: json['questionId'],
    modified: (json['modified'] as Timestamp).toDate(),
    created_at: (json['created_at'] as Timestamp).toDate(),
    tag: json['tag'],
    comments: json['comments'],
    answers: json['answers'],
  );
}
