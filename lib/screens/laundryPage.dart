import 'package:bhawan_app/screens/homePage.dart';
import 'package:flutter/material.dart';
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
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Scaffold(
        appBar: AppBar(
        leading: Builder(
        builder: (BuildContext context) {
        return IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () { Navigator.of(context).pop(TemplateUser());
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> HomePage()));
              },
            );
          },
        ),
        title: Text("Bhawan App"),
        ),
        body: _children[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          backgroundColor: Colors.purple,
          selectedItemColor: Colors.amber,
          unselectedItemColor: Colors.white,
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
      ),
    );
  }
}
