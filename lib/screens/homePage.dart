
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
    Size size = MediaQuery.of(context).size;
    return
      StreamProvider<UserLaundry?>.value(
        initialData: null,
        value: DataBaseLaundry(bhawan: userData.bhawan,uid: user.uid).userdatalaundry,
        child: MediaQuery(
          data: MediaQueryData(),
          child: MaterialApp(
            home: Scaffold(
              appBar: AppBar(
                title: Text('Bhawan App'),
                backgroundColor: Color(0xFF73AEF5),
              ),
              drawer: Drawer(
                child:
                Stack(
                  children: [
                    Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFF73AEF5),
                            Color(0XFF61A4F1),
                            Color(0xFF478DE0 ),
                            Color(0xFF398AE5),
                          ],
                          stops: [0.1, 0.4, 0.7, 0.9],
                        ),
                      ),
                    ),
                    Container(
                      height: double.infinity,
                      child: Column(
                        children:[
                          DrawerHeader(
                          child: Container(
                            height: size.height* .18,
                            decoration: BoxDecoration(

                              color: Colors.white,
                                border: Border.all(color: Colors.white, width: 1.5),
                            shape: BoxShape.circle,
                            image: DecorationImage(image: AssetImage("images/user.webp"))),
                            ),
                          ),
                          Container(
                            child:ListTile(
                              leading: Icon(Icons.person,color: Colors.white,),
                              title: Text(userData.name, style: TextStyle(
                                  color: Colors.white
                              ),),
                            )
                          ),
                          Container(
                            child: ListTile(
                                leading: Icon(Icons.email,color: Colors.white,),
                                title: Text(userData.email, style: TextStyle(
                                    color: Colors.white
                                ),
                                )
                            ),
                          ),
                           Container(
                             child: ListTile(
                                 leading: Icon(Icons.logout,color: Colors.white,),
                                 title: Text('Log out', style: TextStyle(
                                     color: Colors.white
                                 ),),
                                 onTap: () async{
                                   await _auth.signOut();
                                 }
                             ),
                           ),
                          Container(
                          )
                           ]
                ),
              ),
              ]
            ),
        ),
    body: BannerPage(),
        ),
    ),
        ),
      );
  }
}