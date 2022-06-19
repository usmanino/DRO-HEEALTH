import 'package:flutter/material.dart';

class BacksButton extends StatelessWidget {
  final GestureTapCallback onPressed;
  final Color? color;
  final Color iconColor;
  final BorderSide border;
  final IconData icon;
  final double? size;

  const BacksButton({
    Key? key,
    required this.onPressed,
    this.color,
    required this.icon,
    this.iconColor = Colors.black,
    this.border = BorderSide.none,
    this.size,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Icon(
        icon,
        color: iconColor,
        size: size,
      ),
    );
  }
}
