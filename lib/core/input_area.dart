import 'package:dro/core/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputArea extends StatelessWidget {
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final String? hintText;
  final String? labelText;
  final IconData? icon;
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
  final Color leadingColor;
  final Color fillColor;
  final int? maxLines;
  final int? minLines;
  final bool enableSurfix;

  const InputArea(
      {Key? key,
      this.controller,
      this.validator,
      this.hintText,
      this.labelText,
      this.icon,
      this.leadingIcon,
      this.leadingColor = kPrimaryTextColor,
      this.fillColor = kBackgroundColor,
      this.maxLength,
      this.maxLines,
      this.minLines,
      this.inputFormat,
      this.inputType,
      this.isPassword = false,
      this.raduis = 8.0,
      this.borderSide = BorderSide.none,
      this.iconSize = 24.0,
      this.isWritable = true,
      this.enableSurfix = true,
      this.onIconClick})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: minLines,
      maxLines: maxLines,
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
        hintStyle: const TextStyle(
          color: kDarkColor,
        ),
        hintText: hintText,
        //labelText: labelText,
        labelStyle: const TextStyle(
          color: kDarkColor,
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
          borderSide: borderSide,
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
        suffixIcon: enableSurfix
            ? Padding(
                padding: const EdgeInsets.only(),
                child: GestureDetector(
                  onTap: onIconClick,
                  child: Icon(
                    icon,
                    color: kBlackColor,
                    size: iconSize,
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
