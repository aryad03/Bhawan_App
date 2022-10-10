import 'package:bhawan_app/utils/otpInput.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import '../utils/button.dart';
import '../utils/constants.dart';

void main2() => runApp(otp());

class otp extends StatefulWidget {
  const otp({Key? key}) : super(key: key);

  @override
  State<otp> createState() => _otpState();
}

class _otpState extends State<otp> {
  final TextEditingController first = TextEditingController();
  final TextEditingController second = TextEditingController();
  final TextEditingController third = TextEditingController();
  final TextEditingController fourth = TextEditingController();
  final TextEditingController fifth = TextEditingController();
  final TextEditingController sixth = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: kPrimaryColor,
      ),
      home: Scaffold(
        resizeToAvoidBottomInset : false,
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          title: Text(
            'OTP Verification',
          ),
          backgroundColor: kPrimaryColor,
        ),
        body: Container(
          child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Verification Code',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'We have sent a 6-digit code to your email-Id',
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OtpInput(first, true),
                    OtpInput(second, false),
                    OtpInput(third, false),
                    OtpInput(fourth, false),
                    OtpInput(fifth, false),
                    OtpInput(sixth, false),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Button(
                  'Verify',
                  main,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

