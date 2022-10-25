import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import '../utils/button.dart';

class registerComplaint extends StatefulWidget {
  const registerComplaint({super.key});

  @override
  State<registerComplaint> createState() => _registerComplaintState();
}

class _registerComplaintState extends State<registerComplaint> {
  final List<String> items = [
    'Mess',
    'Electrical',
    'Maintainance',
    'Others',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Color.fromARGB(255, 177, 175, 175),
                padding: EdgeInsets.all(10),
                height: 52,
                width: 400,
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
                      width: 400,
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
                      width: 400,
                      child: SizedBox(),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      width: 400,
                      alignment: Alignment.topLeft,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10.0),
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                labelText: 'Your Name',
                                hintText: 'Enter your name here',
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10.0),
                            child: TextField(
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
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text("    Complaint:",
                                style: TextStyle(fontSize: 20)),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2(
                                hint: Text(
                                  '     Select Item',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Theme.of(context).hintColor,
                                  ),
                                ),
                                items: items
                                    .map((item) => DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ))
                                    .toList(),
                                value: selectedValue,
                                onChanged: (value) {
                                  setState(() {
                                    selectedValue = value as String;
                                  });
                                },
                                buttonHeight: 40,
                                buttonWidth: 310,
                                itemHeight: 40,
                              ),
                            ),
                          ),
                          Divider(
                            color: Color.fromARGB(255, 119, 117, 117),
                            height: 5,
                            thickness: 1,
                            indent: 18,
                            endIndent: 10,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: EdgeInsets.all(10.0),
                            child: TextField(
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
                          Button("Submit", () => {}),
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
    );
    ;
  }
}
