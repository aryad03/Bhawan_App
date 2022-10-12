import 'package:bhawan_app/screens/pastComplaint.dart';
import 'package:bhawan_app/screens/registerComplaint.dart';
import 'package:flutter/material.dart';
import 'package:bhawan_app/screens/homePage.dart';

import 'complainInProgress.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Widget>> pages = [
    {
      'page': ComplaintsInProgress(),
    },
    {
      'page': registerComplaint(),
    },
    {
      'page': PastComplaints(),
    },
  ];
  int selectedPageIndex = 1;

  void selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(backgroundColor: Colors.purple,
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () { Navigator.of(context).pop(context);
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> HomePage()));
            },
          );
        },
      ),
      title: Text("Bhawan App"),
    ),
      body: pages[selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
        backgroundColor: Colors.purple,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amber,
        currentIndex: selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            label: 'In Progress',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            label: 'Register',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            label: 'Past Complaints',
          ),
        ],
      ),
    );
  }
}
