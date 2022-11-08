import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user_auth.dart';
import '../services/database_laundry.dart';
import '../utils/button.dart';
import '../utils/constants.dart';

var no_of_clothes = [ '3' , '4', '5', '6', '7', '8', '9', '10'];
String? selectedValue;
class LaundryUserPage extends StatefulWidget {
  const LaundryUserPage({Key? key}) : super(key: key);

  @override
  State<LaundryUserPage> createState() => _LaundryUserPageState();
}

class _LaundryUserPageState extends State<LaundryUserPage> {

  final _formKey = GlobalKey<FormState>();

  String _no_of_clothes_selected = no_of_clothes.first;
  String error = '';

  @override
  Widget build(BuildContext context) {
    final userdata = Provider.of<UserLaundry?>(context);
    final userData = Provider.of<UserDataGlobal>(context);
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
            resizeToAvoidBottomInset: false,
              body: Stack(
                children: [
                Container(
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
            Container(
                height: double.infinity,
                child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                        horizontal: 40.0,
                        vertical: 120.0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Give your laundry',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'OpenSans',
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Name : ${userData.name}',
                                style: kLabelStyle,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'Room Number : ${userData.room_number}',
                                style: kLabelStyle,
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
                              Text(
                                'Number of clothes',
                                style: kLabelStyle,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                decoration: kBoxDecorationStyle,
                                height: 60.0,
                                // padding: EdgeInsets.all(15.0),
                                child: DropdownButtonFormField2(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    // contentPadding: EdgeInsets.only(top:14.0),
                                    prefixIcon: Icon(
                                      Icons.question_mark_outlined,
                                      color: Colors.white,
                                    ),
                                    hintText: 'Select the number',
                                    hintStyle: kHintTextStyle,
                                  ),
                                  isExpanded: true,
                                  icon: const Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.white,
                                  ),
                                  iconSize: 30,
                                  buttonHeight: 60,
                                  buttonPadding: const EdgeInsets.only(left: 15, right: 15),
                                  items: no_of_clothes
                                      .map((item) =>
                                      DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ))
                                      .toList(),
                                  validator: (value) {
                                    if (value == null) {
                                      return 'Please select number of clothes.';
                                    }
                                  },
                                  dropdownDecoration: BoxDecoration(
                                    color: Color(0xFF6CA8F1),
                                  ),
                                  onChanged: (value) {
                                    //Do something when changing the item if you want.
                                    setState(() {
                                      _no_of_clothes_selected = value! as String;
                                    });
                                  },
                                  onSaved: (value) {
                                    selectedValue = value.toString();
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          Container(
                            // padding: EdgeInsets.symmetric(vertical: 25.0),
                            width: double.infinity,
                            // alignment: Alignment.centerRight,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(30.0),
                                ),
                                padding: EdgeInsets.symmetric(vertical: 15),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState!.validate() &&
                                  userdata!.inproccess == false) {
                                      await DataBaseLaundry(uid: userdata!.id, bhawan: userData.bhawan)
                                      .updateData(userData.name,
                                        userData.room_number ?? '', _no_of_clothes_selected ?? '', true,);
                                  }
                                },
                              child: Text(
                                'Send Request',
                                style: TextStyle(
                                  color: Color(0XFF61A4F1),
                                ),
                              ),
                            ),
                          ),
                           ],
                      ),
                         )
                  )
            ),
            ],
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


