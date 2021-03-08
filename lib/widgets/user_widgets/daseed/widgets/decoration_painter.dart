import 'package:flutter/material.dart';

class DecorationPainter extends CustomPainter {
  final double height;
  final double width;
  final Color color;

  DecorationPainter(this.height, this.width, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    final Path path = Path()..moveTo(0, 0);
    path.quadraticBezierTo(0, 45, width * 0.35, 30);
    path.quadraticBezierTo(width * 0.4, 25, width * 0.4, 60);
    path.arcToPoint(Offset(width * 0.6, 50),
        radius: const Radius.circular(10.0), clockwise: false);
    path.quadraticBezierTo(width * 0.6, 25, width * 0.65, 30);
    path.quadraticBezierTo(width, 45, width, 0);
    path.lineTo(width, height);
    path.lineTo(0, height);
    path.close();
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
