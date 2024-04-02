import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:healthconnect/model/question_args_model.dart";
import "package:healthconnect/widgets/questions_page/comments.dart";
import "package:healthconnect/widgets/questions_page/tab_box.dart";

class QuestionBox extends StatefulWidget {
  const QuestionBox({required this.questionBoxArguments, super.key});

  final QuestionBoxArguments questionBoxArguments;

  @override
  State<QuestionBox> createState() => _QuestionBoxState();
}

class _QuestionBoxState extends State<QuestionBox> {
  @override
  Widget build(BuildContext context) {
    final questionArguments = widget.questionBoxArguments;
    return Container(
      width: double.infinity,
      // height: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        children: [
          Flexible(
            child: Text(
              questionArguments.title,
              style: GoogleFonts.roboto(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).dividerColor),
            ),
          ),
          const SizedBox(height: 8),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   mainAxisSize: MainAxisSize.max,
          //   children: [
          //     RichText(
          //       text: TextSpan(
          //           text: 'Asked ',
          //           style: GoogleFonts.roboto(
          //             fontSize: 11,
          //             color: Theme.of(context).dividerColor.withOpacity(0.7),
          //           ),
          //           children: <TextSpan>[
          //             TextSpan(
          //               text: questionArguments.modified,
          //               style: GoogleFonts.roboto(
          //                   fontSize: 11,
          //                   color: Theme.of(context).dividerColor),
          //             ),
          //           ]),
          //     ),
          //     const SizedBox(width: 6),
          //     RichText(
          //       text: TextSpan(
          //           text: 'Modified ',
          //           style: GoogleFonts.roboto(
          //             fontSize: 11,
          //             color: Theme.of(context).dividerColor.withOpacity(0.7),
          //           ),
          //           children: <TextSpan>[
          //             TextSpan(
          //               text: questionArguments.modified,
          //               style: GoogleFonts.roboto(
          //                   fontSize: 11,
          //                   color: Theme.of(context).dividerColor),
          //             ),
          //           ]),
          //     ),
          //     const SizedBox(width: 6),
          //     RichText(
          //       text: TextSpan(
          //           text: 'Viewed ',
          //           style: GoogleFonts.roboto(
          //             fontSize: 11,
          //             color: Theme.of(context).dividerColor.withOpacity(0.7),
          //           ),
          //           children: <TextSpan>[
          //             TextSpan(
          //               text: '${questionArguments.views} times',
          //               style: GoogleFonts.roboto(
          //                   fontSize: 11,
          //                   color: Theme.of(context).dividerColor),
          //             ),
          //           ]),
          //     ),
          //   ],
          // ),
          const SizedBox(height: 4),
          Divider(
              color: Theme.of(context).dividerColor.withOpacity(0.5),
              thickness: 0.6),
          const SizedBox(height: 4),
          // Row(
          //   mainAxisSize: MainAxisSize.min,
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Column(
          //       mainAxisSize: MainAxisSize.min,
          //       children: [
          //         GestureDetector(
          //           onTap: () {},
          //           behavior: HitTestBehavior.translucent,
          //           child: Icon(Icons.arrow_circle_up,
          //               size: 32, color: Theme.of(context).dividerColor),
          //         ),
          //         const SizedBox(height: 3),
          //         Text(
          //           questionArguments.points,
          //           style: GoogleFonts.roboto(
          //             fontSize: 12,
          //             color: Theme.of(context).dividerColor,
          //           ),
          //         ),
          //         const SizedBox(height: 3),
          //         GestureDetector(
          //           onTap: () {},
          //           behavior: HitTestBehavior.translucent,
          //           child: Icon(Icons.arrow_circle_down,
          //               size: 32, color: Theme.of(context).dividerColor),
          //         ),
          //         const SizedBox(height: 6),
          //         GestureDetector(
          //           onTap: () {},
          //           behavior: HitTestBehavior.translucent,
          //           child: Icon(Icons.bookmark_border,
          //               size: 24, color: Theme.of(context).dividerColor),
          //         ),
          //       ],
          //     ),
          //     const SizedBox(width: 12),
          //     // Expanded(
          //     // child:
          //     Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Expanded(
          //           child: Text(
          //             questionArguments.body,
          //             style: GoogleFonts.roboto(
          //                 fontSize: 12,
          //                 fontWeight: FontWeight.normal,
          //                 color: Theme.of(context).dividerColor),
          //           ),
          //         ),
          //         const SizedBox(height: 8),
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Expanded(
          //               child: SizedBox(
          //                 height: 30,
          //                 child: ListView.builder(
          //                   scrollDirection: Axis.horizontal,
          //                   itemCount: questionArguments.tags.length,
          //                   itemBuilder: (BuildContext context, int index) {
          //                     return tagsBox(questionArguments.tags[index]);
          //                   },
          //                 ),
          //               ),
          //             ),
          //             Text(
          //               questionArguments.user,
          //               style: GoogleFonts.roboto(
          //                 fontSize: 12,
          //                 color: Theme.of(context).primaryColor,
          //                 fontWeight: FontWeight.w700,
          //               ),
          //             ),
          //           ],
          //         ),
          //         const SizedBox(height: 16),
          //         Divider(
          //             color: Theme.of(context).dividerColor.withOpacity(0.5),
          //             thickness: 0.6),
          //         if (questionArguments.comments != null &&
          //             questionArguments.comments!.isNotEmpty)
          //           Expanded(
          //             child: ListView.builder(
          //               shrinkWrap: true,
          //               itemCount: questionArguments.comments!.length,
          //               itemBuilder: (BuildContext context, int index) {
          //                 final comment = questionArguments.comments![index];
          //                 return CommentBox(
          //                   points: comment.points,
          //                   comment: comment.comment,
          //                   user: comment.user,
          //                   time: comment.time,
          //                 );
          //               },
          //             ),
          //           ),
          //       ],
          //     ),
          //     // ),
          //   ],
          // ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
