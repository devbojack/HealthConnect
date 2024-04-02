import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthconnect/model/answer_args_model.dart';
import 'package:healthconnect/widgets/questions_page/comments.dart';

class AnswerBox extends StatefulWidget {
  const AnswerBox({
    required this.answerBoxArguments,
    super.key,
  });

  final AnswerBoxArguments answerBoxArguments;

  @override
  State<AnswerBox> createState() => _AnswerBoxState();
}

class _AnswerBoxState extends State<AnswerBox> {
  @override
  Widget build(BuildContext context) {
    final answerArguments = widget.answerBoxArguments;
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {},
                    behavior: HitTestBehavior.translucent,
                    child: Icon(
                      Icons.arrow_circle_up,
                      size: 32,
                      color: Theme.of(context).dividerColor,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    answerArguments.points,
                    style: GoogleFonts.roboto(
                      fontSize: 12,
                      color: Theme.of(context).dividerColor,
                    ),
                  ),
                  const SizedBox(height: 3),
                  GestureDetector(
                    onTap: () {},
                    behavior: HitTestBehavior.translucent,
                    child: Icon(
                      Icons.arrow_circle_down,
                      size: 32,
                      color: Theme.of(context).dividerColor,
                    ),
                  ),
                  const SizedBox(height: 6),
                  GestureDetector(
                    onTap: () {},
                    behavior: HitTestBehavior.translucent,
                    child: Icon(
                      Icons.bookmark_border,
                      size: 24,
                      color: Theme.of(context).dividerColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      answerArguments.answer,
                      style: GoogleFonts.roboto(
                        fontSize: 12,
                        color: Theme.of(context).dividerColor,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Column(
                      children: [
                        Text(
                          "answered ${answerArguments.time} ago",
                          style: GoogleFonts.roboto(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color:
                                Theme.of(context).dividerColor.withOpacity(0.6),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          answerArguments.user,
                          style: GoogleFonts.roboto(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (answerArguments.comments != null &&
                  answerArguments.comments!.isNotEmpty)
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: answerArguments.comments!.length,
                    itemBuilder: (BuildContext context, int index) {
                      final comment = answerArguments.comments![index];
                      return CommentBox(
                        points: comment.points,
                        comment: comment.comment,
                        user: comment.user,
                        time: comment.time,
                      );
                    },
                  ),
                ),
            ],
          ),
          const SizedBox(height: 12),
          Divider(
              color: Theme.of(context).dividerColor.withOpacity(0.5),
              thickness: 0.5),
        ],
      ),
    );
  }
}
