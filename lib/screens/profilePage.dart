import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  //ProfilePage({Key? key}) : super(key: key);
  Size size=Size.fromWidth(120);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Bhawan App",),
            backgroundColor: Colors.purple,
          ),
          body:
          Container(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 15, top: 7),
                  child: Text("My Profile ",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                  ),
                ),
                Column(
                  children: [
                    SizedBox(height: 20),
                    Container(
                        height: 200,
                        child: Image(
                          image: AssetImage("images/Me.jpg"),
                        )
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
                                Text("Passing Year: ", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),),
                                SizedBox(height: 20),
                              ],
                            ),
                            SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Akanksha Swati", style: TextStyle(fontSize: 13),),
                                SizedBox(height: 20),
                                Text("a_swati@cs.iitr.ac.in", style: TextStyle(fontSize: 13),),
                                SizedBox(height: 20),
                                Text("21114007", style: TextStyle(fontSize: 13),),
                                SizedBox(height: 20),
                                Text("Kasturba Bhawan ", style: TextStyle(fontSize: 13),),
                                SizedBox(height: 20),
                                Text("C-514 ", style: TextStyle(fontSize: 13),),
                                SizedBox(height: 20),
                                Text("CSE ", style: TextStyle(fontSize: 13),),
                                SizedBox(height: 20),
                                Text("2025 ", style: TextStyle(fontSize: 13),),
                                SizedBox(height: 20),
                              ],
                            )
                          ],
                        )
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