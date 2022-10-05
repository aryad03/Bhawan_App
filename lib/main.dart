import 'package:flutter/material.dart';
import 'TopBar.dart';
import 'ProfilePage.dart';

void main() {
  runApp( MaterialApp(
    home: Home(),
  ));

}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TopBar();
  }
}
