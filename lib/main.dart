import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import './home_screen.dart';
import './beatHeat.dart';


void main() {
  // debugPaintSizeEnabled = true;
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Center(child: BeatHeart(),)
    );
  }
}
