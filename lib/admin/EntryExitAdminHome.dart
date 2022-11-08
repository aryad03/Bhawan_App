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
    // final userData = Provider.of<UserDataGlobal>(context);
    return StreamBuilder<List<UserEntryExit>>(
        stream: DatabaseEntryExit(uid: user!.uid,Bhawan: userData.bhawan).users,
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            List<UserEntryExit>? users = snapshot.data;
            if(users!.length==0) users=[];
            return MaterialApp(
              theme: ThemeData(
                primarySwatch: Colors.purple,
              ),
              home: Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                    title: Text(
                      'Entry Exit',
                    ),
                    centerTitle: true,
                    backgroundColor: Colors.purple,
                    actions: <Widget>[
                      TextButton.icon(
                        icon: Icon(Icons.person),
                        label: Text('logout',style: TextStyle(color: Colors.black)),
                        onPressed: () async {
                          await _auth.signOut();
                        },
                      ),]
                ),
                body: Center(
                  child: Column(
                    // children: [
                    //   // Container(
                    //   //   child:Text(userData.name),
                    //   // ),
                    //   // Container(
                    //   //   child: Text(userData.enrollment_number),
                    //   // ),
                    //   Container(
                    //     child: Row(
                    //       children: [
                    //         Container(
                    //           child: Container(
                    //             width: 205,
                    //             child: Button(
                    //               'Allow Request',
                    //                 () {},
                    //             ),
                    //           ),
                    //         ),
                    //       ],
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
                primarySwatch: Colors.purple,
              ),
              home: Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                    title: Text(
                      'Entry Exit',
                    ),
                    centerTitle: true,
                    backgroundColor: Colors.purple,
                    actions: <Widget>[
                      TextButton.icon(
                        icon: Icon(Icons.person),
                        label: Text('logout',
                          style: TextStyle(color: Colors.black),),
                        onPressed: () async {
                          await _auth.signOut();
                        },
                      ),]
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