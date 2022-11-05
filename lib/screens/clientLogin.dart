import 'package:flutter/material.dart';
import '../services/auth.dart';
import '../utils/loading.dart';
import '/utils/constants.dart';
import '../utils/button.dart';
import '/screens/clientRegistration.dart';
import 'homePage.dart';

class LoginPage extends StatefulWidget {

  final Function toggle;
  LoginPage({required this.toggle});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';
  String _error = '';
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return _loading ? Loading() : MaterialApp(
      theme: ThemeData(
        primarySwatch: kPrimaryColor,
      ),
      home: Scaffold(
        // resizeToAvoidBottomInset : false,
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          title: const Text(
            'Bhawan App',
          ),
          centerTitle: true,
          backgroundColor: kPrimaryColor,
        ),
        body: SingleChildScrollView(
          child: Column(
            // mainAxisSize: MainAxisSize.max,
            children: [
              SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Container(
                              child: Image(
                                image: AssetImage('images/logo.jpg'),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(15.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            labelText: 'Email',
                            hintText: 'Enter your email-id here',
                          ),
                          validator: (val) => (val!.isEmpty) ? 'Enter an emailId' : null,
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
                            labelText: 'Password',
                            hintText: 'Enter your Password here',
                          ),
                          validator: (val) => (val!.length < 6) ? 'Enter a password atleast 6 characters long' : null,
                          onChanged: (val){
                            setState(() => _password = val);
                          },
                          obscureText: true,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(15.0),
                        child: Container(
                          width: 150,
                          child: ElevatedButton(
                            onPressed: () {
                              widget.toggle();
                            },
                            child: Text('Sign Up'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(15.0),
                        child: Container(
                          width: 150,
                          child: ElevatedButton(
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
                            child: Text('Sign In'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Text(_error),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}