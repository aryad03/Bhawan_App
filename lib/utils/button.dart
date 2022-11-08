import 'package:bhawan_app/utils/constants.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String s;
  final VoidCallback press;

  Button(this.s, this.press);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.all(5.0),
      child: ElevatedButton(
        onPressed: press,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue),
        ),
        child: Text(
          s,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}