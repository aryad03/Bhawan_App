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

    return Column(
        children: [
          SizedBox(height: 220.0,),
          Center(
            child: Container(
              child: Text(
                status,
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ]
    );
  }
}
