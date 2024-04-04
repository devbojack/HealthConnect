import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthconnect/model/comment_data_model.dart';

class CommentBox extends StatefulWidget {
  const CommentBox({
    required this.commentDataModel,
    super.key,
  });

  final CommentDataModel commentDataModel;

  @override
  State<CommentBox> createState() => _CommentBoxState();
}

class _CommentBoxState extends State<CommentBox> {
  Duration differenceBetweenNowAndTimestamp(Timestamp timestamp) {
    DateTime now = DateTime.now();
    DateTime dateTimeFromTimestamp =
    timestamp.toDate(); // Convert Firebase Timestamp to DateTime
    return now.difference(dateTimeFromTimestamp);
  }
  @override
  Widget build(BuildContext context) {
    final commentArguments = widget.commentDataModel;
    final points = (commentArguments.upvotes.length - commentArguments.downvotes.length).toString();
    Timestamp createdAt = Timestamp.fromDate(commentArguments.created_at);
    String createdDuration = '';

    if (differenceBetweenNowAndTimestamp(createdAt).inHours > 24) {
      createdDuration =
      '${differenceBetweenNowAndTimestamp(createdAt).inDays} days ago';
    }
    else if (differenceBetweenNowAndTimestamp(createdAt).inHours > 1) {
      createdDuration =
      '${differenceBetweenNowAndTimestamp(createdAt).inHours} hours ago';
    }
    else {
      createdDuration =
      '${differenceBetweenNowAndTimestamp(createdAt).inMinutes % 60} mins ago';
    }

    return Column(
      children: [
        Divider(
            color: Theme.of(context).dividerColor.withOpacity(0.5),
            thickness: 0.5),
        const SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.arrow_drop_up,
                    color: Theme.of(context).dividerColor,
                    size: 32,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  points,
                  style: GoogleFonts.roboto(
                    fontSize: 13,
                    color: Theme.of(context).dividerColor.withOpacity(0.9),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(children: [
                // Flexible(
                // child:
                RichText(
                  text: TextSpan(
                    text: commentArguments.comment,
                    style: GoogleFonts.roboto(
                      fontSize: 12,
                      color: Theme.of(context).dividerColor.withOpacity(0.9),
                    ),
                    children: [
                      WidgetSpan(
                        child: RichText(
                          softWrap: false,
                          text: TextSpan(
                              text: " - ${commentArguments.owner} ",
                              style: GoogleFonts.roboto(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                              ),
                              children: [
                                TextSpan(
                                  text: createdDuration,
                                  style: GoogleFonts.roboto(
                                    color: Theme.of(context)
                                        .dividerColor
                                        .withOpacity(0.6),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12,
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
                // ),
                const SizedBox(height: 12),
                // Row(
                //   children: [
                //     GestureDetector(
                //       onTap: () {},
                //       child: Text(
                //         "Edit",
                //         style: GoogleFonts.roboto(
                //             color:
                //                 Theme.of(context).dividerColor.withOpacity(0.6),
                //             fontWeight: FontWeight.normal,
                //             fontSize: 12),
                //       ),
                //     ),
                //     const SizedBox(width: 12),
                //     GestureDetector(
                //       onTap: () {},
                //       child: Text(
                //         "Delete",
                //         style: GoogleFonts.roboto(
                //             color:
                //                 Theme.of(context).dividerColor.withOpacity(0.6),
                //             fontWeight: FontWeight.normal,
                //             fontSize: 12),
                //       ),
                //     )
                //   ],
                // ),
              ]),
            ),
          ],
        ),
        const SizedBox(height: 2),
        // if (commentArguments.owner)

        const SizedBox(height: 2),
      ],
    );
  }
}
