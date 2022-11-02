import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '/utils/constants.dart';
import '../utils/button.dart';
import '../main.dart';
import 'otp.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

var bhawan = ['Rajiv Bhawan', 'Rajendra Bhawan', 'Cautley Bhawan', 'Kasturba Bhawan', 'Jawhar Bhawan', 'Ravindra Bhawan', 'Sarojani Bhawan', 'Govind Bhawan', 'Ganga Bhawan', 'RadhaKrishn Bhawan', 'VigyanKunj'];
String? selectedValue;
final _formKey = GlobalKey<FormState>();
void main1() => runApp(RegistrationPage());

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  String bhawan_selected = bhawan.first;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: kPrimaryColor,
      ),
      home: Scaffold(
        // resizeToAvoidBottomInset : false,
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          title: Text(
            'Registration Page',
          ),
          centerTitle: true,
          backgroundColor: kPrimaryColor,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Container(
                            width: 120,
                            height: 120,
                            child: Image(
                              image: AssetImage('images/logo.jpg'),
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            'Bhawan App',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      child: Text('Create a new account'),
                    ),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(15.0),
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelText: 'Username',
                              hintText: 'Enter your username here',
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(15.0),
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelText: 'Email-Id',
                              hintText: 'Enter your Institute email-id here',
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(15.0),
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelText: 'Enrollment Number',
                              hintText: 'Enter your enrollment number here',
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(15.0),
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
                              'Select Your Bhawan',
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
                            items: bhawan
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
                                return 'Please select your bhawan.';
                              }
                            },
                            onChanged: (value) {
                              //Do something when changing the item if you want.
                            },
                            onSaved: (value) {
                              selectedValue = value.toString();
                            },
                          ),

                        ),
                        Container(
                          padding: EdgeInsets.all(15.0),
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelText: 'Room Number',
                              hintText: 'Enter your bhawan room number here',
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(15.0),
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelText: 'Password',
                              hintText: 'Enter password here',
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(0),
                          child: Button(
                            'Register',
                              main2,
                          ),
                          // child: Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     Container(
                          //       padding: EdgeInsets.all(15.0),
                          //       child: Container(
                          //         width: 150,
                          //         child: Button(
                          //           'Sign Up',
                          //           main2,
                          //         ),
                          //       ),
                          //     ),
                          //     Container(
                          //       padding: EdgeInsets.all(15.0),
                          //       child: Container(
                          //         width: 150,
                          //         child: Button(
                          //           'Log In',
                          //               () {},
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}