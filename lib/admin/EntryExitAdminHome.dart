import 'package:bhawan_app/admin/entry_exit_list.dart';
import 'package:bhawan_app/services/database_entryexit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user_auth.dart';
import '../services/auth.dart';
import '../utils/button.dart';

// void Admin_Entry_main()=>runApp(Admin_Entry());

class Admin_Entry extends StatefulWidget {
  const Admin_Entry({Key? key}) : super(key: key);

  @override
  State<Admin_Entry> createState() => _Admin_EntryState();
}

class _Admin_EntryState extends State<Admin_Entry> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<UserAuth?>(context);
    final userData = Provider.of<UserDataGlobal>(context);
    Size size = MediaQuery.of(context).size;
    // final userData = Provider.of<UserDataGlobal>(context);
    return StreamBuilder<List<UserEntryExit>>(
        stream: DatabaseEntryExit(uid: user!.uid,Bhawan: userData.bhawan).users,
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            List<UserEntryExit>? users = snapshot.data;
            if(users!.length==0) users=[];
            return MaterialApp(
              theme: ThemeData(
              ),
              home: Scaffold(
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
                          ],
                        )
                      ),
                      ],
            )
          ),


                      body: Center(
                  child: Column(

                    children: users.map((UserEntryExit user) {
                      // print(user.roomnumber);
                      if (user.request == true) {
                        return EntryExitAdminList(
                            user.name, user.enrollment_number,
                                () async {
                              // print(user.id);
                              await DatabaseEntryExit(
                                  uid: user.id, Bhawan: userData.bhawan).updateDataEntry(
                                  user.name,
                                  user.enrollment_number, !user.status, false);
                              await DatabaseEntryExit(
                                  uid: user.id, Bhawan: userData.bhawan).statusUserEntry(userData.bhawan, !user.status,false);
                            },user.status);
                      }
                      else {
                        return Container();
                      }
                    }
                    ).toList(),
                  ),
                ),
              ),
            );
          }
          else {
            return MaterialApp(
              theme: ThemeData(
              ),
              home: Scaffold(
                backgroundColor: Color(0xFF73AEF5),
                appBar: AppBar(
                    title: Text(
                      'Entry Exit',
                    ),
                ),
                body: Center(

                ),
              ),
            );
          }
        }
    );
  }
}