import 'package:bhawan_app/models/user_auth.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/database_laundry.dart';
import '../utils/laundryCommonElements.dart';
import '../utils/loading.dart';
import 'laundry_admin_list.dart';

class LaundryAdminPage extends StatefulWidget {
  const LaundryAdminPage({Key? key}) : super(key: key);

  @override
  State<LaundryAdminPage> createState() => _LaundryAdminPageState();
}

class _LaundryAdminPageState extends State<LaundryAdminPage> {
  List<UserData> Data = [
    UserData(name: 'Arya Deshmukh', no_of_clothes: '10', room_number: 'B419'),
    UserData(name: 'Ayush Patel', no_of_clothes: '9', room_number: 'B444')
  ];


  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserDataGlobal>(context);

    final user = Provider.of<UserAuth>(context);

    return StreamBuilder<List<UserLaundry>>(
      stream: DataBaseLaundry(uid: user.uid,bhawan: userData.bhawan).users,
      builder: (context, snapshot) {
        if(snapshot.hasData){
        List<UserLaundry>? users =snapshot.data;
        if(users?.length==0) users=[];
        return Column(
          children: [
            LaundryBar(),
            SizedBox(height: 35.0,),
            Center(
              child: Text(
                'List of Students',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: 20.0,),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: users!.map((UserLaundry user) {
                    // print(user.roomnumber);
                    if (user.inproccess == true) {
                      return LaundryAdminList(
                          user.name, user.roomnumber, user.clothes,
                              () async {
                            print(user.id);
                            await DataBaseLaundry(
                                uid: user.id, bhawan: userData.bhawan).updateData(
                              user.name,
                                user.roomnumber, user.clothes, false);
                            setState(() {
                              // Data.remove(user);
                              // await DataBaseLaundry(uid: user1!.uid,bhawan: 'Rajiv Bhawan').updateData(user.roomnumber, user.clothes,false);
                            });
                          });
                    }
                    else {
                      return Container();
                    }
                  }
                  ).toList(),
                ),
              ),
            )
          ],
        );}
        else
          return Column(
              children: [
              LaundryBar(),
        SizedBox(height: 35.0,),
        Center(
        child: Text(
        'List of Students',
        style: TextStyle(
        fontSize: 25.0,
        fontWeight: FontWeight.w400,
        ),
        ),
        ),
        SizedBox(height: 20.0,),
        ]
          );
      }
    );
  }
}