import 'package:bhawan_app/screens/wrapper.dart';
import 'package:bhawan_app/services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'models/user_auth.dart';
import 'utils/constants.dart';
import 'screens/clientLogin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserAuth?>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        home: Wrapper(),
      ),
    // return MediaQuery(
    //   data: MediaQueryData(),
    //   child: MaterialApp(
    //     home: LoginPage(),
    //   ),
    );
  }
}