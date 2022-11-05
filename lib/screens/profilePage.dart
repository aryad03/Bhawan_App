import 'package:flutter/material.dart';
import 'package:bhawan_app/screens/homePage.dart';
import 'package:provider/provider.dart';

import '../models/user_auth.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    final userData = Provider.of<UserDataGlobal>(context);

    return Container(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purple,
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () { Navigator.of(context).pop(ProfilePage());
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> HomePage()));
                  },
                );
              },
            ),
            title: Text("Bhawan App"),
          ),
          body:
          Container(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text("My Profile ",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  height: 52,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                  ),
                ),
                Column(
                  children: [
                    SizedBox(height: 20),
                    Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(image: AssetImage("images/default.jpg"))
                        ), height: 200
                    ),
                    SizedBox(height: 20),
                    Container(
                        padding: EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Name:", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                                SizedBox(height: 20),
                                Text("Email-id:", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),),
                                SizedBox(height: 20),
                                Text("Enrollment No: ", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),),
                                SizedBox(height: 20),
                                Text("Bhawan: ", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),),
                                SizedBox(height: 20),
                                Text("Room No.: ", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),),
                                SizedBox(height: 20),
                                Text("Branch: ", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),),
                                SizedBox(height: 20),
                              ],
                            ),
                            SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(userData.name, style: TextStyle(fontSize: 13),),
                                SizedBox(height: 20),
                                Text(userData.email, style: TextStyle(fontSize: 13),),
                                SizedBox(height: 20),
                                Text(userData.enrollment_number, style: TextStyle(fontSize: 13),),
                                SizedBox(height: 20),
                                Text(userData.bhawan, style: TextStyle(fontSize: 13),),
                                SizedBox(height: 20),
                                Text(userData.room_number, style: TextStyle(fontSize: 13),),
                                SizedBox(height: 20),
                                Text(userData.branch, style: TextStyle(fontSize: 13),),
                                SizedBox(height: 20),
                              ],
                            ),
                          ],
                        ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
    );
  }
}