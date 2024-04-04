import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthconnect/model/user_model.dart';

Future createUserData(User? user)async {
  final docUser =
  FirebaseFirestore.instance.collection("users").doc(user!.uid.toString());

  final userData = UserData(
      displayName: user.displayName.toString(),
      email: user.email.toString(),
      about_me: '',
      questions_answered: [],
      questions_asked: [],
      questions_saved: [],
      created_at: DateTime.now(),
    comments_given: [],
  );
  final json = userData.toJson();
  await docUser.set(json);
}