import 'package:flutter/material.dart';
import 'package:flutter_ui/animations/animations_page1.dart';
import 'package:flutter_ui/animations/stagger_page.dart';
import 'package:flutter_ui/animations/transform_page.dart';

class AnimationsPage extends StatefulWidget {
  @override
  _AnimationsPageState createState() => _AnimationsPageState();
}

class _AnimationsPageState extends State<AnimationsPage> {
  @override
  void initState() {
    super.initState();
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
            Navigator.push(context,  MaterialPageRoute(builder: (context) => StaggerPage()));
          },
        ),
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                FlatButton(
                  child: Text("线性动画 和 非线性动画"),
                  onPressed: () {
                    Navigator.push(context,  MaterialPageRoute(builder: (context) => AnimationsPage1()));
                  },
                ),
                FlatButton(
                  child: Text("组合动画"),
                  onPressed: () {
                    Navigator.push(context,  MaterialPageRoute(builder: (context) => StaggerPage()));
                  },
                ),  FlatButton(
                  child: Text("transfrom 使用"),
                  onPressed: () {
                    Navigator.push(context,  MaterialPageRoute(builder: (context) => TransfromPage()));
                  },
                ),
              ],
            ),

          ],
        ));
  }

  @override
  void dispose() {
    // 资源释放
    super.dispose();
  }
}
