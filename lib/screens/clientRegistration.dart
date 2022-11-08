import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../services/auth.dart';
import '../utils/loading.dart';
import '/utils/constants.dart';
import '../utils/button.dart';
import '../main.dart';
import 'clientRegistration.dart';
import 'otp.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

var bhawan = ['Rajiv Bhawan', 'Rajendra Bhawan', 'Cautley Bhawan', 'Kasturba Bhawan', 'Jawahar Bhawan', 'Ravindra Bhawan', 'Sarojini Bhawan', 'Govind Bhawan', 'Ganga Bhawan', 'Radhakrishna Bhawan', 'VigyanKunj'];
String? selectedValue;
var type = ['Student','Laundry Man', 'Guard'];
String? accountType;
bool showvalue = false;
final _formKey = GlobalKey<FormState>();

class RegistrationPage extends StatefulWidget {

  final void Function(int) toggle;
  RegistrationPage({required this.toggle});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';
  String _name = '';
  String _room_number = '';
  String _enrollment_number = '';
  String _bhawan_selected = '';
  String _branch = '';
  String _error = '';
  String _account = type.first;
  bool _loading = false;
  String bhawan_selected = bhawan.first;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return _loading ? Loading() : MaterialApp(
      theme: ThemeData(
        primarySwatch: kPrimaryColor,
      ),
      home: Scaffold(
        // resizeToAvoidBottomInset : false,
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          title: Text(
            'Student Registration Page',
          ),
          centerTitle: true,
          backgroundColor: kPrimaryColor,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
                        ],
                      ),
                      Container(
                        child: Text('Create a new account', style: TextStyle(fontSize: 18,
                            color: Colors.black,
                        ),),
                        ),
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(15.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                labelText: 'Name',
                                hintText: 'Enter your name here',
                              ),
                              validator: (val) => (val!.isEmpty) ? 'Enter your name' : null,
                              onChanged: (val){
                                setState(() => _name = val);
                              },
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(15.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                labelText: 'Email-Id',
                                hintText: 'Enter your Institute email-id here',
                              ),
                              validator: (val) => (val!.isEmpty) ? 'Enter an email-id' : null,
                              onChanged: (val){
                                setState(() => _email = val);
                              },
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(15.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                labelText: 'Enrollment Number',
                                hintText: 'Enter your enrollment number here',
                              ),
                              validator: (val) => (val!.isEmpty) ? 'Enter your enrollment number' : null,
                              onChanged: (val){
                                setState(() => _enrollment_number = val);
                              },
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
                                setState(() {
                                  _bhawan_selected = value! as String;
                                });
                              },
                              onSaved: (value) {
                                selectedValue = value.toString();
                              },
                            ),

                          ),
                          Container(
                            padding: EdgeInsets.all(15.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                labelText: 'Room Number',
                                hintText: 'Enter your bhawan room number here',
                              ),
                              validator: (val) => (val!.isEmpty) ? 'Enter your room number' : null,
                              onChanged: (val){
                                setState(() => _room_number = val);
                              },
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(15.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                labelText: 'Branch',
                                hintText: 'Enter branch here',
                              ),
                              validator: (val) => (val!.isEmpty) ? 'Enter your branch' : null,
                              onChanged: (val){
                                setState(() => _branch = val);
                              },
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(15.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                labelText: 'Password',
                                hintText: 'Enter password here',
                              ),
                              validator: (val) => (val!.isEmpty) ? 'Enter your password' : null,
                              onChanged: (val){
                                setState(() => _password = val);
                              },
                              obscureText: true,
                            ),
                          ),
                          // Container(
                          //   padding: EdgeInsets.all(15.0),
                          //   child: DropdownButtonFormField2(
                          //     decoration: InputDecoration(
                          //       isDense: true,
                          //       contentPadding: EdgeInsets.zero,
                          //       border: OutlineInputBorder(
                          //         borderRadius: BorderRadius.circular(10),
                          //       ),
                          //     ),
                          //     isExpanded: true,
                          //     hint: const Text(
                          //       'Select Your role',),
                          //     icon: const Icon(
                          //       Icons.arrow_drop_down,
                          //       color: Colors.black45,
                          //     ),
                          //     iconSize: 30,
                          //     buttonHeight: 60,
                          //     buttonPadding: const EdgeInsets.only(left: 15, right: 15),
                          //     dropdownDecoration: BoxDecoration(
                          //       borderRadius: BorderRadius.circular(10),
                          //     ),
                          //     items: type
                          //         .map((itema) =>
                          //         DropdownMenuItem<String>(
                          //           value: itema,
                          //           child: Text(
                          //             itema,
                          //             style: const TextStyle(
                          //               fontSize: 14,
                          //             ),
                          //           ),
                          //         ))
                          //         .toList(),
                          //     validator: (valued) {
                          //       if (valued == null) {
                          //         return 'Please select your role.';
                          //       }
                          //     },
                          //     onChanged: (valued) {
                          //       //Do something when changing the item if you want.
                          //       setState(() {
                          //         _account = valued! as String;
                          //       });
                          //     },
                          //     onSaved: (valued) {
                          //       accountType= valued.toString();
                          //     },
                          //   ),
                          // ),
                          Container(
                            width: size.width * 0.3,
                            margin: EdgeInsets.all(0),
                            child: ElevatedButton(

                              onPressed: () async{
                                if(_formKey.currentState!.validate()) {
                                  setState(() {
                                    _loading = true;
                                  });
                                  dynamic result = await _auth.register(_email, _password, _name, _enrollment_number, _room_number, _bhawan_selected, _branch,'Student');
                                  if(result == null){
                                    setState(() {
                                      _error = 'Enter valid email';
                                      _loading = false;
                                    });
                                  }
                                }
                              },
                              child: Text('Register'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.purple,
                              ),
                            ),
                          ),

                          SizedBox(height: 15,),
                          Container(
                            width: size.width * 0.3,
                            child: ElevatedButton(
                              onPressed: () {
                                widget.toggle(0);
                              },
                              child: Text('Sign In'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.purple,
                              ),
                            ),
                          ),
                          Text(_error),
                        ],
                      ),
                    ],
                  ),
                ),
              ]
            ),
          ),
        ),
      ),
    );
  }
}