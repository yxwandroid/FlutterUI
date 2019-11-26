import 'package:flutter/material.dart';
import 'package:flutter_ui/animations/canvas/my_painter.dart';

class CanvasPage extends StatefulWidget {
  @override
  _CanvasPageState createState() => _CanvasPageState();
}

class _CanvasPageState extends State<CanvasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("canvas 使用"),),
      body: Container(
        child: Center(child: CustomPaint(
          painter: MyPainter(),
        ),),
      ),
    );
  }
}
