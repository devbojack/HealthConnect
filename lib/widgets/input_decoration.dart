import 'package:flutter/material.dart';


InputDecoration inputDecoration(String label, BuildContext context) => InputDecoration(
  labelText: label,
  labelStyle: TextStyle(fontSize: 11, color: Theme.of(context).indicatorColor),
  errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: const BorderSide(color: Colors.redAccent, width: 0.8)),
  focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: BorderSide(color: Theme.of(context).dividerColor.withOpacity(0.6), width: 0.8)),
  focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: BorderSide(color: Theme.of(context).dividerColor.withOpacity(0.6), width: 0.8)),
  enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: BorderSide(color:Theme.of(context).dividerColor.withOpacity(0.6), width: 0.8)),
  filled: false,
);