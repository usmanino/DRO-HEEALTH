// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:smshaven/core/styles.dart';

// class DropButton extends StatelessWidget {
//   final String text;
//   final GestureTapCallback onPressed;
//   final Color color;
//   final Color textColor;
//   final Color iconColor;
//   final double textSize;
//   final double elevation;
//   final double width;
//   final BorderSide border;
//   final IconData? icon;
//   final IconData? iconn;
//   final bool hasleadingicon;
//   DropButton({
//     required this.text,
//     required this.onPressed,
//     required this.color,
//     this.icon,
//     this.iconn,
//     this.textColor = Colors.black,
//     this.iconColor = Colors.black,
//     this.textSize = 16.0,
//     this.elevation = 0.0,
//     this.border = BorderSide.none,
//     this.hasleadingicon = false,
//     this.width = double.infinity,
//   });
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       style: ElevatedButton.styleFrom(
//         elevation: 1,
//         primary: color,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.zero,
//           side: border,
//         ),
//       ),
//       onPressed: onPressed,
//       child: Container(
//         width: width,
//         height: 55,
//         child: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               if (hasleadingicon)
//                 Icon(
//                   iconn,
//                   color: kInActiveColor,
//                   size: 30,
//                 ),
//               SizedBox(
//                 width: 10,
//               ),
//               Text(
//                 text,
//                 style: GoogleFonts.lato(
//                   color: textColor,
//                   fontSize: textSize,
//                 ),
//               ),
//               Spacer(),
//               Icon(
//                 icon,
//                 color: iconColor,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
