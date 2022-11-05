
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user_auth.dart';
import '../services/auth.dart';
import '../services/database_laundry.dart';
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

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserDataGlobal>(context);
    final user = Provider.of<UserAuth>(context);

    return
      StreamProvider<UserLaundry?>.value(
        initialData: null,
        value: DataBaseLaundry(bhawan: userData.bhawan,uid: user.uid).userdatalaundry,
        child: MediaQuery(
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
                      title: Text(userData.name),
                    ),
                    ListTile(
                      leading: Icon(Icons.email),
                      title: Text(userData.email),
                    ),
                    Divider(
                      thickness: 1.0,
                    ),
                    ListTile(
                        leading: Icon(Icons.logout),
                        title: Text('Log out'),
                        onTap: () async{
                         await _auth.signOut();
                        }
                    ),
                  ],
                ),
              ),
              body: BannerPage(),
            ),
          ),
        ),
      );
  }
}