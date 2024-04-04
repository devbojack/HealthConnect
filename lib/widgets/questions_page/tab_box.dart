import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

Widget tagsBox(String? tags) {
  return Container(
    alignment: Alignment.center,
    margin: const EdgeInsets.symmetric(horizontal: 2),
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    constraints: const BoxConstraints(maxWidth: 120),
    decoration: BoxDecoration(
      color:  const Color.fromARGB(255, 38, 79, 155),
      borderRadius: BorderRadius.circular(3),
    ),
    child: Text(
      tags!,
      overflow: TextOverflow.fade,
      style: GoogleFonts.roboto(
        color: Colors.white,
        fontSize: 11,
      ),
    ),
  );
}
