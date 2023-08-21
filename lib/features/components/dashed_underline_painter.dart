import 'package:flutter/material.dart';
import 'package:market_rack/constants/color.dart';

class StaggeredDashedUnderlinePainter extends CustomPainter {
  final double yOffset;
  final double dashWidth;
  final double dashSpace;
  final Color color;

  StaggeredDashedUnderlinePainter({
    this.yOffset = 4,
    this.dashWidth = 5,
    this.dashSpace = 3,
    this.color = commontext,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1;

    final startY = size.height + yOffset;

    for (double x = 0; x < size.width; x += (dashWidth + dashSpace)) {
      canvas.drawLine(Offset(x, startY), Offset(x + dashWidth, startY), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
