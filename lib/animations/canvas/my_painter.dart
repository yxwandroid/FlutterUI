import 'dart:ui';

import 'package:flutter/material.dart';

class MyPainter extends CustomPainter {
  Paint _paint = new Paint()
    ..color = Colors.blueAccent
//    ..strokeCap = StrokeCap.round
    ..isAntiAlias = true
    ..strokeWidth = 5.0
    ..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Size size) {
    //绘制直线
//    canvas.drawLine(Offset(20.0, 20.0), Offset(120.0, 20.0), _paint);
//绘制点
    canvas.drawPoints(
        PointMode.points,
        [Offset(200, 200), Offset(250, 250), Offset(50, 200), Offset(100, 250)],
        _paint);

//    //绘制圆 参数(圆心，半径，画笔)
//    canvas.drawCircle(
//        Offset(0.0, 0.0),
//        30.0,
//        _paint
//          ..color = Colors.greenAccent
//          ..style = PaintingStyle.stroke //绘画风格改为stroke
//    );
//
//
//    //使用左上和右下角坐标来确定矩形的大小和位置,椭圆是在这个矩形之中内切的
//    Rect rect1 = Rect.fromPoints(Offset(0.0, 0.0), Offset(50.0, 150.0));
//    canvas.drawOval(rect1, _paint);

    //绘制圆弧
    // Rect来确认圆弧的位置，还需要开始的弧度、结束的弧度、是否使用中心点绘制、以及paint弧度
//    Rect rect2 = Rect.fromCircle(center: Offset(0.0, 0.0), radius: 45.0);
//    canvas.drawArc(rect2, 0.0, 0.8, false, _paint);

//    Path path = new Path()..moveTo(0.0, 0.0);
//    Rect rect = Rect.fromCircle(center: Offset(100.0, 100.0), radius: 60.0);
//    path.arcTo(rect, 0.0, 3.14, false);
//    canvas.drawPath(path, _paint);

//    Path path = new Path();
//    var width = 100;
//    var height = 150;
//    path.moveTo(width / 2, height / 4);
//    path.cubicTo((width * 6) / 7, height / 9, (width * 13) / 13,
//        (height * 2) / 5, width / 2, (height * 7) / 12);
////    canvas.drawPath(path, _paint);
//
//    Path path2 = new Path();
//    path2.moveTo(width / 2, height / 4);
//    path2.cubicTo(width / 7, height / 9, width / 21, (height * 2) / 5,
//        width / 2, (height * 7) / 12);
////    canvas.drawPath(path2, _paint);
//
//    canvas.drawPath(
//        path,
//        _paint
//          ..style = PaintingStyle.fill
//          ..color = Colors.red);
//    canvas.drawPath(
//        path2,
//        _paint
//          ..style = PaintingStyle.fill
//          ..color = Colors.red);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
