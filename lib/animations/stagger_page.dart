import 'package:flutter/material.dart';
import 'package:flutter_ui/animations/widget/stagger_animation.dart';

class StaggerPage extends StatefulWidget {
  @override
  _StaggerRouteState createState() => _StaggerRouteState();
}

class _StaggerRouteState extends State<StaggerPage>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
  }

  Future<Null> _playAnimation() async {
    try {
      //先正向执行动画
      await _controller.forward().orCancel;
      //再反向执行动画
      await _controller.reverse().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because we were disposed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('组合动画'),),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          _playAnimation();
        },
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
            child: StaggerAnimation(controller: _controller),
          ),
        ),
      ),
    );
  }
}
