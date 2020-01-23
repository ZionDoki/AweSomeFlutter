import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

import './animatedScreen.dart';

class BeatHeart extends StatefulWidget {
  @override
  _BeatHeartState createState() => _BeatHeartState();
}

class _BeatHeartState extends State<BeatHeart> with TickerProviderStateMixin {
  
  Animation _arrowAnimation, _heartAnimation;
  AnimationController _arrowAnimationController, _heartAnimationController;

  @override
  void initState() {
    super.initState();
    _arrowAnimationController =
      AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    _arrowAnimation =
      Tween(begin: 0.0, end: pi).animate(CurvedAnimation(
      curve: Curves.bounceIn, parent: _arrowAnimationController));
    
    _heartAnimationController = AnimationController(
      vsync: this, duration: Duration(milliseconds: 1000));
    _heartAnimation = Tween(begin: 150.0, end: 120.0).animate(CurvedAnimation(
      curve: Curves.easeInOutCirc, parent: _heartAnimationController));
    _heartAnimationController.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        // _heartAnimationController.repeat();
        _heartAnimationController.reverse();
        // _heartAnimationController.reset();
      }
    });
    
  }  

  @override
  void dispose() {
    super.dispose();
    _arrowAnimationController?.dispose();
    _heartAnimationController?.dispose();
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
          SizedBox(
            height: 50.0,
          ),
          secondChild(),
          SizedBox(
            height: 50.0,
          ),
          OutlineButton(
            color: Colors.white,
            textColor: Colors.black,
            padding: const EdgeInsets.all(12.0),
            child: Text('Start Container Animation'),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AnimatedScreen()));
            },
            splashColor: Colors.red,
          )
        ],
      ),
    );
  }

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

  Widget secondChild() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Expanded(
          child: AnimatedBuilder(
            animation: _heartAnimationController,
            builder: (context, child) {
              return Center(
                child: Container(
                  child: Center(
                    child: Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: _heartAnimation.value,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: OutlineButton(
              padding: const EdgeInsets.all(12.0),
              color: Colors.white,
              textColor: Colors.black,
              child: Text('Start Beating Heart Animation'),
              onPressed: () {
                _heartAnimationController.forward();
              },
              splashColor: Colors.red,
            ),
          ),
        )
      ],
    );
  }
}  