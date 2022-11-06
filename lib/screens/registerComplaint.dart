import 'package:bhawan_app/services/database_complain.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:provider/provider.dart';

import '../models/user_auth.dart';
import '../utils/button.dart';

class registerComplaint extends StatefulWidget {
  const registerComplaint({super.key});

  @override
  State<registerComplaint> createState() => _registerComplaintState();
}

class _registerComplaintState extends State<registerComplaint> {

  final _formKey = GlobalKey<FormState>();

  final List<String> items = [
    'Mess',
    'Electrical',
    'Maintainance',
    'Others',
  ];
  String? selectedValue;
  String? description;
  String? name;
  String? roomnumber;

  @override
  Widget build(BuildContext context) {
    final userdata = Provider.of<UserAuth>(context);
    final userData = Provider.of<UserDataGlobal>(context);
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  color: Color.fromARGB(255, 177, 175, 175),
                  padding: EdgeInsets.all(10),
                  height: 52,
                  width: MediaQuery.of(context).size.width,
                  child: SizedBox(
                    height: 56.0,
                    child: Text('Complaint Management',
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 15,
                        width: MediaQuery.of(context).size.width,
                        child: SizedBox(),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          textAlign: TextAlign.center,
                          "Register your complaint here",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ),
                      Container(
                        height: 15,
                        width: MediaQuery.of(context).size.width,
                        child: SizedBox(),
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.topLeft,
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(5.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  labelText: 'Your Name',
                                  hintText: 'Enter your name here',
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: EdgeInsets.all(5.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  labelText: 'Room Number',
                                  hintText: 'Enter your room number here',
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: EdgeInsets.all(5.0),
                              child: DropdownButtonFormField2(
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
                                  'Select the type of complaint',
                                ),
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.black45,
                                ),
                                iconSize: 30,
                                buttonHeight: 60,
                                buttonPadding: const EdgeInsets.only(left: 15, right: 15),
                                dropdownDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                items: items
                                    .map((item) =>
                                    DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ))
                                    .toList(),
                                validator: (value) {
                                  if (value == null) {
                                    return 'Please select the type of complaint.';
                                  }
                                },
                                onChanged: (value) {
                                  //Do something when changing the item if you want.
                                  selectedValue = value.toString();
                                },
                                onSaved: (value) {
                                  selectedValue = value.toString();
                                },
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              child: TextFormField(
                                validator: (val) => val!.isEmpty ? 'Please enter description' : null,
                                onChanged: (val) => setState(() => description = val),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  labelText: 'Description',
                                  hintText: 'Description of complaint',
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Button("Submit", () async {
                              if(_formKey.currentState!.validate()){
                                print(selectedValue);
                                await DataBaseComplain(uid: userdata.uid,bhawan: userData.bhawan).updateData(userData.name, userData.room_number, selectedValue!, description!, true);
                              }
                            }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
