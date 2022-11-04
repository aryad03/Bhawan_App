import 'package:flutter/material.dart';
import 'Request_Denied.dart';
import '../utils/button.dart';
import 'package:bhawan_app/screens/homePage.dart';
import '../screens/Request_Denied.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

String? selectedValue;

var bhawan = [ 'Rajiv Bhawan', 'Rajendra Bhawan', 'Cautley Bhawan', 'Kasturba Bhawan', 'Jawhar Bhawan', 'Ravindra Bhawan', 'Sarojani Bhawan', 'Govind Bhawan', 'Ganga Bhawan', 'RadhaKrishn Bhawan', 'VigyanKunj'];
EnEx()=> runApp(EnExPage());
class EnExPage extends StatefulWidget {
  const EnExPage({Key? key}) : super(key: key);

  @override
  State<EnExPage> createState() => _HomeState();
}

class _HomeState extends State<EnExPage> {
  String bhawan_selected = bhawan.first;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    );
  }
}