import 'package:bhawan_app/models/user_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/laundryCommonElements.dart';

class LaundryStatusUser extends StatefulWidget {
  const LaundryStatusUser({Key? key}) : super(key: key);

  @override
  State<LaundryStatusUser> createState() => _LaundryStatusUserState();
}

class _LaundryStatusUserState extends State<LaundryStatusUser> {
  String status = '';

  @override
  Widget build(BuildContext context) {

    final userdata = Provider.of<UserLaundry>(context);

    if(userdata.inproccess==false) status='Clothes are ready';
    else status='Clothes are not ready';

    return Container(
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text(
        status,
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'OpenSans',
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
      )
      ],
    ),
    );
  }
}
