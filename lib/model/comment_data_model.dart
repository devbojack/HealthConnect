import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CommentDataModel {

  final String owner;
  final String comment;
  final List<dynamic> upvotes;
  final List<dynamic> downvotes;
  final DateTime created_at;

  CommentDataModel({
    required this.owner,
    required this.comment,
    List<dynamic>? upvotes,
    List<dynamic>? downvotes,
    required this.created_at,
  })
      : this.upvotes = upvotes ?? [],
        this.downvotes = downvotes ?? [];

  Map<String, dynamic> toJson() =>
      {
        'owner': owner,
        'answer': comment,
        'upvotes': upvotes,
        'downvotes': upvotes,
        'created_at': created_at,
      };

  static CommentDataModel fromJson(Map<String, dynamic> json) => CommentDataModel(
    comment: json['comment'],
    upvotes: json['upvotes'],
    downvotes: json['downvotes'],
    owner: json['owner'],
    created_at: (json['created_at'] as Timestamp).toDate(),
  );
}
