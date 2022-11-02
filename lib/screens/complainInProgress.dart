import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ComplaintsInProgress extends StatelessWidget {
  const ComplaintsInProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Container(
              color: Color.fromARGB(255, 177, 175, 175),
              padding: EdgeInsets.all(10),
              height: 52,
              width: MediaQuery.of(context).size.width,
              child: SizedBox(
                height: 52.0,
                width: MediaQuery.of(context).size.width,
                child: Text('Complain System',
                    style:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
            ),
            Container(
              height: 15,
              width: MediaQuery.of(context).size.width,
              child: SizedBox(),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "Complaints in progress",
                style: TextStyle(fontSize: 20, color: Colors.black),
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
                rows: [
                  DataRow(
                    cells: [
                      DataCell(Text('Arshik')),
                      DataCell(Text('Mess')),
                      DataCell(Text('08/12/22')),
                      DataCell(Text('XYZ')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('Arshik')),
                      DataCell(Text('Electrical')),
                      DataCell(Text('08/12/22')),
                      DataCell(Text('XYZ')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('Arshik')),
                      DataCell(Text('Maintainance')),
                      DataCell(Text('08/12/22')),
                      DataCell(Text('XYZ')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('Arshik')),
                      DataCell(Text('Electrical')),
                      DataCell(Text('08/12/22')),
                      DataCell(Text('XYZ')),
                    ],
                  ),
                  // DataRow(cells: [
                  //   DataCell(Text('Arshik')),
                  // DataCell(Text('Mess')),
                  // DataCell(Text('DD/MM/YYYY')),
                  // DataCell(Text('XYZ')),

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
