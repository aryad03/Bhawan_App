import 'package:bhawan_app/utils/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../models/user_auth.dart';

class ComplaintsInProgress extends StatelessWidget {

  // final void Function(int) functionchange;
  //
  // ComplaintsInProgress({required this.functionchange});

  List<DataRow> _generateInProgress(List<UserComplain> user){
    List<UserComplain> userinprogress=[];
    // int j=0;
    for(int i=0;i<user.length;i++){
      if(user[i].inproccess==true){
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
                  DataCell(Text(user.description))
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
      home: Scaffold(
        body: Column(
          children: [
            // Container(
            //   color: Color.fromARGB(255, 177, 175, 175),
            //   padding: EdgeInsets.all(10),
            //   height: 52,
            //   width: MediaQuery.of(context).size.width,
            //   child: SizedBox(
            //     height: 52.0,
            //     width: MediaQuery.of(context).size.width,
            //     child: Text('Complain System',
            //         style:
            //         TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            //   ),
            // ),
            Container(
              height: 15,
              width: MediaQuery.of(context).size.width,
              child: SizedBox(),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "Complaints in progress",
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
                ],
                rows: _generateInProgress(usercomplain),
                // rows: [
                //   DataRow(
                //     cells: [
                //       DataCell(Text('Arshik')),
                //       DataCell(Text('Mess')),
                //       DataCell(Text('08/12/22')),
                //       DataCell(Text('XYZ')),
                //     ],
                //   ),
                //   DataRow(
                //     cells: [
                //       DataCell(Text('Arshik')),
                //       DataCell(Text('Electrical')),
                //       DataCell(Text('08/12/22')),
                //       DataCell(Text('XYZ')),
                //     ],
                //   ),
                //   DataRow(
                //     cells: [
                //       DataCell(Text('Arshik')),
                //       DataCell(Text('Maintainance')),
                //       DataCell(Text('08/12/22')),
                //       DataCell(Text('XYZ')),
                //     ],
                //   ),
                //   DataRow(
                //     cells: [
                //       DataCell(Text('Arshik')),
                //       DataCell(Text('Electrical')),
                //       DataCell(Text('08/12/22')),
                //       DataCell(Text('XYZ')),
                //     ],
                //   ),
                  // DataRow(cells: [
                  //   DataCell(Text('Arshik')),
                  // DataCell(Text('Mess')),
                  // DataCell(Text('DD/MM/YYYY')),
                  // DataCell(Text('XYZ')),

                  // ],
                  // ),
                // ],
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
