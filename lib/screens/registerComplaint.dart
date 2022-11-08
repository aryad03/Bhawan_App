import 'package:bhawan_app/services/database_complain.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:provider/provider.dart';

import '../models/user_auth.dart';
import '../utils/button.dart';
import '../utils/constants.dart';

class registerComplaint extends StatefulWidget {

  final void Function(int) functionchange;

  registerComplaint({required this.functionchange});
  @override
  State<registerComplaint> createState() => _registerComplaintState();
}

class _registerComplaintState extends State<registerComplaint> {

  final _formKey = GlobalKey<FormState>();

  var complain = [
    'Mess',
    'Electrical',
    'Maintainance',
    'Others',
  ];
  String? type;
  String? selectedValue;
  String? description;
  String? name;
  String? roomnumber;

  @override

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final userdata = Provider.of<UserAuth>(context);
    final userData = Provider.of<UserDataGlobal>(context);
    return MaterialApp(
      theme: ThemeData(
        // primarySwatch: Colors.grey,
        scaffoldBackgroundColor: Color(0xFF73AEF5),
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
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
                            'Register your Complain',
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
                                      'Complain Department',
                                      style: kLabelStyle,
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      decoration: kBoxDecorationStyle,
                                      height: 60.0,
                                      // padding: EdgeInsets.all(15.0),
                                      child: DropdownButtonFormField2(
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          // contentPadding: EdgeInsets.only(top:14.0),
                                          prefixIcon: Icon(
                                            Icons.other_houses,
                                            color: Colors.white,
                                          ),
                                          hintText: 'Enter your complain department',
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
                                        items: complain
                                            .map((item) =>
                                            DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(
                                                item,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ))
                                            .toList(),
                                        validator: (value) {
                                          if (value == null) {
                                            return 'Please select your complain department.';
                                          }
                                        },
                                        dropdownDecoration: BoxDecoration(
                                          color: Color(0xFF6CA8F1),
                                        ),
                                        onChanged: (value) {
                                          //Do something when changing the item if you want.
                                          setState(() {
                                            selectedValue = value! as String;
                                          });
                                        },
                                        onSaved: (value) {
                                          selectedValue = value.toString();
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                // Container(
                                //   padding: EdgeInsets.all(15),
                                //   width: MediaQuery.of(context).size.width,
                                //   alignment: Alignment.topLeft,
                                //   child: Column(
                                //     children: [
                                //       Container(
                                //         padding: EdgeInsets.all(5.0),
                                //         child: DropdownButtonFormField2(
                                //           decoration: InputDecoration(
                                //             isDense: true,
                                //             contentPadding: EdgeInsets.all(5),
                                //             fillColor: Colors.white,
                                //             filled: true,
                                //             enabledBorder: OutlineInputBorder(
                                //               borderRadius: BorderRadius.circular(10),
                                //               borderSide: BorderSide(
                                //                 color: Colors.black,
                                //               ),
                                //             ),
                                //             focusedBorder: OutlineInputBorder(
                                //               borderSide: BorderSide(
                                //                 color: Colors.brown,
                                //               ),
                                //             ),
                                //           ),
                                //           isExpanded: true,
                                //           hint: const Text(
                                //             'Select the type of complaint',
                                //             style: TextStyle(
                                //               color: Colors.purple,
                                //             ),
                                //           ),
                                //           icon: const Icon(
                                //             Icons.arrow_drop_down,
                                //             color: Colors.black45,
                                //           ),
                                //           iconSize: 30,
                                //           buttonHeight: 60,
                                //           buttonPadding: const EdgeInsets.only(left: 15, right: 15),
                                //           dropdownDecoration: BoxDecoration(
                                //             borderRadius: BorderRadius.circular(10),
                                //           ),
                                //           items: item
                                //               .map((item) =>
                                //               DropdownMenuItem<String>(
                                //                 value: item,
                                //                 child: Text(
                                //                   item,
                                //                   style: const TextStyle(
                                //                     fontSize: 14,
                                //                   ),
                                //                 ),
                                //               ))
                                //               .toList(),
                                //           validator: (value) {
                                //             if (value == null) {
                                //               return 'Please select the type of complaint.';
                                //             }
                                //           },
                                //           onChanged: (value) {
                                //             //Do something when changing the item if you want.
                                //             selectedValue = value.toString();
                                //           },
                                //           onSaved: (value) {
                                //             selectedValue = value.toString();
                                //           },
                                //         ),
                                //       ),
                                      SizedBox(
                                        height: 30,
                                      ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Description',
                                style: kLabelStyle,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                decoration: kBoxDecorationStyle,
                                height: 60.0,
                                child: TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'OpenSans'
                                  ),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    // contentPadding: EdgeInsets.all(14.0),
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: Colors.white,
                                    ),
                                    hintText: 'Enter your description',
                                    hintStyle: kHintTextStyle,
                                  ),
                                  validator: (val) => (val!.isEmpty) ? 'Enter your description' : null,
                                  onChanged: (val){
                                    setState(() => description = val);
                                  },
                                ),
                              ),
                            ],
                          ),
                                      // Container(
                                      //   padding: EdgeInsets.all(5),
                                      //   child: TextFormField(
                                      //     validator: (val) => val!.isEmpty ? 'Please enter description' : null,
                                      //     onChanged: (val) => setState(() => description = val),
                                      //     decoration: InputDecoration(
                                      //       border: OutlineInputBorder(
                                      //         borderRadius: BorderRadius.circular(10),
                                      //       ),
                                      //       labelText: 'Description',
                                      //       hintText: 'Description of complaint',
                                      //     ),
                                      //   ),
                                      // ),
                                      SizedBox(
                                        height: 30,
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
                                if(_formKey.currentState!.validate()){
                                  print(selectedValue);
                                  widget.functionchange(0);
                                  await DataBaseComplain(uid: userdata.uid,bhawan: userData.bhawan).updateData(userData.name, userData.room_number, selectedValue!, description!, true);
                                }
                              },
                              child: Text(
                                'Submit',
                                style: TextStyle(
                                  color: Color(0XFF61A4F1),
                                ),
                              ),
                            ),
                          ),

                                      // Button("Submit", () async {
                                      //   if(_formKey.currentState!.validate()){
                                      //     print(selectedValue);
                                      //     widget.functionchange(0);
                                      //     await DataBaseComplain(uid: userdata.uid,bhawan: userData.bhawan).updateData(userData.name, userData.room_number, selectedValue!, description!, true);
                                      //   }
                                      // }),
                                    ],
                                  ),
                                ),
                            ),
                      ),
        ]
                    ),
                  ),





    );
  }
}
