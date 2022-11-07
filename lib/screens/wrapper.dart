import 'package:bhawan_app/screens/authenticate.dart';
import 'package:bhawan_app/screens/clientDecider.dart';
import 'package:bhawan_app/screens/clientLogin.dart';
import 'package:bhawan_app/screens/homePage.dart';
import 'package:bhawan_app/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_auth.dart';
import 'clientRegistration.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserAuth?>(context);
    // print(user);
    if(user == null){
      return Authenticate();
    }
    else{
      return StreamProvider<UserDataGlobal?>.value(
          value: DatabaseService(uid: user.uid).userInformation,
          initialData: null,
          child: Decider()
      );
    }
  }
}