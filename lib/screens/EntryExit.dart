import 'package:bhawan_app/screens/UserEntryExitStatus.dart';
import 'package:bhawan_app/utils/loading.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import '../models/user_auth.dart';
import '../services/database_entryexit.dart';
import '../utils/button.dart';
import '../utils/constants.dart';
import 'Request_Denied.dart';
import 'package:provider/provider.dart';

import 'homePage.dart';

var bhawan = ['Rajiv Bhawan', 'Rajendra Bhawan', 'Cautley Bhawan', 'Kasturba Bhawan', 'Jawahar Bhawan', 'Ravindra Bhawan', 'Sarojini Bhawan', 'Govind Bhawan', 'Ganga Bhawan', 'Radhakrishna Bhawan', 'VigyanKunj'];
String? selectedValue;

// void mainEntry() => Entry_Exit_Home();
class Entry_Exit_Home extends StatefulWidget {
  // final user = Provider.of<User>(context);
  final void Function(int) toggle;
  Entry_Exit_Home({required this.toggle});


  @override
  State<Entry_Exit_Home> createState() => _Entry_Exit_HomeState();
}

class _Entry_Exit_HomeState extends State<Entry_Exit_Home> {

  String bhawan_selected = bhawan.first;
  String comment= 'Request Entry';

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<UserAuth>(context);
    final _formKey = GlobalKey<FormState>();
    // final userdata = Provider.of<UserEntryExit>(context);
    final userData = Provider.of<UserDataGlobal>(context);
    Size size=MediaQuery.of(context).size;
    return StreamBuilder<UserEntryExitStatus>(
        stream: DatabaseEntryExit(uid: user.uid,Bhawan: userData.bhawan).status,
        builder: (context, snapshot) {
          print(snapshot.data);
          if(snapshot.hasData) {
            UserEntryExitStatus? userstatus = snapshot.data;
            // print(userstatus!.status);
            if (userstatus!.status||userstatus!.request) {
              bhawan_selected = userstatus.Bhawan;
              comment = 'Request Exit';
            }
            return MaterialApp(
              debugShowCheckedModeBanner: false,

              theme: ThemeData(
              ),
              home: Scaffold(

                body: Stack(
                  children: [
                    Container(
                    alignment: Alignment.center,
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
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                        horizontal: 40.0,
                        vertical: 120.0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Entry-Exit System',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'OpenSans',
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name : ${userData.name}',
                              style: kLabelStyle,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'Enrollment number : ${userData.enrollment_number}',
                              style: kLabelStyle,
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            Text(
                              'Select Bhawan',
                              style: kLabelStyle,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Container(
                              alignment: Alignment.center,
                              decoration: kBoxDecorationStyle,
                              height: 60.0,
                              // padding: EdgeInsets.all(15.0),
                              child: DropdownButtonFormField2(
                                value: bhawan_selected,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  // contentPadding: EdgeInsets.only(top:14.0),
                                  prefixIcon: Icon(
                                    Icons.other_houses,
                                    color: Colors.white,
                                  ),
                                  hintText: 'Enter your bhawan',
                                  hintStyle: kHintTextStyle,
                                ),
                                isExpanded: true,
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.white,
                                ),
                                iconSize: 30,
                                buttonHeight: 60,
                                buttonPadding: const EdgeInsets.only(left: 15, right: 15),
                                items: bhawan
                                    .map((item) {

                                  if(userstatus.status==false||userstatus.Bhawan==item||userstatus.request==false){
                                    return DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                        ),
                                      ),
                                    );}
                                  else{
                                    return DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                        ),
                                      ),
                                      enabled: false,
                                    );
                                  }
                                }
                                )
                                    .toList(),
                                validator: (value) {
                                  if (value == null) {
                                    return 'Please select your bhawan.';
                                  }
                                },
                                dropdownDecoration: BoxDecoration(
                                  color: Color(0xFF6CA8F1),
                                ),
                                onChanged: (value) {
                                  //Do something when changing the item if you want.
                                  setState(() {
                                    bhawan_selected = value! as String;
                                  });
                                },
                                onSaved: (value) {
                                  selectedValue = value.toString();
                                },
                              ),
                            ),
                          ]
                      ),
                          SizedBox(
                            height: 30.0,
                          ),
                          Container(
                            // padding: EdgeInsets.symmetric(vertical: 25.0),
                            width: double.infinity,
                            // alignment: Alignment.centerRight,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(30.0),
                                ),
                                padding: EdgeInsets.symmetric(vertical: 15),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState!
                                    .validate()) {
                                  widget.toggle(1);
                                  await DatabaseEntryExit(
                                      uid: user.uid,
                                      Bhawan: bhawan_selected)
                                      .updateDataEntry(
                                    userData.name,
                                    userData.enrollment_number,
                                    userstatus.status, true,);
                                  await DatabaseEntryExit(
                                      uid: user.uid,
                                      Bhawan: bhawan_selected)
                                      .statusUserEntry(
                                      bhawan_selected,
                                      userstatus.status,true);

                                  // StatusEntryExit(user.uid,bhawan_selected);
                                }
                              },
                              child: Text(
                                comment,
                                style: TextStyle(
                                  color: Color(0XFF61A4F1),
                                ),
                              ),
                            ),
                          ),
                        ]
          ),
          ),
                  ),
                ),

                  ],
                ),
              ),
            );
          }
          else{
            return Loading();
          }
        }
    );
  }
}

class UserEntry extends StatefulWidget {
  const UserEntry({Key? key}) : super(key: key);

  @override
  State<UserEntry> createState() => _UserEntryState();
}

class _UserEntryState extends State<UserEntry> {



  int currentIndex = 0;

  void onTab(int index){
    setState(() {
      currentIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {

    // final userdata1 = Provider.of<UserLaundry?>(context);
    //
    // if(userdata1==null)
    //   return Loading();
    // else {
    //   if (userdata1.inproccess != false) currentIndex = 1;
    List<Widget> _children = [
      Entry_Exit_Home(toggle:onTab),
      StatusEntryExit()
    ];

    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF73AEF5),
      ),
      home: Scaffold(
        backgroundColor: Color(0xFF73AEF5),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop(UserEntry());
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
              );
            },
          ),
          // title: Text("Entry Exit"),
        ),
        body: _children[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Color(0xFF398AE5),
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.amber,
          currentIndex: currentIndex,
          // selectedItemColor: Colors.purple,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.check),
              label: 'Status',
            ),
          ],
          onTap: onTab,
        ),
      ),
    );
  }
}