import 'package:dro/core/size_config.dart';
import 'package:dro/core/styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SolidButton extends StatelessWidget {
  final String text;
  final double? width;
  final GestureTapCallback onPressed;
  final Color color;
  final Color textColor;
  final double textSize;
  final double elevation;
  final BorderSide border;
  final double height;
  final IconData? icon;
  const SolidButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.color,
    this.icon,
    this.width = double.infinity,
    this.textColor = kPrimaryTextColor,
    this.textSize = 12.0,
    this.height = 40,
    this.elevation = 0.0,
    this.border = BorderSide.none,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3.0),
            side: border,
          ),
        ),
        onPressed: onPressed,
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              color: textColor,
              fontSize: textSize,
            ),
          ),
        ),
      ),
    );
  }
}
