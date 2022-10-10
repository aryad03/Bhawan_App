import 'package:flutter/material.dart';
import '../utils/laundryCommonElements.dart';

class LaundryStatusUser extends StatefulWidget {
  const LaundryStatusUser({Key? key}) : super(key: key);

  @override
  State<LaundryStatusUser> createState() => _LaundryStatusUserState();
}

class _LaundryStatusUserState extends State<LaundryStatusUser> {
  String status = 'Clothes are ready';

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          LaundryBar(),
          SizedBox(height: 280.0,),
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
