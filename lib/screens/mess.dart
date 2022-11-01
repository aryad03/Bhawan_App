import 'package:bhawan_app/screens/mess.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'utils/constants.dart';
import 'screens/clientLogin.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
              height: 52,
              width: 400,
              child: SizedBox(
                height: 56.0,
                child: Text('Information',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
            ),
            Container(
              height: 15,
              width: 400,
              child: SizedBox(),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "Mess Menu",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
            Container(
              height: 20,
              width: 200,
              child: SizedBox(),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  DataColumn(
                    label: Text('Day & Date'),
                  ),
                  DataColumn(
                    label: Text('Breakfast'),
                  ),
                  DataColumn(
                    label: Text('Lunch'),
                  ),
                  DataColumn(
                    label: Text('Dinner'),
                  ),
                ],
                rows: [
                  DataRow(
                    cells: [
                      DataCell(Text('Monday')),
                      DataCell(Text('Paratha')),
                      DataCell(Text('Rajma')),
                      DataCell(Text('Dum-Aalu')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('Tuesday')),
                      DataCell(Text('Poha')),
                      DataCell(Text('Alu-Matar')),
                      DataCell(Text('Noodle')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('Wednesday')),
                      DataCell(Text('Masala-dosa')),
                      DataCell(Text('Besan-Pakoda')),
                      DataCell(Text('Matar Paneer')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('Thursday')),
                      DataCell(Text('Idli')),
                      DataCell(Text('Alu-Bega')),
                      DataCell(Text('Loki')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('Friday')),
                      DataCell(Text('Samosa')),
                      DataCell(Text('Dal-arhar')),
                      DataCell(Text('Bhindi')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('Saturday')),
                      DataCell(Text('Chhole-Puri')),
                      DataCell(Text('Besan-Gatta')),
                      DataCell(Text('Shahi-Paneer')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('Sunday')),
                      DataCell(Text('Pakode')),
                      DataCell(Text('Alu-Palak')),
                      DataCell(Text('Mix-Veg')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('Common')),
                      DataCell(Text('Milk, Jam, Butter')),
                      DataCell(Text('Roti, Dal, Rice')),
                      DataCell(Text('Roti, Dal, Rice')),
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
