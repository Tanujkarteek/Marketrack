import 'package:flutter/material.dart';

import '../../constants/color.dart';
import 'dashed_underline_painter.dart';
// class StaggeredDashedUnderlineText extends StatelessWidget {
//   final String text;
//   final Color? color;
//
//   StaggeredDashedUnderlineText({required this.text,required this.color});
//
//   @override
//   Widget build(BuildContext context) {
//     return CustomPaint(
//       painter: DottedUnderlinePainter(
//         color: color ?? commontext,
//       ),
//       child: Text(
//         text,
//         style: TextStyle(
//           fontSize: 15,
//           fontFamily: "Arcon",
//           fontWeight: FontWeight.w400,
//           color: color,
//         ),
//       ),
//     );
//   }
// }

class DottedUnderlineContainer extends StatelessWidget {
  final Text? text;
  final Color color;
  final Widget? icon;
  final Widget? child;

  DottedUnderlineContainer({this.icon, required this.color,this.text,this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        painter: StaggeredDashedUnderlinePainter(
          color: color,
        ),
        child: Column(
          children: [
            if (icon != null) icon!,
            if (text != null) text!,
            if (child != null) child!,
          ],
        ),
      ),
    );
  }
}