import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PastComplaints extends StatelessWidget {
  const PastComplaints({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        body: Column(
          children: [
            Container(
              color: Color.fromARGB(255, 177, 175, 175),
              padding: EdgeInsets.all(10),
              height: 50,
              width: 400,
              child: SizedBox(
                height: 56.0,
                child: Text('Complain System',
                    style:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
            ),
            Container(
              height: 30,
              width: 400,
              child: SizedBox(),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "Your past complaints",
                style: TextStyle(fontSize: 22, color: Colors.black),
              ),
            ),
            Container(
              height: 30,
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
                rows: [
                  DataRow(
                    cells: [
                      DataCell(Text('Arshik')),
                      DataCell(Text('Mess')),
                      DataCell(Text('08/12/22')),
                      DataCell(Text('XYZ')),
                      DataCell(Text('Solved')),
                      DataCell(Text('ABC')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('Arshik')),
                      DataCell(Text('Electrical')),
                      DataCell(Text('08/12/22')),
                      DataCell(Text('XYZ')),
                      DataCell(Text('Solved')),
                      DataCell(Text('ABC')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('Arshik')),
                      DataCell(Text('Maintainance')),
                      DataCell(Text('08/12/22')),
                      DataCell(Text('XYZ')),
                      DataCell(Text('Solved')),
                      DataCell(Text('ABC')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('Arshik')),
                      DataCell(Text('Electrical')),
                      DataCell(Text('08/12/22')),
                      DataCell(Text('XYZ')),
                      DataCell(Text('Solved')),
                      DataCell(Text('ABC')),
                    ],
                  ),
                  // DataRow(cells: [
                  //   DataCell(Text('Arshik')),
                  // DataCell(Text('Mess')),
                  // DataCell(Text('DD/MM/YYYY')),
                  // DataCell(Text('XYZ')),
                  // DataCell(Text('Solved')),
                  // DataCell(Text('ABC')),
                  // ],
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
