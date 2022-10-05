import 'package:bhawan_app/utils/constants.dart';
import 'package:flutter/material.dart';

class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final bool autofocus;
  // const otpInput({Key? key}) : super(key: key);
  OtpInput(this.controller, this.autofocus);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 60,
      child: TextField(
        autofocus: autofocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: controller,
        maxLength: 1,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          counterText: '',
          hintStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        onChanged: (value){
          if(value.length == 1){
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}
