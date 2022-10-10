import 'package:flutter/material.dart';

class App_Bar extends StatelessWidget {
  const App_Bar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Bhawan App'),
      leading: Icon(Icons.arrow_back),
      backgroundColor: Colors.purple,
    );
  }
}
