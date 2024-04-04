class UserData {
  final String displayName;
  final String email;
  final String about_me;
  final List<String> questions_answered;
  final List<String> questions_asked;
  final List<String> questions_saved;
  final List<String> comments_given;
  final DateTime created_at;

  UserData({
    required this.displayName,
    required this.email,
    String? about_me,
    List<String>? questions_answered,
    List<String>? questions_asked,
    List<String>? questions_saved,
    List<String>? comments_given,
    required this.created_at,
  })  : this.about_me = about_me ?? "",
        this.questions_answered = questions_answered ?? [],
        this.questions_asked = questions_asked ?? [],
        this.questions_saved = questions_saved ?? [],
        this.comments_given = comments_given ?? [];

  Map<String, dynamic> toJson() => {
        'displayName': displayName,
        'email': email,
        'about_me': about_me,
        'questions_answered': questions_answered,
        'questions_asked': questions_asked,
        'questions_saved': questions_saved,
        'created_at': created_at,
        'comments_given': comments_given,
      };
}
