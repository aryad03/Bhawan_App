import 'package:bhawan_app/screens/UserEntryExitStatus.dart';
import 'package:bhawan_app/utils/loading.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import '../models/user_auth.dart';
import '../services/database_entryexit.dart';
import '../utils/button.dart';
import 'Request_Denied.dart';
import 'package:provider/provider.dart';

import 'homePage.dart';

var bhawan = ['Rajiv Bhawan', 'Rajendra Bhawan', 'Cautley Bhawan', 'Kasturba Bhawan', 'Jawahar Bhawan', 'Ravindra Bhawan', 'Sarojani Bhawan', 'Govind Bhawan', 'Ganga Bhawan', 'Radhakrishna Bhawan', 'VigyanKunj'];
String? selectedValue;

void mainEntry() => Entry_Exit_Home();
class Entry_Exit_Home extends StatefulWidget {
  // final user = Provider.of<User>(context);
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
    return StreamBuilder<UserEntryExitStatus>(
        stream: DatabaseEntryExit(uid: user.uid,Bhawan: userData.bhawan).status,
        builder: (context, snapshot) {
          print(snapshot.data);
          if(snapshot.hasData) {
            UserEntryExitStatus? userstatus = snapshot.data;
            // print(userstatus!.status);
            if (userstatus!.status) {
              bhawan_selected = userstatus.Bhawan;
              comment = 'Request Exit';
            }
            return MaterialApp(
              theme: ThemeData(
                primarySwatch: Colors.purple,
              ),
              home: Scaffold(
                backgroundColor: Colors.white,

                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SingleChildScrollView(
                        child: Column(
                            children: [
                              Container(
                                  child: Form(
                                    key: _formKey,
                                    child: Container(
                                      padding: EdgeInsets.fromLTRB(
                                          15.0, 165.0, 15.0, 15.0),
                                      child: Text(userData.name),
                                      /*child: TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      labelText: 'Username',
                                      hintText: 'Enter your username here',
                                    ),
                                  ),*/
                                    ),
                                  )
                              ),
                              Container(
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(
                                        15.0, 20.0, 15.0, 30.0),
                                    child: Text(userData.enrollment_number),
                                    /*child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    labelText: 'Enrollment Number',
                                    hintText: 'Enter your enrollment number here',
                                  ),
                                ),*/
                                  )
                              ),
                              Container(
                                padding: EdgeInsets.all(15.0),
                                child: DropdownButtonFormField2(
                                  value: bhawan_selected,
                                  decoration: InputDecoration(
                                    //Add isDense true and zero Padding.
                                    //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                                    isDense: true,
                                    contentPadding: EdgeInsets.zero,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    //Add more decoration as you want here
                                    //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                                  ),
                                  isExpanded: true,
                                  hint: const Text(
                                    'Select Your Bhawan',
                                  ),
                                  icon: const Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.black45,
                                  ),
                                  iconSize: 30,
                                  buttonHeight: 60,
                                  buttonPadding: const EdgeInsets.only(
                                      left: 15, right: 15),
                                  dropdownDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  items: bhawan
                                      .map((item) {
                                    if (userstatus.status == false ||
                                        userstatus.Bhawan == item) {
                                      return DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      );
                                    }
                                    else {
                                      return DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                        onTap: () => null,
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
                                  onChanged: (value) {
                                    //Do something when changing the item if you want.
                                    setState(() {
                                      if (userstatus!.status == false) {
                                        bhawan_selected = value! as String;
                                      }
                                      else {
                                        bhawan_selected = userstatus.Bhawan;
                                        selectedValue = userstatus.Bhawan;
                                      }
                                    });
                                  },
                                  onSaved: (value) {
                                    // selectedValue = value.toString();
                                    if (userstatus.status == true) {
                                      setState(() {
                                        bhawan_selected = userstatus.Bhawan;
                                      });
                                    }
                                    else {
                                      setState(() {
                                        bhawan_selected = value! as String;
                                      });
                                    }
                                  },
                                ),

                              ),
                              Container(
                                padding: EdgeInsets.all(75.0),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      child: Container(
                                        width: 205,
                                        child: Button(
                                            comment,
                                                () async {
                                              if (_formKey.currentState!
                                                  .validate()) {
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
                                            }
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ]
                        ),
                      ),
                    ],
                  ),
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

  List<Widget> _children = [
    Entry_Exit_Home(),
    StatusEntryExit()
  ];

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

    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Scaffold(
        appBar: AppBar(
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
          title: Text("Entry Exit"),
        ),
        body: _children[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          backgroundColor: Colors.purple,
          selectedItemColor: Colors.amber,
          unselectedItemColor: Colors.white,
          type: BottomNavigationBarType.fixed,
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