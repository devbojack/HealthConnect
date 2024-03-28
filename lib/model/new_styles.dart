import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/new_color_constants.dart';

TextStyle normalTextStyle(BuildContext context) =>
    GoogleFonts.roboto(fontSize: 12, color: Theme.of(context).dividerColor);

TextStyle normalBoldTextStyle(BuildContext context) => GoogleFonts.roboto(
    fontSize: 12,
    color: Theme.of(context).dividerColor,
    fontWeight: FontWeight.bold);

TextStyle normalLightTextStyle(BuildContext context) => GoogleFonts.roboto(
    fontSize: 12,
    color: Theme.of(context).dividerColor.withOpacity(0.8),
    fontWeight: FontWeight.w600);

TextStyle normalColoredWeightedTextStyle(Color txtColor, FontWeight fontWeight) =>
    GoogleFonts.roboto(
      fontSize: 12,
      color: txtColor,
      fontWeight: fontWeight,
    );

final normalGreenTextStyle = GoogleFonts.roboto(
  color: newGreenishColor,
  fontSize: 12,
);

final whiteNormalTextStyle = GoogleFonts.roboto(
  color: whiteColor,
  fontSize: 12,
);
final whiteBoldTextStyle = GoogleFonts.roboto(
  color: whiteColor,
  fontSize: 12,
  fontWeight: FontWeight.bold,
);

final normalGreenBlueTextStyle = GoogleFonts.roboto(
  fontSize: 12,
  color: newGreenishColor,
);

TextStyle normalGreenBoldTextStyle(BuildContext context) => GoogleFonts.roboto(
      color: Theme.of(context).hintColor,
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );


TextStyle sizedWeightedColoredTextStyle(BuildContext context, double txtSize,
        FontWeight weight, Color textColor) =>
    GoogleFonts.roboto(
      fontSize: txtSize,
      color: textColor,
      fontWeight: weight,
    );

TextStyle normalBoldBlackTextStyle(BuildContext context) => GoogleFonts.roboto(
    fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold);

TextStyle smallTextStyle(BuildContext context) =>
    GoogleFonts.roboto(fontSize: 11, color: Theme.of(context).dividerColor);

TextStyle announcementsTextStyle() => GoogleFonts.roboto(
      color: fullWhite,
      fontSize: 12,
      fontWeight: FontWeight.w700,
    );
