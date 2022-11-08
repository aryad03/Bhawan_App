import 'package:bhawan_app/models/user_auth.dart';
import 'package:bhawan_app/screens/homePage.dart';
import 'package:bhawan_app/utils/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'laundryHome.dart';
import 'laundryStatus.dart';

// void main4() => runApp(TemplateUser());

class TemplateUser extends StatefulWidget {
  const TemplateUser({Key? key}) : super(key: key);

  @override
  State<TemplateUser> createState() => _TemplateStateUser();
}

class _TemplateStateUser extends State<TemplateUser> {

  List<Widget> _children = [
    LaundryUserPage(),
    LaundryStatusUser()
  ];

  int currentIndex = 0;

  void onTab(int index){
    setState(() {
      currentIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {

    final userdata1 = Provider.of<UserLaundry?>(context);

    if(userdata1==null)
     return Loading();
    else {
      if (userdata1.inproccess != false) currentIndex = 1;

      return MaterialApp(
        // theme: ThemeData(
        //   primarySwatch: Colors.purple,
        // ),
        home: Scaffold(
          backgroundColor: Color(0xFF73AEF5),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).pop(TemplateUser());
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                );
              },
            ),
            // title: Text("Laundry System"),
          ),
          body: _children[currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            elevation: 0,
            currentIndex: currentIndex,
            backgroundColor: Color(0xFF398AE5),
            selectedItemColor: Colors.amber,
            unselectedItemColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            // selectedItemColor: Colors.purple,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.check),
                label: 'Status',
              ),
            ],
            onTap: onTab,
          ),
        ),
      );
    }
  }
}
