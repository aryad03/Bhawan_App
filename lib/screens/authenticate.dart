import 'package:bhawan_app/screens/adminRegistration.dart';
import 'package:bhawan_app/screens/clientLogin.dart';
import 'package:bhawan_app/screens/clientRegistration.dart';
import 'package:bhawan_app/screens/newClientRegistration.dart';
import 'package:bhawan_app/screens/newLogin.dart';
import 'package:flutter/material.dart';

import 'newClientAdmin.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  int showSignIn = 0;
  void toggle(int i){
    setState(() => showSignIn = i);
  }


  @override
  Widget build(BuildContext context) {
    // print(showSignIn);
    if(showSignIn == 0) {
      return LoginPage1(toggle: toggle);
    }
    else if(showSignIn == 1) {
      return RegistrationPage1(toggle: toggle);
    }
    else if(showSignIn==2){
      return RegistrationPageAdmin1(toggle: toggle);
    }
    else{
      return Container();
    }

    // return showSignIn ? LoginPage(toggle: toggle) : RegistrationPage(toggle: toggle);
  }
}