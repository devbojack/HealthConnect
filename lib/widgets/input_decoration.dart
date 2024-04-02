import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../model/new_styles.dart';

InputDecoration inputDecoration(String label, BuildContext context) =>
    InputDecoration(
      labelText: label,
      labelStyle: smallTextStyle(context),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: Colors.redAccent, width: 0.8)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
              color: Theme.of(context).dividerColor.withOpacity(0.6),
              width: 0.8)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
              color: Theme.of(context).dividerColor.withOpacity(0.6),
              width: 0.8)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
              color: Theme.of(context).dividerColor.withOpacity(0.6),
              width: 0.8)),
      filled: false,
    );

InputDecoration questionDecoration(String label, BuildContext context) =>
    InputDecoration(
      labelText: label,
      contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      labelStyle: GoogleFonts.roboto(
          fontSize: 11,
          fontWeight: FontWeight.normal,
          color: Theme.of(context).dividerColor.withOpacity(0.6)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2),
          borderSide: const BorderSide(color: Colors.redAccent, width: 0.4)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2),
          borderSide: BorderSide(
              color: Theme.of(context).dividerColor.withOpacity(0.4),
              width: 0.8)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2),
          borderSide: BorderSide(
              color: Theme.of(context).dividerColor.withOpacity(0.4),
              width: 0.8)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2),
          borderSide: BorderSide(
              color: Theme.of(context).dividerColor.withOpacity(0.4),
              width: 0.8)),
      filled: false,
    );
