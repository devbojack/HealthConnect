import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommentBox extends StatefulWidget {
  const CommentBox({
    required this.points,
    required this.comment,
    required this.user,
    required this.time,
    super.key,
  });

  final String points;
  final String comment;
  final String user;
  final String time;

  @override
  State<CommentBox> createState() => _CommentBoxState();
}

class _CommentBoxState extends State<CommentBox> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(color: Theme.of(context).dividerColor.withOpacity(0.5), thickness: 0.5),
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
                  widget.points,
                  style: GoogleFonts.roboto(
                    fontSize: 13,
                    color: Theme.of(context).dividerColor.withOpacity(0.9),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 8),
            Flexible(
              child: RichText(
                text: TextSpan(
                  text: widget.comment,
                  style: GoogleFonts.roboto(
                    fontSize: 12,
                    color: Theme.of(context).dividerColor.withOpacity(0.9),
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: " - ${widget.user} ",
                      style: GoogleFonts.roboto(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                      ),
                    ),
                    TextSpan(
                      text: widget.time,
                      style: GoogleFonts.roboto(
                        color: Theme.of(context).dividerColor.withOpacity(0.6),
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Divider(
          color: Theme.of(context).dividerColor.withOpacity(0.5),
          thickness: 0.4,
        ),
      ],
    );
  }
}
