import 'package:flutter/material.dart';

class HeaderPainter extends CustomPainter{

  @override
  void paint(Canvas canvas,Size size){
    Paint paint=Paint()..color=const Color(0xFF9100BA);
    Path path=Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width/5, size.height+130, size.width,size.height);
    path.lineTo(size.width, 0);
    path.close();
    return canvas.drawPath(path, paint);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate){
    return false;
  }
}