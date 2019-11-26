import 'package:flutter/material.dart';
import 'package:flutter_ui/animations/widget/stagger_animation.dart';

class TransfromPage extends StatefulWidget {
  @override
  _StaggerRouteState createState() => _StaggerRouteState();
}

class _StaggerRouteState extends State<TransfromPage>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
        duration: Duration(milliseconds: 700), vsync: this)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('组合动画'),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {},
        child: Center(
          child: Container(
            width: 300.0,
            height: 300.0,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              border: Border.all(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            //调用我们定义的交织动画Widget
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
              //默认原点为左上角，左移20像素，向上平移5像素
              child: Transform.translate(
                offset: _generateTranslateAnimation().value,
                child: FlatButton(
                    onPressed: () {
                      _controller.reset();
                      _controller.forward();
                    },
                    child: Text("Hello world")),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container buildContainer1() {
    return Container(
      color: Colors.black,
      child: new Transform(
        alignment: Alignment.topRight, //相对于坐标系原点的对齐方式
        transform: new Matrix4.skewY(0.3), //沿Y轴倾斜0.3弧度
        child: new Container(
          padding: const EdgeInsets.all(8.0),
          color: Colors.deepOrange,
          child: const Text('Apartment for rent!'),
        ),
      ),
    );
  }

  Animation<Offset> _generateTranslateAnimation() {
    return new Tween<Offset>(begin: Offset(0, 0), end: Offset(80, 80)).animate(
      new CurvedAnimation(
        parent: _controller,
        curve: Interval(0, 1, curve: Curves.elasticOut),
      ),
    );
  }
}
