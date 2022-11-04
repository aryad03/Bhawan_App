
import 'package:flutter/material.dart';
import '../utils/banner.dart';
import '../screens/clientLogin.dart';
import 'package:flutter/src/widgets/navigator.dart';
void main3() => runApp(HomePage());

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TopBar(),
    );
  }
}


class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      MediaQuery(
        data: MediaQueryData(),
        child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.purple,
          ),
          home: Scaffold(
            appBar: AppBar(
              title: Text('Bhawan App'),
              backgroundColor: Colors.purple,
            ),
            drawer: Drawer(
              child:
              ListView(
                padding: EdgeInsets.all(0),
                children: [
                  Container(
                    height: 250,
                    color: Colors.purple,
                    child: DrawerHeader(
                      padding: EdgeInsets.all(20),
                      child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(image: AssetImage("images/default.jpg"))
                          ),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text("Name of the user"),
                  ),
                  ListTile(
                    leading: Icon(Icons.email),
                    title: Text("user@iitr.ac.in"),
                  ),
                  Divider(
                    thickness: 1.0,
                  ),
                  ListTile(
                      leading: Icon(Icons.logout),
                      title: Text('Log out'),
                      onTap: () {
                        Navigator.of(context).pop();
                        LogIn();
                      }
                  ),
                ],
              ),
            ),
            body: BannerPage(),
          ),
        ),
      );
  }
}