import 'package:flutter/material.dart';

void mainEntry() => runApp(Entry_Denied());

class Entry_Denied extends StatefulWidget {
  const Entry_Denied({Key? key}) : super(key: key);

  @override
  State<Entry_Denied> createState() => _Entry_Denied_State();
}

class _Entry_Denied_State extends State<Entry_Denied> {
  String s = "Your Request has been accepted";
  String s1 = "Your Request has been denied";
  String sres = "";
  /*if(){
    sres = s;
  }
  else{
    sres = s1;
  }*/
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Entry Exit',
          ),
          centerTitle: true,
          backgroundColor: Colors.purple,
        ),
        body: Center(
          child:Text(sres),
        ),
      ),
    );
  }
}