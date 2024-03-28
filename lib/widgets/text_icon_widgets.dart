import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

///_______________________________________________________________________________TEXT WIDGETS
Text smallText(String text, BuildContext context) => Text(
      text,
      style: Theme.of(context).textTheme.bodySmall,
    );

Text normalText(String text, BuildContext context) => Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium,
    );

Text normalLeftText(String text, BuildContext context) => Text(
  text,
  style: Theme.of(context).textTheme.bodyMedium,
  textAlign: TextAlign.left,
);

Text normalSizeText(String text, double sizeFont, BuildContext context) => Text(
      text,
      style: GoogleFonts.roboto(
        color: Theme.of(context).dividerColor,
        fontSize: sizeFont,
      ),
    );

Text normalSizeBoldText(String text, double sizeFont, BuildContext context) =>
    Text(
      text,
      style: GoogleFonts.roboto(
          color: Theme.of(context).dividerColor,
          fontSize: sizeFont,
          fontWeight: FontWeight.bold),
    );

Text normalCenteredText(String text, FontWeight fontWeight, BuildContext context) => Text(
      text,
      textAlign: TextAlign.center,
      style: GoogleFonts.roboto(
        color: Theme.of(context).dividerColor,
        fontWeight: fontWeight,
        fontSize: 12,
      ),
    );

Text smallCenteredText(String text, FontWeight fontWeight, BuildContext context) => Text(
  text,
  textAlign: TextAlign.center,
  style: GoogleFonts.roboto(
    color: Theme.of(context).dividerColor,
    fontWeight: fontWeight,
    fontSize: 11,
  ),
);

Text normalColoredText(String text, Color txtColor) => Text(
      text,
      style: GoogleFonts.roboto(
        color: txtColor,
        fontSize: 12,
      ),
    );

Text normalBoldText(String text, BuildContext context) => Text(
      text,
      style: GoogleFonts.roboto(
        color: Theme.of(context).dividerColor,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    );

Text normalBoldColoredText(String text, Color txtColor) => Text(
      text,
      style: GoogleFonts.roboto(
        color: txtColor,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    );

Text bigNormalBoldText(String text, BuildContext context) => Text(
      text,
      style: Theme.of(context).textTheme.titleMedium
    );

Text bigNormalBoldColoredText(String text, Color txtColor) => Text(
      text,
      style: GoogleFonts.roboto(
          color: txtColor, fontSize: 15, fontWeight: FontWeight.w700),
    );

Text bigNormalText(String text, BuildContext context) => Text(
      text,
      style: Theme.of(context).textTheme.bodyLarge
    );

Text bigNormalColoredText(String text, Color txtColor) => Text(
      text,
      style: GoogleFonts.roboto(
        color: txtColor,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
    );

Text veryBigTextBold(String text, double mHeight, BuildContext context) => Text(
      text,
      style: GoogleFonts.leagueSpartan(
        fontSize: mHeight * 4,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).dividerColor,
      ),
    );

Text veryBigColoredTextBold(String text, Color txtColor) => Text(
      text,
      style: GoogleFonts.leagueSpartan(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: txtColor,
      ),
    );

Text buttonText(String text, BuildContext context) => Text(
      text,
      style: GoogleFonts.roboto(
        color: Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
    );

Text buttonColoredText(String text, Color txtColor) => Text(
      text,
      style: GoogleFonts.roboto(
        color: txtColor,
        fontSize: 13,
        fontWeight: FontWeight.bold,
      ),
    );

TextSpan normalTextSpan(String text, BuildContext context) => TextSpan(
    text: text,
    style: GoogleFonts.roboto(
      fontSize: 12,
      color: Theme.of(context).dividerColor,
    ));

TextSpan normalColoredTextSpan(String text, Color textColor) => TextSpan(
    text: text,
    style: GoogleFonts.roboto(
      fontSize: 11,
      color: textColor,
    ));

TextSpan otherColoredSizedWeightTextSpan(
        String text, double textSize, FontWeight fontWeight, Color textColor) =>
    TextSpan(
        text: text,
        style: GoogleFonts.roboto(
          fontSize: textSize,
          fontWeight: fontWeight,
          color: textColor,
        ));

Text normalTermsText(String text, BuildContext context) => Text(
      text,
      style: GoogleFonts.roboto(
        color: Theme.of(context).dividerColor,
        height: 1.3,
        fontSize: 15,
      ),
    );

Text sizedColoredWeightedText(
        String text, double fontSize, Color color, FontWeight fontWeight) =>
    Text(
      text,
      style: GoogleFonts.roboto(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),
    );

Container bigTermsBoldText(String text, BuildContext context) => Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        text,
        style: GoogleFonts.roboto(
            color: Theme.of(context).dividerColor,
            fontSize: 16,
            fontWeight: FontWeight.bold),
      ),
    );

Text bigCenteredText(String text, BuildContext context) => Text(
      text,
      textAlign: TextAlign.center,
      style: GoogleFonts.roboto(
        color: Theme.of(context).dividerColor,
        fontSize: 13,
      ),
    );

///_______________________________________________________________________________ICON WIDGETS
Icon normalIcon(IconData iconData, BuildContext context) => Icon(
      iconData,
      color: Theme.of(context).dividerColor,
    );

appLiner(BuildContext context) {
  return Expanded(
      child: Divider(
        endIndent: 20,
        indent: 20,
        thickness: 1,
        color: Theme.of(context).dividerColor.withOpacity(0.3),
      ));
}