import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../screens/wrapper.dart';

class mySplash extends StatefulWidget {
  const mySplash({Key? key}) : super(key: key);

  @override
  State<mySplash> createState() => mySplashState();
}

class mySplashState extends State<mySplash> {

  splashScreenTimer(){
    Timer(const Duration(seconds: 6), () async{
      Navigator.push(context, MaterialPageRoute(builder: (c)=>Wrapper()));
    });
  }

  @override
  void initState(){
    super.initState();
    splashScreenTimer();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
        children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF73AEF5),
                Color(0XFF61A4F1),
                Color(0xFF478DE0 ),
                Color(0xFF398AE5),
              ],
              stops: [0.1, 0.4, 0.7, 0.9],
            ),
          ),
        ),
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(12),
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 1.5),
                        shape: BoxShape.circle,
                        image: DecorationImage(image: AssetImage("images/logo.jpeg"))
                    ), height: size.height* .2
                ),
                //child: Image.asset('images/logo.jpeg'),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'BHAWAN APP',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'OpenSans',
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              SpinKitChasingDots(
                color: Colors.white,
                size: 40,
              ),
              ]
        ),
      ]
        ),
      ),
    );
  }
}

