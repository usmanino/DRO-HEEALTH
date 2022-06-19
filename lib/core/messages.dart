import 'package:dro/core/styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void displayErrorMessage({
  required String error,
  required dynamic context,
  required scaffoldKey,
  bool popStack = true,
}) {
  //ExtendedNavigator.of(context).pop();
  popStack
      ? Navigator.of(context?.currentContext, rootNavigator: true).pop()
      : null;
  scaffoldKey.currentState.showSnackBar(
    SnackBar(
      backgroundColor: kDangerColor,
      content: Text(
        error,
        style: GoogleFonts.roboto(
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
        ),
      ),
      duration: const Duration(milliseconds: 3000),
      behavior: SnackBarBehavior.floating,
    ),
  );
}

void displaySuccessMessage({
  required String text,
  required context,
  required scaffoldKey,
  bool popStack = true,
}) {
  popStack
      ? Navigator.of(context?.currentContext, rootNavigator: true).pop()
      : null;
  scaffoldKey.currentState.showSnackBar(
    SnackBar(
      backgroundColor: Colors.green,
      content: Text(
        text,
        style: GoogleFonts.roboto(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      duration: const Duration(milliseconds: 3000),
      behavior: SnackBarBehavior.floating,
    ),
  );
}
