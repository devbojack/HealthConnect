import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

Widget tagsBox(String tags) {
  return Container(
    alignment: Alignment.center,
    margin: const EdgeInsets.symmetric(horizontal: 4),
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 44, 38, 155),
      borderRadius: BorderRadius.circular(6),
    ),
    child: Text(
      tags,
      style: GoogleFonts.roboto(
        color: Colors.white,
        fontSize: 11,
      ),
    ),
  );
}
