import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dro/core/styles.dart';

class InputBox extends StatelessWidget {
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final String? hintText;
  final String? labelText;
  final FocusNode? focusNode;
  final IconData? suricon;
  final IconData? preicon;
  final Color? labelColor;
  final IconData? leadingIcon;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormat;
  final TextInputType? inputType;
  final bool isPassword;
  final double raduis;
  final BorderSide borderSide;
  final double? iconSize;
  final bool? isWritable;
  final VoidCallback? onIconClick;
  final GestureTapCallback? onTap;
  final Color leadingColor;
  final Color fillColor;
  final Color suriconColor;
  final Color preiconColor;
  final int? maxLines;
  final bool enablePrefix;
  final bool enableSurfix;
  final bool readonly;
  final double? fontSize;
  final Function(String)? onChanged;
  final bool? isPrefix;
  final bool? isNum;
  final String? value;

  const InputBox(
      {Key? key,
      this.controller,
      this.onTap,
      this.focusNode,
      this.onChanged,
      this.validator,
      this.hintText,
      this.labelColor = kBlackColor,
      this.labelText,
      this.fontSize,
      this.suricon,
      this.preicon,
      this.readonly = false,
      this.leadingIcon,
      this.leadingColor = kPrimaryTextColor,
      this.fillColor = kBackgroundColor,
      this.maxLength,
      this.preiconColor = kPrimaryColor,
      this.suriconColor = kPrimaryColor,
      this.maxLines,
      this.inputFormat,
      this.inputType,
      this.isPrefix = false,
      this.isPassword = false,
      this.raduis = 8.0,
      this.value,
      this.borderSide = BorderSide.none,
      this.iconSize = 24.0,
      this.isWritable = true,
      this.enablePrefix = false,
      this.enableSurfix = false,
      this.isNum = false,
      this.onIconClick})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      onChanged: onChanged,
      readOnly: readonly,
      initialValue: value,
      onTap: onTap,
      enableInteractiveSelection: true,
      enabled: isWritable,
      validator: validator,
      inputFormatters: inputFormat,
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: inputType,
      maxLength: maxLength,
      obscureText: isPassword,
      style: const TextStyle(
        color: kDarkColor,
      ),
      decoration: InputDecoration(
        labelText: labelText,
        hintStyle: TextStyle(
          fontSize: fontSize,
          color: Colors.black,
        ),
        hintText: hintText,
        labelStyle: TextStyle(
          color: labelColor,
        ),
        counterText: '',
        fillColor: fillColor,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            raduis,
          ),
          borderSide: const BorderSide(
            color: kPrimaryColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            raduis,
          ),
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            raduis,
          ),
          borderSide: borderSide,
        ),
        contentPadding: const EdgeInsets.all(
          15.0,
        ),
        prefixIcon: enablePrefix
            ? Padding(
                padding: const EdgeInsets.only(),
                child: GestureDetector(
                  onTap: onIconClick,
                  child: isNum != true
                      ? Icon(
                          preicon,
                          color: kPrimaryColor,
                          size: iconSize,
                        )
                      : Padding(
                          padding: const EdgeInsets.only(top: 13, left: 5),
                          child: Text(
                            '+234',
                            style: GoogleFonts.lato(
                              color: preiconColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                ),
              )
            : null,
        suffixIcon: enableSurfix
            ? Padding(
                padding: const EdgeInsets.only(),
                child: GestureDetector(
                  onTap: onIconClick,
                  child: Icon(
                    suricon,
                    color: const Color(0xffD5DDE0),
                    size: iconSize,
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
