import 'package:bhawan_app/models/user_auth.dart';
import 'package:bhawan_app/screens/EntryExit.dart';
import 'package:bhawan_app/services/database_entryexit.dart';
import 'package:bhawan_app/utils/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Widget StatusEntryExit(String uid,String bhawan) {return Entry_Denied(uid:uid,bhawan:bhawan);}
class StatusEntryExit extends StatelessWidget {

    String s = "Your Request has been accepted";
    String s1 = "Your Request is pending";
    String sres = "";
    /*if(){
    sres = s;
  }
  else{
    sres = s1;
  }*/
    @override
    Widget build(BuildContext context) {
      //
      final user = Provider.of<UserAuth>(context);
      final userData = Provider.of<UserDataGlobal>(context);
      return StreamBuilder<UserEntryExitStatus>(
          stream: DatabaseEntryExit(uid: user.uid,Bhawan: userData.bhawan).status,
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              UserEntryExitStatus? userentry = snapshot.data;
              // print(userentry!.request);
              sres=userentry!.request?s1:s;
              return MaterialApp(
                theme: ThemeData(
                  primarySwatch: Colors.purple,
                ),
                home: Scaffold(
                  backgroundColor: Colors.white,
                  body: Center(
                    child: Text(sres),
                  ),
                ),
              );
            }
            else{
              return Loading();
            }
          }
      );
    }
  }

