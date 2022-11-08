import 'package:flutter/material.dart';

const kBackgroundColor = Colors.white;
const kPrimaryColor = Colors.purple;
const kSecondaryColor = Color(0xFF265DAB);

final kHintTextStyle = TextStyle(
  color: Colors.white54,
  fontSize: 10.0,
  fontFamily: 'OpenSans',
);

final kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kBoxDecorationStyle = BoxDecoration(
  color: Color(0xFF6CA8F1),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);
