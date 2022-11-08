import 'package:bhawan_app/models/user_auth.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/auth.dart';
import '../services/database_laundry.dart';
import '../utils/laundryCommonElements.dart';
import '../utils/loading.dart';
import 'laundry_admin_list.dart';

class LaundryAdminPage extends StatefulWidget {
  const LaundryAdminPage({Key? key}) : super(key: key);

  @override
  State<LaundryAdminPage> createState() => _LaundryAdminPageState();
}

class _LaundryAdminPageState extends State<LaundryAdminPage> {
  List<UserData> Data = [
    UserData(name: 'Arya Deshmukh', no_of_clothes: '10', room_number: 'B419'),
    UserData(name: 'Ayush Patel', no_of_clothes: '9', room_number: 'B444')
  ];
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserDataGlobal>(context);

    final user = Provider.of<UserAuth>(context);
    Size size = MediaQuery.of(context).size;
    return StreamBuilder<List<UserLaundry>>(
      stream: DataBaseLaundry(uid: user.uid,bhawan: userData.bhawan).users,
      builder: (context, snapshot) {
        if(snapshot.hasData){
        List<UserLaundry>? users =snapshot.data;
        if(users?.length==0) users=[];
        return Container(
            child: Scaffold(
                backgroundColor: Color(0xFF73AEF5),
                appBar: AppBar(
                  title: Text("List of students"),
                  elevation: 0,
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
                body: Stack(
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
                Column(
                  children: [
                    SizedBox(height: 35.0,),
                    SizedBox(height: 20.0,),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: users!.map((UserLaundry user) {
                            print(user.roomnumber);
                            if (user.inproccess == true) {
                              return LaundryAdminList(
                                  user.name, user.roomnumber, user.clothes,
                                      () async {
                                    print(user.id);
                                    await DataBaseLaundry(
                                        uid: user.id, bhawan: userData.bhawan).updateData(
                                        user.name,
                                        user.roomnumber, user.clothes, false);
                                    setState(() {
// Data.remove(user);
// await DataBaseLaundry(uid: user1!.uid,bhawan: 'Rajiv Bhawan').updateData(user.roomnumber, user.clothes,false);
                                    });
                                  });
                            }
                            else {
                              return Container();
                            }
                          }
                          ).toList(),
                        ),
                      ),
                    )
                  ],
                )
                ]
            )
        )
        );
        }
        else
          return Container() ;
      }
    );
  }
}
