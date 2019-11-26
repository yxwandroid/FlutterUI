import 'package:flutter/material.dart';

class AnimationsPage1 extends StatefulWidget {
  @override
  _AnimationsPage1State createState() => _AnimationsPage1State();
}

class _AnimationsPage1State extends State<AnimationsPage1>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    // 创建 AnimationController 对象
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    animation =
    Tween(begin: 50.0, end: 200.0).animate(controller)
      ..addListener(() {
        // 注意：这句不能少，否则 widget 不会重绘，也就看不到动画效果
        setState(() {});
      });




//    final CurvedAnimation curve = CurvedAnimation(
//        parent: controller, curve: Curves.easeInCirc);
//    animation = Tween(begin: 50.0, end: 200.0).animate(curve)
//      ..addListener(() {
//        setState(() {});
//      })
//      ..addStatusListener((status) {
        //添加监听
//                        if (status == AnimationStatus.completed) {
//                          controller.reverse();
//                        } else if (status == AnimationStatus.dismissed) {
//                          controller.forward();
//                        }
//      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("动画基础"),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            controller.reset();
            // 执行动画
            controller.forward();
          },
        ),
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                FlatButton(
                  child: Text("线性动画"),
                  onPressed: () {
                  },
                ),
                FlatButton(
                  child: Text("非线性动画"),
                  onPressed: () {

                  },
                ),
              ],
            ),
            Center(
              child: Container(
                // 获取动画的值赋给 widget 的宽高
                width: animation.value,
                height: animation.value,
                decoration: BoxDecoration(color: Colors.redAccent),
              ),
            ),
          ],
        ));
  }

  @override
  void dispose() {
    // 资源释放
    controller.dispose();
    super.dispose();
  }
}
