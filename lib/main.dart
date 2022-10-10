import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'utils/constants.dart';
import 'screens/clientLogin.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(
        home: LoginPage(),
      ),
    );
  }
}