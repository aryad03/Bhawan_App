import 'package:bhawan_app/screens/clientLogin.dart';
import 'package:bhawan_app/screens/clientRegistration.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;
  void toggle(){
    setState(() => showSignIn = !showSignIn);
  }


  @override
  Widget build(BuildContext context) {
    print(showSignIn);
    return showSignIn ? LoginPage(toggle: toggle) : RegistrationPage(toggle: toggle);
  }
}