import 'package:flutter/material.dart';
import '../services/auth.dart';
import '../utils/loading.dart';
import '/utils/constants.dart';
import '../utils/button.dart';
import '/screens/clientRegistration.dart';
import 'homePage.dart';

class LoginPage1 extends StatefulWidget {

  final void Function(int) toggle;
  LoginPage1({required this.toggle});

  @override
  State<LoginPage1> createState() => _LoginPage1State();
}

class _LoginPage1State extends State<LoginPage1> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';
  String _error = '';
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return _loading ? Loading() : MaterialApp(
      // theme: ThemeData(
      //   primarySwatch: kPrimaryColor,
      // ),
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
                        'Sign In',
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
                            // contentPadding: EdgeInsets.all(14.0),
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
                            // contentPadding: EdgeInsets.only(top:14.0),
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
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                _loading = true;
                              });
                              dynamic result = await _auth.signIn(_email, _password);
                              if (result == null) {
                                setState(() {
                                  _error = 'Could not find credentials';
                                  _loading = false;
                                });
                              }
                            }
                          },
                          child: Text(
                            'LOGIN',
                            style: TextStyle(
                              color: Color(0XFF61A4F1),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      ]
                  ),
                      // Divider(
                      //   thickness: 1.07,
                      //   color: Colors.white,
                      // ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '- OR -',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      Text(
                        'Register as',
                        style: kLabelStyle,
                      ),
                    ],
                  ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            CardField(
                                size,
                                Colors.white,
                                IconButton(
                                  icon: Icon(
                                    Icons.school,
                                  ),
                                  color: Colors.blue,
                                  onPressed: ()async{
                                    widget.toggle(1);
                                  },
                                ),
                                'Student'),
                            CardField(
                                size,
                                Colors.white,
                                IconButton(
                                  icon: Icon(
                                    Icons.admin_panel_settings_rounded,
                                  ),
                                  color: Colors.blue,
                                  onPressed: ()async{
                                    widget.toggle(2);
                                  },
                                ),
                                'Admin'),
                          ],
                        ),
                      )
                      // Container(
                      //   // padding: EdgeInsets.symmetric(vertical: 25.0),
                      //   width: double.infinity,
                      //   // alignment: Alignment.centerRight,
                      //   child: ElevatedButton(
                      //     style: ElevatedButton.styleFrom(
                      //       backgroundColor: Colors.white,
                      //       // padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                      //     ),
                      //     onPressed: () async {
                      //       widget.toggle(1);
                      //     },
                      //     child: Text(
                      //       'Register as Student',
                      //       style: TextStyle(
                      //         color: Color(0XFF61A4F1),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // // SizedBox(
                      // //   height: 10.0,
                      // // ),
                      // Container(
                      //   // padding: EdgeInsets.symmetric(vertical: 25.0),
                      //   width: double.infinity,
                      //   // alignment: Alignment.centerRight,
                      //   child: ElevatedButton(
                      //     style: ElevatedButton.styleFrom(
                      //       backgroundColor: Colors.white,
                      //       // padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                      //     ),
                      //     onPressed: () async {
                      //       widget.toggle(2);
                      //     },
                      //     child: Text(
                      //       'Register as Admin',
                      //       style: TextStyle(
                      //         color: Color(0XFF61A4F1),
                      //       ),
                      //     ),
                      //   ),
                      // ),


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
CardField(
    Size size,
    Color color,
    IconButton icon,
    String title,
    ) {
  return Padding(
      padding: const EdgeInsets.fromLTRB(5, 5 , 5 , 20),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        elevation: 0,
        shadowColor: Colors.white,
        child: SizedBox(
            height: 80,
            width: 80,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: color,
                    child: icon,
                  ),
                  SizedBox(height: 1),
                  Text(
                    title,
                    style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w400,
                        fontSize: 10),
                  ),
                ]
            )
        ),
      )
  );
}