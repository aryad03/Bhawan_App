import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:bhawan_app/screens/homePage.dart';

Mess() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(appBar: AppBar(backgroundColor: Color(0xFF6CA8F1), elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () { Navigator.of(context).pop(context);
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> HomePage()));
              },
            );
          },
        ),
        title: Text('Mess Menu'),
      ),
        body: Stack(
          children: [
            // Container(
            //   color: Color.fromARGB(255, 177, 175, 175),
            //   padding: EdgeInsets.all(10),
            //   height: 52,
            //   width: MediaQuery.of(context).size.width,
            //   child: SizedBox(
            //     height: 56.0,
            //
            //     child: Text('Mess Menu',
            //         style:
            //             TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            //   ),
            // ),
            Container(
              alignment: Alignment.center,
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF73AEF5),
                    Color(0XFF61A4F1),
                    Color(0xFF478DE0 ),
                    Color(0xFF398AE5),
                  ],
                  stops: [0.1, 0.4, 0.7, 0.9],
                ),
              ),
            ),
            // Container(
            //   height: double.infinity,
            //   child: SingleChildScrollView(
            //     physics: AlwaysScrollableScrollPhysics(),
            //     padding: EdgeInsets.symmetric(
            //       horizontal: 40.0,
            //       // vertical: 120.0,
            //     ),
            //     child: Column(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           Text(
            //             'Register your Complain',
            //             style: TextStyle(
            //               color: Colors.white,
            //               fontFamily: 'OpenSans',
            //               fontSize: 30.0,
            //               fontWeight: FontWeight.bold,
            //             ),
            //           ),
            //         ]),
            //   ),),
                SizedBox(height: 30,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: [
                      DataColumn(
                        label: Text('Day',style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'OpenSans',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),),
                      ),
                      DataColumn(
                        label: Text('Breakfast',style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'OpenSans',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),),
                      ),
                      DataColumn(
                        label: Text('Lunch',style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'OpenSans',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),),
                      ),
                      DataColumn(
                        label: Text('Dinner',style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'OpenSans',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),),
                      ),
                    ],
                    rows: [
                      DataRow(
                        cells: [
                          DataCell(Text('Monday',style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'OpenSans',
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),)),
                          DataCell(Text('Paratha')),
                          DataCell(Text('Rajma')),
                          DataCell(Text('Dum-Aalu')),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(Text('Tuesday',style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'OpenSans',
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),)),
                          DataCell(Text('Poha')),
                          DataCell(Text('Alu-Matar')),
                          DataCell(Text('Noodle')),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(Text('Wednesday',style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'OpenSans',
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),)),
                          DataCell(Text('Masala-dosa')),
                          DataCell(Text('Besan-Pakoda')),
                          DataCell(Text('Matar Paneer')),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(Text('Thursday',style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'OpenSans',
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),)),
                          DataCell(Text('Idli')),
                          DataCell(Text('Alu-Bega')),
                          DataCell(Text('Loki')),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(Text('Friday',style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'OpenSans',
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),)),
                          DataCell(Text('Samosa')),
                          DataCell(Text('Dal-arhar')),
                          DataCell(Text('Bhindi')),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(Text('Saturday',style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'OpenSans',
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),)),
                          DataCell(Text('Chhole-Puri')),
                          DataCell(Text('Besan-Gatta')),
                          DataCell(Text('Shahi-Paneer')),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(Text('Sunday',style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'OpenSans',
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),)),
                          DataCell(Text('Pakode')),
                          DataCell(Text('Alu-Palak')),
                          DataCell(Text('Mix-Veg')),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(Text('Common',style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'OpenSans',
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),)),
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
        ]
            ),
            ),
            // Container(
            //   alignment: Alignment.center,
            //   child: Text(
            //     "7 Nov'22 to 13 Nov'22",
            //     style: TextStyle(fontSize: 18,
            //         color: Colors.black,
            //         decoration: TextDecoration.underline,
            //         decorationStyle: TextDecorationStyle.double
            //     ),
            //   ),
            // ),



    );
  }
}
