import 'package:flutter/material.dart';
import 'ProfilePage.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        Scaffold(
          appBar: AppBar(
            title: Text('Bhawan App'),
            backgroundColor: Colors.purple,
          ),
          drawer: Drawer(
            child:
            ListView(
              padding: EdgeInsets.all(0),
              children: [
                DrawerHeader(
                  child: UserAccountsDrawerHeader(
                    accountName: Text('Akanksha Swati'),
                    accountEmail: Text('a_swati@cs.iitr.ac.in'),
                    currentAccountPicture: CircleAvatar(
                      backgroundColor: Color.fromARGB(43, 140, 161, 1),
                      foregroundImage: AssetImage('assets/Me.jpg'),
                    ),
                    currentAccountPictureSize: Size.square(50),
                    decoration: BoxDecoration(color: Colors.purple,),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.purple,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('My profile'),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProfilePage()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.meeting_room),
                  title: Text('Entry-Exit'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                    leading: Icon(Icons.water),
                    title: Text('Laundry'),
                    onTap: () {
                      Navigator.pop(context);
                    }
                ),
                ListTile(
                    leading: Icon(Icons.dining),
                    title: Text('Mess Menu'),
                    onTap: () {
                      Navigator.pop(context);
                    }
                ),
                ListTile(
                  leading: Icon(Icons.info),
                  title: Text('Notice Board'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                    leading: Icon(Icons.report_problem),
                    title: Text('Complain'),
                    onTap: () {
                      Navigator.pop(context);
                    }
                ),
                ListTile(
                    leading: Icon(Icons.logout),
                    title: Text('Log out'),
                    onTap: () {
                      Navigator.pop(context);
                    }
                ),
              ],
            ),
          ),
          body: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Image.asset("assets/welcome 2.webp"),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text("KASTURBA BHAWAN",
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.purple,
                    ),
                  ),
                ),
              ],
            ),
          )
        );
  }
}
