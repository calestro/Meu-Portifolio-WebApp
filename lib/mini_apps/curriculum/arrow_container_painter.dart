import 'package:flutter/material.dart';


class arrowContainer extends CustomPainter {
  bool isOpacity;

  arrowContainer(this.isOpacity);

  @override
  void paint(Canvas canvas, Size size) {
    final Gradient gradient = new LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Colors.redAccent.shade700, Colors.red.shade700],
      tileMode: TileMode.clamp,
    );

    final Gradient gradientOpacity = new LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Colors.redAccent, Colors.red],
      tileMode: TileMode.clamp,
    );

    final Rect colorBounds = Rect.fromLTRB(0, 0, size.width, size.height);
    final Paint paint = new Paint()
      ..shader = !isOpacity ? gradient.createShader(colorBounds):gradientOpacity.createShader(colorBounds);

    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width - 10 , 0);
    path.lineTo(size.width + 10, size.height / 2);
    path.lineTo(size.width - 10, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}