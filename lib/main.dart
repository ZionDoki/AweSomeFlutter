import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

void main() {
  // debugPaintSizeEnabled = true;
  return runApp(MyApp());
}

class MyAnimationDemo extends StatefulWidget {
  MyAnimationDemo({Key key}) : super(key: key);

  @override
  _MyAnimationDemoState createState() => _MyAnimationDemoState();
}

class _MyAnimationDemoState extends State<MyAnimationDemo>
    with TickerProviderStateMixin {
  AnimationController _animationController;

  Animation<double> _angleAnimation;

  @override
  void initState() {
    super.initState();

    // define animation's duration
    _animationController = new AnimationController(
      duration: const Duration(milliseconds: 256),
      vsync: this,
    );

    // define begin value to end value & curve for animation
    _angleAnimation = new Tween(begin: pi / 2, end: 0.0).animate(
        CurvedAnimation(curve: Curves.ease, parent: _animationController));

    _animationController.addListener(() {
      //  This will leads the widget update
      // setState(() {});
    });

    _animationController.forward();
  }

  @override
  void dispose() {
    this._animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (BuildContext context, Widget child) => Transform.rotate(
            angle: _angleAnimation.value,
            child: GestureDetector(
              onTap: () => _animationController.isCompleted
                  ? _animationController.reverse()
                  : _animationController.forward(),
              child: Icon(
                Icons.expand_more,
                size: 80,
                color: Colors.white,
              ),
            )),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Center(
        child: MyAnimationDemo(),
      ),
    );
  }
}
