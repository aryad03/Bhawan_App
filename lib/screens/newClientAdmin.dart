import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import '../services/auth.dart';
import '../utils/loading.dart';
import '/utils/constants.dart';
import '../utils/button.dart';
import '/screens/clientRegistration.dart';
import 'homePage.dart';

var bhawan = ['Rajiv Bhawan', 'Rajendra Bhawan', 'Cautley Bhawan', 'Kasturba Bhawan', 'Jawahar Bhawan', 'Ravindra Bhawan', 'Sarojini Bhawan', 'Govind Bhawan', 'Ganga Bhawan', 'Radhakrishna Bhawan', 'VigyanKunj'];
String? selectedValue;
var type = ['Laundry Man', 'Guard'];
String? accountType;
bool showvalue = false;

class RegistrationPageAdmin1 extends StatefulWidget {

  final void Function(int) toggle;
  RegistrationPageAdmin1({required this.toggle});

  @override
  State<RegistrationPageAdmin1> createState() => _RegistrationPageAdmin1State();
}

class _RegistrationPageAdmin1State extends State<RegistrationPageAdmin1> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';
  String _name = '';
  String _room_number = '';
  String _enrollment_number = '';
  String _bhawan_selected = '';
  String _branch = '';
  String _account = type.first;
  String _error = '';
  bool _loading = false;
  String bhawan_selected = bhawan.first;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return _loading ? Loading() : MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        body: Stack(
          children: [
            Container(
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
                        'Sign Up',
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
                            'Name',
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
                                hintText: 'Enter your name',
                                hintStyle: kHintTextStyle,
                              ),
                              validator: (val) => (val!.isEmpty) ? 'Enter your name' : null,
                              onChanged: (val){
                                setState(() => _name = val);
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Email',
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
                                // contentPadding: EdgeInsets.only(top:14.0),
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Colors.white,
                                ),
                                hintText: 'Enter your email',
                                hintStyle: kHintTextStyle,
                              ),
                              validator: (val) => (val!.isEmpty) ? 'Enter an emailId' : null,
                              onChanged: (val){
                                setState(() => _email = val);
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bhawan',
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
                                  .map((item) =>
                                  DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ))
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
                                  _bhawan_selected = value! as String;
                                });
                              },
                              onSaved: (value) {
                                selectedValue = value.toString();
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Role',
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
                                hintText: 'Enter your role',
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
                              items: type
                                  .map((item) =>
                                  DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ))
                                  .toList(),
                              validator: (value) {
                                if (value == null) {
                                  return 'Please select your role.';
                                }
                              },
                              dropdownDecoration: BoxDecoration(
                                color: Color(0xFF6CA8F1),
                              ),
                              onChanged: (value) {
                                //Do something when changing the item if you want.
                                setState(() {
                                  _account = value! as String;
                                });
                              },
                              onSaved: (value) {
                                accountType = value.toString();
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Password',
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
                              obscureText: true,
                              keyboardType: TextInputType.text,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'OpenSans'
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(top:14.0),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.white,
                                ),
                                hintText: 'Enter your password',
                                hintStyle: kHintTextStyle,
                              ),
                              validator: (val) => (val!.length < 6) ? 'Enter a password atleast 6 characters long' : null,
                              onChanged: (val){
                                setState(() => _password = val);
                              },
                            ),
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
                                if(_formKey.currentState!.validate()) {
                                  setState(() {
                                    _loading = true;
                                  });
                                  dynamic result = await _auth.register(_email, _password, _name, _enrollment_number, _room_number, _bhawan_selected, _branch,_account);
                                  if(result == null){
                                    setState(() {
                                      _error = 'Enter valid email';
                                      _loading = false;
                                    });
                                  }
                                }
                              },
                              child: Text(
                                'REGISTER',
                                style: TextStyle(
                                  color: Color(0XFF61A4F1),
                                ),
                              ),
                            ),
                          ),
                          // SizedBox(
                          //   height: 10.0,
                          // ),
                          Divider(
                            thickness: 1.07,
                            color: Colors.white,
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
                                widget.toggle(0);
                              },
                              child: Text(
                                'SIGN IN',
                                style: TextStyle(
                                  color: Color(0XFF61A4F1),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}