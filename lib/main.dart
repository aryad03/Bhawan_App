import 'dart:async';
import 'package:bhawan_app/screens/wrapper.dart';
import 'package:bhawan_app/services/auth.dart';
import 'package:bhawan_app/utils/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'models/user_auth.dart';
import 'utils/constants.dart';
import 'screens/clientLogin.dart';
// import 'package:splashscreen/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserAuth?>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: mySplash(),
      ),
    );
  }
}