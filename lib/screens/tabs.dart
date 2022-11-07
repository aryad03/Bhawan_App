import 'package:bhawan_app/models/user_auth.dart';
import 'package:bhawan_app/screens/pastComplaint.dart';
import 'package:bhawan_app/screens/registerComplaint.dart';
import 'package:bhawan_app/services/database_complain.dart';
import 'package:flutter/material.dart';
import 'package:bhawan_app/screens/homePage.dart';
import 'package:provider/provider.dart';

import 'complainInProgress.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  int selectedPageIndex = 1;

  void selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userdata = Provider.of<UserAuth>(context);
    final userData = Provider.of<UserDataGlobal>(context);

    final List<Map<String, Widget>> pages = [
      {
        'page': ComplaintsInProgress(),
      },
      {
        'page': registerComplaint(functionchange: selectPage),
      },
      {
        'page': PastComplaints(),
      },
    ];

    return StreamProvider<List<UserComplain>?>.value(
      initialData: null,
      value: DataBaseComplain(uid: userdata.uid, bhawan: userData.bhawan).userDataComplain,
      child: Scaffold(appBar: AppBar(backgroundColor: Colors.purple,
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
        title: Text("Complain System"),
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
      ),
    );
  }
}
