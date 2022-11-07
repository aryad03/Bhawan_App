import 'package:flutter/material.dart';
import '../utils/button.dart';

class LaundryAdminList extends StatefulWidget {

  final String room_number;
  final String no_of_clothes;
  final String name;
  final VoidCallback delete;
  const LaundryAdminList(this.name,this.room_number,this.no_of_clothes,this.delete);

  @override
  State<LaundryAdminList> createState() => _LaundryAdminListState();
}

class _LaundryAdminListState extends State<LaundryAdminList> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Name: ${widget.name}',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            // SizedBox(width: 50.0,),
            // Spacer(),
            Text(
              'Room Number: ${widget.room_number}',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'No.of Clothes: ${widget.no_of_clothes}',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            // Spacer(),
            Button('Finished',widget.delete)
          ],
        ),
      ),
    );
  }
}


class UserData {
  String room_number;
  String no_of_clothes;
  String name;

  UserData({required this.name,required this.no_of_clothes,required this.room_number});
}