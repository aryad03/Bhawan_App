import 'package:flutter/material.dart';
import '../utils/button.dart';

class EntryExitAdminList extends StatefulWidget {

  // final String room_number;
  // final String no_of_clothes;
  final String name;
  final String enrollment_number;
  final bool statususer;
  final VoidCallback delete;
  EntryExitAdminList(this.name,this.enrollment_number,this.delete,this.statususer);

  @override
  State<EntryExitAdminList> createState() => _EntryExitAdminListState();
}

class _EntryExitAdminListState extends State<EntryExitAdminList> {



  @override
  Widget build(BuildContext context) {
    String comment =widget.statususer?'Approve Exit':'Approve Entry';
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
                color: Colors.blue[800],
              ),
            ),
            // SizedBox(width: 50.0,),
            // Spacer(),
            Text(
              'Enrollment Number: ${widget.enrollment_number}',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                color: Colors.blue[800],
              ),
            ),
            // Spacer(),
            Button(comment,widget.delete)
          ],
        ),
      ),
    );
  }
}