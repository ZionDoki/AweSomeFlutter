import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';



class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  Animation _arrowAnimation;
  AnimationController _arrowAnimationController;

  // AnimationController 控制动画发生过程
  // Animayion 需要传入一个 AnimationController

  Widget firstChild() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        AnimatedBuilder(
          animation: _arrowAnimationController,
          builder: (context, child) => Transform.rotate(
            angle: _arrowAnimation.value,
            child: Icon(
              Icons.expand_more,
              size: 50.0,
              color: Colors.black,
            ),
          ),
        ),
        OutlineButton(
          color: Colors.white,
          textColor: Colors.black,
          padding: const EdgeInsets.all(12.0),
          child: Text('Start Icon Animation'),
          onPressed: () {
            _arrowAnimationController.isCompleted
                ? _arrowAnimationController.reverse()
                : _arrowAnimationController.forward();
          },
          splashColor: Colors.red,
        )
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _arrowAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _arrowAnimation =
        Tween(begin: 0.0, end: pi).animate(_arrowAnimationController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example Animations'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          firstChild(),
        ],
      ),
    );
  }
}
