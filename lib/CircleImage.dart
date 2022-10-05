import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget{

  final Size size;
  final Widget child;

  CircleImage({required Key key,required this.child,this.size=const Size.fromWidth(120)}):super(key:key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(

      decoration: new BoxDecoration(
          color: Colors.grey,
          shape: BoxShape.circle),
      height: size.width,
      child: ClipOval(
        child: child,

      ),
    );
  }


}