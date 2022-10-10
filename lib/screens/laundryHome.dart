import 'package:flutter/material.dart';
import '../utils/button.dart';
import '../utils/laundryCommonElements.dart';

var no_of_clothes = [ '3' , '4', '5', '6', '7', '8', '9', '10'];

class LaundryUserPage extends StatefulWidget {
  const LaundryUserPage({Key? key}) : super(key: key);

  @override
  State<LaundryUserPage> createState() => _LaundryUserPageState();
}

class _LaundryUserPageState extends State<LaundryUserPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        LaundryBar(),
        SizedBox(height:55.0),
        Center(
          child: Text(
            textAlign: TextAlign.center,
            'Get your clothes cleaned',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.w600,

            ),
          ),
        ),
        SizedBox(height: 30,),
        RoomNumber(),
        SizedBox(height: 17.0,),
        RoomNumberInput(),
        SizedBox(height: 23.0,),
        Row(children: [
          NoOfClothes(),
          SizedBox(width: 15.0,),
          NoOfClothesInput(),
        ]
        ),
        SizedBox(height: 23.0,),
        Button('Send Request',() {}),
      ],
    );
  }
}


class RoomNumber extends StatelessWidget {
  const RoomNumber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          SizedBox(width: 25.0),
          Text(
            'Room Number',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
        ]
    );
  }
}

class RoomNumberInput extends StatefulWidget {
  const RoomNumberInput({Key? key}) : super(key: key);

  @override
  State<RoomNumberInput> createState() => _RoomNumberInputState();
}

class _RoomNumberInputState extends State<RoomNumberInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0,0.0,15.0,0.0),
      child: Container(
        child: TextField(
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              label: Text('Enter Room Number')
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


