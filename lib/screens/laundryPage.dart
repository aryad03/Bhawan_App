import 'package:flutter/material.dart';

import '../utils/appBar.dart';
import 'laundryHome.dart';
import 'laundryStatus.dart';

void main4() => runApp(TemplateUser());

class TemplateUser extends StatefulWidget {
  const TemplateUser({Key? key}) : super(key: key);

  @override
  State<TemplateUser> createState() => _TemplateStateUser();
}

class _TemplateStateUser extends State<TemplateUser> {

  List<Widget> _children = [
    LaundryUserPage(),
    LaundryStatusUser()
  ];

  int currentIndex = 0;

  void onTab(int index){
    setState(() {
      currentIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bhawan App",),
        backgroundColor: Colors.purple,
      ),
      body: _children[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        // selectedItemColor: Colors.purple,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check),
            label: 'Status',
          ),
        ],
        onTap: onTab,
      ),
    );
  }
}
