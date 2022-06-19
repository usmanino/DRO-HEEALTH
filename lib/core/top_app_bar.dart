import 'package:dro/core/styles.dart';
import 'package:flutter/material.dart';

class TopAppBar extends StatefulWidget {
  final Widget child;
  final double? height;
  const TopAppBar({Key? key, required this.child, this.height})
      : super(key: key);

  @override
  State<TopAppBar> createState() => _TopAppBarState();
}

class _TopAppBarState extends State<TopAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? 171,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/headerBg.png"),
            fit: BoxFit.fitHeight,
            alignment: Alignment.centerRight),
        color: kPrimaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
        gradient: LinearGradient(
          end: Alignment(1.5, 0.0),
          colors: <Color>[
            Color(0XFF822AF6),
            kPrimaryColor,
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Container(
          margin: const EdgeInsets.only(top: 60.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [widget.child],
          ),
        ),
      ),
    );
  }
}
