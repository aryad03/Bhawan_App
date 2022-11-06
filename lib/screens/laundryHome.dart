import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user_auth.dart';
import '../services/database_laundry.dart';
import '../utils/button.dart';

var no_of_clothes = [ '3' , '4', '5', '6', '7', '8', '9', '10'];

class LaundryUserPage extends StatefulWidget {
  const LaundryUserPage({Key? key}) : super(key: key);

  @override
  State<LaundryUserPage> createState() => _LaundryUserPageState();
}

class _LaundryUserPageState extends State<LaundryUserPage> {

  final _formKey = GlobalKey<FormState>();

  String _no_of_clothes_selected = no_of_clothes.first;
  late String _roomnumber;
  String error = '';

  @override
  Widget build(BuildContext context) {
    final userdata = Provider.of<UserLaundry?>(context);
    final userData = Provider.of<UserDataGlobal>(context);
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
             child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SingleChildScrollView(
                 child: Form(
                   key: _formKey,
                   child: Column(
                   children: [
                     SizedBox(height: 30,),
                     Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                       NoOfClothes(),
                       SizedBox(width: 15.0,),
                       Container(
                         child: DropdownButton(
                           value: _no_of_clothes_selected,
                           icon: Icon(Icons.keyboard_arrow_down),
                           items: no_of_clothes.map((String selected_value) {
                             return DropdownMenuItem(
                               value: selected_value,
                               child: Text(selected_value),
                             );
                           }).toList(),
                           onChanged: (String? selected_clothes) {
                             setState(() {
                               _no_of_clothes_selected = selected_clothes!;
                             });
                           },
                         ),

                       ),
                     ]
                     ),
                     SizedBox(height: 23.0,),
                     Button('Send Request', () async {
                       if (_formKey.currentState!.validate() &&
                           userdata!.inproccess == false) {
                         // print(_roomnumber);
                         await DataBaseLaundry(uid: userdata!.id, bhawan: userData.bhawan)
                             .updateData(userData.name,
                           userData.room_number ?? '', _no_of_clothes_selected ?? '', true,);
                       }
                     }),
                   ],
              ),
                 )
          )
        ]
      ),
    ),
      ),
    );
  }
}


class NoOfClothes extends StatelessWidget {
  const NoOfClothes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 25.0),
          Text(
            'Number of Clothes',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
        ]
    );
  }
}

class NoOfClothesInput extends StatefulWidget {
  const NoOfClothesInput({Key? key}) : super(key: key);

  @override
  State<NoOfClothesInput> createState() => _NoOfClothesInputState();
}

class _NoOfClothesInputState extends State<NoOfClothesInput> {
  String no_of_clothes_selected = no_of_clothes.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButton(
        value: no_of_clothes_selected,
        icon: Icon(Icons.keyboard_arrow_down),
        items: no_of_clothes.map((String selected_value) {
          return DropdownMenuItem(
            value: selected_value,
            child: Text(selected_value),
          );
        }).toList(),
        onChanged: (String? selected_clothes) {
          setState(() {
            no_of_clothes_selected = selected_clothes!;
          });
        },
      ),

    );
  }
}


