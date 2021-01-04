
import 'package:flutter/material.dart';
import 'package:image/image.dart' as prefix0;
import 'package:intl/intl.dart';

class AnimatedUpArrow extends AnimatedWidget{
  final Tween<double> _opacityTween = Tween(begin: 1.0,end: 0.0 );
  final Tween<double> _marginTween = Tween(begin: 0.0,end: 100);

  AnimatedUpArrow({Key key,Animation<double> animation}):super(key:key,listenable:animation);

  @override
  Widget build(BuildContext context){
    final Animation<double> animation = listenable;
    return SafeArea(
      child: Center(
        child: Opacity(
          opacity: _opacityTween.evaluate(animation),
          child: Container(
            margin: EdgeInsets.only(bottom: _marginTween.evaluate(animation)),
            child: Image.asset('images/login.jpg',width: 100,height: 80,),
          ),
        ),
      ),
    );
  }

}
