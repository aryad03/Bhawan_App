import 'package:flutter/material.dart';


class LaundryBar extends StatelessWidget {
  const LaundryBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [ Container(
        // margin: EdgeInsets.fromLTRB(, , 5.0, 0.0),

        color: Colors.grey[400],
        padding: EdgeInsets.all(10),
        height: 52,
        child:
              Text(
                'Laundry System',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
      ],
    );
  }
}
