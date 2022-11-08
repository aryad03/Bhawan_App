import 'package:bhawan_app/utils/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../models/user_auth.dart';

class PastComplaints extends StatelessWidget {

  List<DataRow> _generateInProgress(List<UserComplain> user){
    List<UserComplain> userinprogress=[];
    // int j=0;
    for(int i=0;i<user.length;i++){
      if(user[i].inproccess==false){
        userinprogress.add(user[i]);
      }
    }

    List<DataRow> data = userinprogress.map<DataRow>(
            (user){
          return DataRow(
              cells: [
                DataCell(Text(user.name)),
                DataCell(Text(user.complaintype)),
                DataCell(Text('date')),
                DataCell(Text('Solved')),
                DataCell(Text(user.description)),
                DataCell(Text('Remark'))
              ]
          );
        }
    ).toList();
    if(data.length==0) data=[];
    return data;
  }

  @override
  Widget build(BuildContext context) {
    final usercomplain = Provider.of<List<UserComplain>?>(context);
    if(usercomplain!=null){
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        body: Column(
          children: [
            Container(
              height: 15,
              width: 400,
              child: SizedBox(),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "Your past complaints",
                style: TextStyle(
                  color: Color(0XFF61A4F1),
                  fontFamily: 'OpenSans',
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: 15,
              width: 400,
              child: SizedBox(),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  DataColumn(
                    label: Text('Name'),
                  ),
                  DataColumn(
                    label: Text('Department'),
                  ),
                  DataColumn(
                    label: Text('Date'),
                  ),
                  DataColumn(
                    label: Text('Description'),
                  ),
                  DataColumn(
                    label: Text('Status'),
                  ),
                  DataColumn(
                    label: Text('How it is resolved?'),
                  ),
                ],
                rows: _generateInProgress(usercomplain),

              ),
            ),
          ],
        ),
      ),
    );}
    else{
      return Loading();
    }
  }
}
